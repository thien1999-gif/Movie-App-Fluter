import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movieapp/bloc/movie_bloc.dart';
import 'package:movieapp/model/tv.dart';
import 'package:movieapp/model/tv_detail.dart';
import 'package:movieapp/model/video.dart';
import 'package:movieapp/model/video_response.dart';
import 'package:movieapp/screens/movie/others/video_player.dart';
import 'package:movieapp/screens/tv/tvs/tv_info.dart';
import 'package:movieapp/style/theme.dart' as Style;
import 'package:sliver_fab/sliver_fab.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TVDetailScreen extends StatefulWidget {
  TV tv;

  TVDetailScreen({Key key, @required this.tv}) : super(key: key);

  @override
  _TVDetailScreenState createState() => _TVDetailScreenState(tv);
}

class _TVDetailScreenState extends State<TVDetailScreen> {
  TV tv;

  _TVDetailScreenState(this.tv);

  @override
  void initState() {
    super.initState();
    tvVideoDetaillBloc.getTVDetailVideos(tv.id);
  }

  @override
  void dispose() {
    super.dispose();
    tvVideoDetaillBloc.drainStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      body: new Builder(
        builder: (context) {
          return new SliverFab(
            floatingPosition: FloatingPosition(right: 20),
            floatingWidget: StreamBuilder<VideoResponse>(
              stream: tvVideoDetaillBloc.subject.stream,
              builder: (context, AsyncSnapshot<VideoResponse> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.error != null &&
                      snapshot.data.error.length > 0) {
                    return _buildErrorWidget(snapshot.data.error);
                  }
                  return _buildVideoWidget(snapshot.data);
                } else if (snapshot.hasError) {
                  return _buildErrorWidget(snapshot.error);
                } else {
                  return _buildLoadingWidget();
                }
              },
            ),
            expandedHeight: 200.0,
            slivers: <Widget>[
              new SliverAppBar(
                backgroundColor: Style.Colors.mainColor,
                expandedHeight: 200.0,
                pinned: true,
                flexibleSpace: new FlexibleSpaceBar(
                    background: Stack(
                  children: <Widget>[
                    Container(
                      decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/original/" +
                                    tv.poster_path)),
                      ),
                      child: new Container(
                        decoration: new BoxDecoration(
                            color: Colors.black.withOpacity(0.5)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: [
                              0.1,
                              0.9
                            ],
                            colors: [
                              Colors.black.withOpacity(0.9),
                              Colors.black.withOpacity(0.0)
                            ]),
                      ),
                    ),
                  ],
                )),
              ),
              SliverPadding(
                  padding: EdgeInsets.all(0.0),
                  sliver: SliverList(
                      delegate: SliverChildListDelegate([
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      width: 130.0,
                                      height: 180.0,
                                      decoration: new BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(2.0)),
                                        shape: BoxShape.rectangle,
                                        image: new DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://image.tmdb.org/t/p/w200/" +
                                                    tv.poster_path)),
                                      )),
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'TV Show : ' + tv.original_name,
                                    style: TextStyle(
                                        height: 1.4,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11.0),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Rated : ',
                                        style: TextStyle(
                                            height: 1.4,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11.0),
                                      ),
                                      Text(
                                        tv.vote_average.toString(),
                                        style: TextStyle(
                                            height: 1.4,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11.0),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      RatingBar.builder(
                                        itemSize: 8.0,
                                        initialRating: tv.vote_average / 2,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 2.0),
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
                                  Text(
                                    'First air date : ' + tv.first_air_date,
                                    style: TextStyle(
                                        height: 1.4,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11.0),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Language : ',
                                        style: TextStyle(
                                            height: 1.4,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11.0),
                                      ),
                                      Text(
                                        tv.original_language == "en"
                                            ? "English"
                                            : "N/A",
                                        style: TextStyle(
                                            height: 1.4,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11.0),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Popularity : ' + tv.popularity.toString(),
                                    style: TextStyle(
                                        height: 1.4,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          TVInfoScreen(id: tv.id),
                        ],
                      ),
                    ),
                  ])))
            ],
          );
        },
      ),
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

  Widget _buildVideoWidget(VideoResponse data) {
    List<Video> videos = data.videos;
    return FloatingActionButton(
      backgroundColor: Style.Colors.secondColor,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerScreen(
              controller: YoutubePlayerController(
                initialVideoId: videos[0].key,
                flags: YoutubePlayerFlags(
                  autoPlay: true,
                  mute: true,
                ),
              ),
            ),
          ),
        );
      },
      child: Icon(Icons.play_arrow),
    );
  }
}
