import 'dart:async';

import 'package:day_14_01_mvvm_star_wars_movie/pages/characters_page.dart';
import 'package:day_14_01_mvvm_star_wars_movie/pages/films_page.dart';
import 'package:day_14_01_mvvm_star_wars_movie/pages/planets_page.dart';
import 'package:day_14_01_mvvm_star_wars_movie/viewmodels/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabcontroller;
  int numberOfTabs = 3;

  @override
  void initState() {
    super.initState();

    tabcontroller = TabController(length: numberOfTabs, vsync: this);
    //Initially fetch all, then we set watchDog on everyChangein this arrays by Provider
    Timer(Duration(seconds: 1), () {
      loadData();
    });
  }

  @override
  void dispose() {
    super.dispose();
    tabcontroller?.dispose();
  }

  Future loadData() async {
    await Provider.of<HomePageViewModel>(context, listen: false)
        .getAllFilmCellVm();
    await Provider.of<HomePageViewModel>(context, listen: false)
        .getAllCharacterCellVm();
    await Provider.of<HomePageViewModel>(context, listen: false)
        .getAllPlanetCellVm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Star Wars',
          style: GoogleFonts.fugazOne(fontSize: 25.0),
        ),
        bottom: TabBar(
          controller: tabcontroller,
          indicatorColor: Colors.white,
          indicatorWeight: 3.0,
          tabs: <Widget>[
            Tab(icon: Icon(FontAwesomeIcons.film)),
            Tab(icon: Icon(FontAwesomeIcons.globeAmericas)),
            Tab(icon: Icon(FontAwesomeIcons.user)),
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: tabcontroller,
          children: <Widget>[
            FilmListPage(),
            PlanetListPage(),
            CharacterListPage(),
          ],
        ),
      ),
    );
  }
}
