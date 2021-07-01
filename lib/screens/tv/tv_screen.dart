import 'package:flutter/material.dart';
import 'package:movieapp/screens/tv/tvs/tv_airing_today.dart';
import 'package:movieapp/screens/tv/tvs/tv_on_the_air.dart';
import 'package:movieapp/screens/tv/tvs/tv_popular.dart';
import 'package:movieapp/screens/tv/tvs/tv_top_rated.dart';
import 'package:movieapp/style/theme.dart' as Style;
class TVScreen extends StatefulWidget {
  @override
  _TVScreenState createState() => _TVScreenState();
}

class _TVScreenState extends State<TVScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      body: ListView(
        children: [
          TVPopular(),
          TVTopRated(),
          TVOnTheAir(),
          TVAiringToday(),
        ],
      ),
    );
  }
}
