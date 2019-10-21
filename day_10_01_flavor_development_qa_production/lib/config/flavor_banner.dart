import 'package:day_10_01_flavor_development_qa_production/config/device_info_dialog.dart';
import 'package:day_10_01_flavor_development_qa_production/config/flavor_config.dart';
import 'package:flutter/material.dart';

class FlavorBanner extends StatefulWidget {
  final Widget child;

  FlavorBanner({@required this.child});

  @override
  _FlavorBannerState createState() => _FlavorBannerState();
}

class _FlavorBannerState extends State<FlavorBanner> {
  BannerConfig bannerConfig;

  @override
  Widget build(BuildContext context) {
    if (FlavorConfig.isProduction()) return widget.child;

    bannerConfig ??= _getDefaultBanner();

    return Stack(
      children: <Widget>[widget.child, _buildBanner(context)],
    );
  }

  BannerConfig _getDefaultBanner() {
    return BannerConfig(
        bannerName: FlavorConfig.instance.name,
        bannerColor: FlavorConfig.instance.color);
  }

  Widget _buildBanner(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: 50,
        height: 50,
        child: CustomPaint(
          painter: BannerPainter(
              message: bannerConfig.bannerName,
              textDirection: Directionality.of(context),
              layoutDirection: Directionality.of(context),
              location: BannerLocation.topStart,
              color: bannerConfig.bannerColor),
        ),
      ),
      onLongPress: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return DeviceInfoDialog();
            });
      },
    );
  }
}

class BannerConfig {
  final String bannerName;
  final Color bannerColor;

  BannerConfig({@required this.bannerName, @required this.bannerColor});
}
