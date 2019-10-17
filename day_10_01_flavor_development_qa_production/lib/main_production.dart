import 'package:day_10_01_flavor_development_qa_production/my_app.dart';
import 'package:day_10_01_flavor_development_qa_production/config/flavor_config.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      Provider<FlavorConfig>.value(
        value: FlavorConfig(
          flavor: Flavor.PRODUCTION,
          //color: Colors.green,
          values: FlavorValues(
              baseUrl:
                  "https://appBits.com/flavorExsmpleApp/backend/production/"),
        ),
        child: MyApp(),
      ),
    );
