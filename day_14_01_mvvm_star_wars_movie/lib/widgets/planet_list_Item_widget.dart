import 'package:day_14_01_mvvm_star_wars_movie/viewmodels/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlanetListItemWidget extends StatelessWidget {
  final PlanetCellViewModel planetCellVm;
  const PlanetListItemWidget({@required this.planetCellVm});

  Widget _buildTitleWidget(BuildContext context) {
    return Text(
      planetCellVm.name,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubTitleWidget(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Text(
            '${planetCellVm.terrain}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        FontAwesomeIcons.globeAmericas,
        size: 50,
        color: Colors.black,
      ),
      title: _buildTitleWidget(context),
      subtitle: _buildSubTitleWidget(context),
    );
  }
}
