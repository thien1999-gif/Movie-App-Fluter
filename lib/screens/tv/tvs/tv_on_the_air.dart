import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movieapp/bloc/movie_bloc.dart';
import 'package:movieapp/model/tv.dart';
import 'package:movieapp/model/tv_response.dart';
import 'package:movieapp/screens/tv/tvs/tv_detail_screen.dart';
import 'package:movieapp/style/theme.dart' as Style;

class TVOnTheAir extends StatefulWidget {
  @override
  _TVOnTheAirState createState() => _TVOnTheAirState();
}

class _TVOnTheAirState extends State<TVOnTheAir> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 20.0),
          child: Text(
            "TV On The Air",
            style: TextStyle(
              color: Style.Colors.titleColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        StreamBuilder<TVResponse>(
          stream: tvOnTheAirBloc.subject.stream,
          builder: (context, AsyncSnapshot<TVResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.error != null &&
                  snapshot.data.error.length > 0) {
                return _buildLoadingErrorWidget(snapshot.data.error);
              }
              return _buildHomeWidget(snapshot.data);
            } else if (snapshot.hasError) {
              return _buildLoadingErrorWidget(snapshot.error);
            } else {
              return _buildLoadingWidget();
            }
          },
        ),
      ],
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 25.0,
              width: 25.0,
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 4.0,
              ),
            )
          ],
        ));
  }

  Widget _buildLoadingErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Error: $error"),
        ],
      ),
    );
  }

  Widget _buildHomeWidget(TVResponse data) {
    List<TV> tvs = data.tv;
    if (tvs.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "No More TV On The Air",
                  style: TextStyle(color: Colors.black45),
                )
              ],
            )
          ],
        ),
      );
    } else {
      return Container(
        height: 270.0,
        padding: EdgeInsets.only(left: 10.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tvs.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TVDetailScreen(tv: tvs[index])));
                },
                child: Column(
                  children: [
                    Container(
                        width: 120.0,
                        height: 180.0,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(2.0)),
                          shape: BoxShape.rectangle,
                          image: new DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://image.tmdb.org/t/p/w200/" +
                                      tvs[index].poster_path)),
                        )),
                    Container(
                      width: 120,
                      child: Text(
                        tvs[index].original_name,
                        style: TextStyle(
                            height: 1.4,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 11.0),
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          tvs[index].vote_average.toString(),

                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RatingBar.builder(
                          itemSize: 8.0,
                          initialRating: tvs[index].vote_average / 2,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => Icon(
                            EvaIcons.star,
                            color: Style.Colors.secondColor,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        )
                        ,SizedBox( width: 35,)
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    tvOnTheAirBloc.getTVOnTheAir();
  }
}
