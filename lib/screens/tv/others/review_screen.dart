import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movieapp/bloc/movie_bloc.dart';
import 'package:movieapp/model/review.dart';
import 'package:movieapp/model/review_response.dart';
import 'package:movieapp/style/theme.dart' as Style;

class ReviewScreen extends StatefulWidget {
  int id;

  ReviewScreen({Key key, @required this.id}) : super(key: key);

  @override
  _ReviewScreenState createState() => _ReviewScreenState(id);
}

class _ReviewScreenState extends State<ReviewScreen> {
  int id;

  _ReviewScreenState(this.id);

  @override
  void initState() {
    super.initState();
    tvReviewBloc.getTVReview(id);
  }

  @override
  void dispose() {
    super.dispose();
    tvReviewBloc.drainStream();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ReviewResponse>(
      stream: tvReviewBloc.subject.stream,
      builder: (context, AsyncSnapshot<ReviewResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildReviewWidget(snapshot.data);
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

  Widget _buildReviewWidget(ReviewResponse data) {
    List<Review> reviews = data.review;
    if (reviews.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "No More Reviews",
                  style: TextStyle(color: Style.Colors.secondColor),
                )
              ],
            )
          ],
        ),
      );
    } else
      return Container(
        height: 300.0,
        padding: EdgeInsets.only(left: 10.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: reviews.length,
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
                    if (reviews[index].authorDetails.avatarPath != null)
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
                                        reviews[index]
                                            .authorDetails
                                            .avatarPath)),
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
                        'Author : ' + reviews[index].author,
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
                        'Date : ' + reviews[index].createdAt.substring(0, 10),
                        style: TextStyle(
                            height: 1.4,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 11.0),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Rated : ' +
                              reviews[index].authorDetails.rating.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 7.0,
                        ),
                        RatingBar.builder(
                          itemSize: 8.0,
                          initialRating:
                              reviews[index].authorDetails.rating / 2,
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
                        ),
                      ],
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
                        showDialog(
                          context: context,
                          builder: (context) => new SingleChildScrollView(
                              child: AlertDialog(
                            title: Column(
                              children: [Text(reviews[index].author),

                                Text(
                                  reviews[index].content,
                                  maxLines: 40,
                                  style: TextStyle(
                                      height: 1.4,
                                      color: Style.Colors.secondColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 9.0),
                                ),
                              ],
                            ),
                            actions: [
                              FlatButton(
                                child: Text("Back"),
                                onPressed: () => Navigator.pop(context),
                              )
                            ],
                          )),
                        );
                      },
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
