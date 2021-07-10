import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movieapp/bloc/movie_bloc.dart';
import 'package:movieapp/model/tv_season.dart';
import 'package:movieapp/model/tv_season_response.dart';
import 'package:movieapp/style/theme.dart' as Style;

class TVSeasonScreen extends StatefulWidget {
  int id, seasonNumber;

  TVSeasonScreen({Key key, @required this.id, @required this.seasonNumber})
      : super(key: key);

  @override
  _TVSeasonScreenState createState() => _TVSeasonScreenState(id, seasonNumber);
}

class _TVSeasonScreenState extends State<TVSeasonScreen> {
  int id, seasonNumber;

  _TVSeasonScreenState(this.id, this.seasonNumber);

  @override
  void initState() {
    super.initState();
    tvSeasonDetail.getTVSeasonDetail(id, seasonNumber);
  }

  @override
  void dispose() {
    super.dispose();
    tvSeasonDetail.drainStream();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TVSeasonResponse>(
      stream: tvSeasonDetail.subject.stream,
      builder: (context, AsyncSnapshot<TVSeasonResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildTVSeasonDetailWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [],
    ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
      ],
    ));
  }

  Widget _buildTVSeasonDetailWidget(TVSeasonResponse data) {
    TVSeasons detail = data.tvSeasons;
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 220.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://image.tmdb.org/t/p/original/" +
                                  detail.posterPath)),
                    )),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [
                          0.0,
                          0.9
                        ],
                        colors: [
                          Style.Colors.mainColor.withOpacity(1.0),
                          Style.Colors.mainColor.withOpacity(0.0)
                        ]),
                  ),
                ),
                Positioned(
                    bottom: 30.0,
                    child: Container(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      width: 250.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            detail.name,
                            style: TextStyle(
                                height: 1.5,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                    )),
                Positioned(
                    bottom: 10.0,
                    child: Container(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      width: 250.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            detail.airDate,
                            style: TextStyle(
                                height: 1.5,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "OVERVIEW",
              style: TextStyle(
                  color: Style.Colors.titleColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0),
            ),
            if (detail.overview.length > 0)
              Container(
                width: 340,
                child: Expanded(
                  child: Text(
                    detail.overview,
                    style: TextStyle(
                        height: 1.4,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 11.0),
                    maxLines: 20,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.justify,
                  ),
                ),
              )
            else
              Center(
                child: Text(
                  "Sorry, this season is not overview ",
                  style: TextStyle(
                      height: 1.4,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0),
                  maxLines: 20,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.justify,
                ),
              ),
            Container(
              height: 300,
              padding: EdgeInsets.all(5),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                        ListTile(
                          title: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 100.0,
                              decoration: new BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: new DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://image.tmdb.org/t/p/original/" +
                                            detail.episodes[index].stillPath)),
                              )),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name : ' + detail.episodes[index].name,
                                style: TextStyle(
                                    height: 1.4,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.0),
                              ),
                              Text(
                                'Air date : ' + detail.episodes[index].airDate,
                                style: TextStyle(
                                    height: 1.4,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.0),
                              ),
                              Text(
                                'Episode number : ' +
                                    detail.episodes[index].episodeNumber
                                        .toString(),
                                style: TextStyle(
                                    height: 1.4,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.0),
                              ),
                              Text(
                                'Total votes : ' +
                                    detail.episodes[index].voteCount.toString(),
                                style: TextStyle(
                                    height: 1.4,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.0),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Rated : ',
                                    style: TextStyle(
                                        height: 1.4,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11.0),
                                  ),
                                  Text(
                                    detail.episodes[index].voteAverage
                                        .toString(),
                                    style: TextStyle(
                                        height: 1.4,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11.0),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  RatingBar.builder(
                                    itemSize: 8.0,
                                    initialRating:
                                        detail.episodes[index].voteAverage / 2,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 2.0),
                                    itemBuilder: (context, _) => Icon(
                                      EvaIcons.star,
                                      color: Style.Colors.secondColor,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // ignore: deprecated_member_use
                      ]));
                },
                itemCount: detail.episodes.length,
                scrollDirection: Axis.vertical,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
