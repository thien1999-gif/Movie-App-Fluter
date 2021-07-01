import 'package:flutter/material.dart';
import 'package:movieapp/bloc/movie_bloc.dart';
import 'package:movieapp/model/tv_detail.dart';
import 'package:movieapp/model/tv_detail_response.dart';
import 'package:movieapp/screens/tv/others/cast_tv.dart';
import 'package:movieapp/screens/tv/others/review_screen.dart';
import 'package:movieapp/screens/tv/tvs/tv_recomment_screen.dart';
import 'package:movieapp/screens/tv/tvs/tv_similar_screen.dart';
import 'package:movieapp/style/theme.dart' as Style;

class TVInfoScreen extends StatefulWidget {
  int id;

  TVInfoScreen({Key key, @required this.id}) : super(key: key);

  @override
  _TVInfoScreenState createState() => _TVInfoScreenState(id);
}

class _TVInfoScreenState extends State<TVInfoScreen> {
  int id;

  _TVInfoScreenState(this.id);

  @override
  void initState() {
    super.initState();
    tvDetailBloc.getTVDetail(id);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TVDetailResponse>(
      stream: tvDetailBloc.subject.stream,
      builder: (context, AsyncSnapshot<TVDetailResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildTVDetailWidget(snapshot.data);
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

  Widget _buildTVDetailWidget(TVDetailResponse data) {
    TVDetail detail = data.tvDetail;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        ),
        Text(
          "GENRES",
          style: TextStyle(
              color: Style.Colors.titleColor,
              fontWeight: FontWeight.w500,
              fontSize: 12.0),
        ),
        Container(
          height: 36,
          padding: EdgeInsets.only(right: 10.0, top: 10.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      border: Border.all(width: 1.0, color: Colors.white)),
                  child: Text(
                    detail.genres[index].name,
                    maxLines: 2,
                    style: TextStyle(
                        height: 1.4,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 9.0),
                  ),
                ),
              );
            },
            itemCount: detail.genres.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Cast",
          style: TextStyle(
              color: Style.Colors.titleColor,
              fontWeight: FontWeight.w500,
              fontSize: 12.0),
        ),
        TVCasts(id: detail.id),
        SizedBox(
          height: 10,
        ),
        Text(
          "CREATED BY",
          style: TextStyle(
              color: Style.Colors.titleColor,
              fontWeight: FontWeight.w500,
              fontSize: 12.0),
        ),
        Container(
          height: 271,
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: detail.createdBy.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if (detail.createdBy[index].profilePath != null)
                        Container(
                            width: 120.0,
                            height: 180.0,
                            decoration: new BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.0)),
                              shape: BoxShape.rectangle,
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w200/" +
                                          detail.createdBy[index].profilePath)),
                            ))
                      else
                        Container(
                          width: 120.0,
                          height: 180.0,
                          child: Image.asset('asset/images/chara-minions.png'),
                        ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: 100,
                        child: Text(
                          detail.createdBy[index].name,
                          maxLines: 2,
                          style: TextStyle(
                              height: 1.4,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 11.0),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Text(
          "Manufacturer",
          style: TextStyle(
              color: Style.Colors.titleColor,
              fontWeight: FontWeight.w500,
              fontSize: 12.0),
        ),
        Container(
          height: 36,
          padding: EdgeInsets.only(right: 10.0, top: 10.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      border: Border.all(width: 1.0, color: Colors.white)),
                  child: Text(
                    detail.networks[index].name,
                    maxLines: 2,
                    style: TextStyle(
                        height: 1.4,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 9.0),
                  ),
                ),
              );
            },
            itemCount: detail.networks.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Season",
          style: TextStyle(
              color: Style.Colors.titleColor,
              fontWeight: FontWeight.w500,
              fontSize: 12.0),
        ),
        Container(
          height: 280.0,
          padding: EdgeInsets.only(left: 10.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: detail.seasons.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             TVDetailScreen(tv: tvs[index])));
                  },
                  child: Column(
                    children: [
                      if (detail.seasons[index].posterPath != null)
                        Container(
                            width: 120.0,
                            height: 180.0,
                            decoration: new BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.0)),
                              shape: BoxShape.rectangle,
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w200/" +
                                          detail.seasons[index].posterPath)),
                            ))
                      else
                        Container(
                          width: 120.0,
                          height: 180.0,
                          child: Image.asset('asset/images/chara-minions.png'),
                        ),
                      Container(
                        width: 120,
                        child: Text(
                          detail.seasons[index].name,
                          style: TextStyle(
                              height: 1.4,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 11.0),
                        ),
                      ),
                      Container(
                        width: 120,
                        child: Text(
                          'Air date : ' + detail.seasons[index].airDate,
                          style: TextStyle(
                              height: 1.4,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 11.0),
                        ),
                      ),
                      Container(
                        width: 120,
                        child: Text(
                          'Episode count : ' +
                              detail.seasons[index].episodeCount.toString(),
                          style: TextStyle(
                              height: 1.4,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 11.0),
                        ),
                      ),
                      FlatButton(
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              border:
                                  Border.all(width: 1.0, color: Colors.white)),
                          child: Text(
                            'View detail',
                            maxLines: 2,
                            style: TextStyle(
                                height: 1.4,
                                color: Style.Colors.secondColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 9.0),
                          ),
                        ),
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => ,))
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Review",
          style: TextStyle(
              color: Style.Colors.titleColor,
              fontWeight: FontWeight.w500,
              fontSize: 12.0),
        ),
        ReviewScreen(id: detail.id),

        SizedBox(
          height: 10,
        ),
        Text(
          "Recommence TV",
          style: TextStyle(
              color: Style.Colors.titleColor,
              fontWeight: FontWeight.w500,
              fontSize: 12.0),
        ),
        TVRecommentScreen(id: detail.id),
        SizedBox(
          height: 10,
        ),
        Text(
          "Similar TV",
          style: TextStyle(
              color: Style.Colors.titleColor,
              fontWeight: FontWeight.w500,
              fontSize: 12.0),
        ),
        TVSimilarScreen(id: detail.id),
      ],
    );
  }
}
