import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movieapp/bloc/movie_bloc.dart';
import 'package:movieapp/model/cast.dart';
import 'package:movieapp/model/cast_response.dart';
import 'package:movieapp/screens/movie/others/casts.dart';
import 'package:movieapp/style/theme.dart' as Style;

class TVCasts extends StatefulWidget {
  final int id;

  TVCasts({Key key, @required this.id}) : super(key: key);

  @override
  _TVCastsState createState() => _TVCastsState(id);
}

class _TVCastsState extends State<TVCasts> {
  final int id;

  _TVCastsState(this.id);

  @override
  void initState() {
    super.initState();
    tvCastBloc.getCastTV(id);
  }

  @override
  void dispose() {
    tvCastBloc..drainStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        StreamBuilder<CastResponse>(
          stream: tvCastBloc.subject.stream,
          builder: (context, AsyncSnapshot<CastResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.error != null &&
                  snapshot.data.error.length > 0) {
                return _buildErrorWidget(snapshot.data.error);
              }
              return _buildCastWidget(snapshot.data);
            } else if (snapshot.hasError) {
              return _buildErrorWidget(snapshot.error);
            } else {
              return _buildLoadingWidget();
            }
          },
        )
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

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error occured: $error"),
      ],
    ));
  }

  Widget _buildCastWidget(CastResponse data) {
    List<Cast> casts = data.casts;
    if (casts.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "No More Persons",
                  style: TextStyle(color: Colors.black45),
                )
              ],
            )
          ],
        ),
      );
    } else
      return Container(
        height: 140.0,
        padding: EdgeInsets.only(left: 10.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: casts.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(top: 10.0, right: 8.0),
              width: 100.0,
              child: GestureDetector(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    casts[index].img == null
                        ? Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                color: Style.Colors.secondColor),
                            child: Icon(
                              FontAwesomeIcons.userAlt,
                              color: Colors.white,
                            ),
                          )
                        : Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w300/" +
                                          casts[index].img)),
                            )),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      casts[index].name,
                      maxLines: 2,
                      style: TextStyle(
                          height: 1.4,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 9.0),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      casts[index].character,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 1.4,
                          color: Style.Colors.titleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 7.0),
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
