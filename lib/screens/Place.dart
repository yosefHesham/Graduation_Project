import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:re7al/Models/Places.dart';
import 'package:re7al/Widgets/Constants.dart';
import 'package:re7al/Widgets/Favorite_Card.dart';
import 'package:re7al/Widgets/ModalBottomSheet.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';
import 'package:re7al/Widgets/Map.dart';

class Place extends StatefulWidget {
  const Place({Key key}) : super(key: key);

  @override
  _PlaceState createState() => _PlaceState();
}

class _PlaceState extends State<Place> {
  TabController _tabController;

  bool fav = true;
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: bk_color,
          body: Column(
            children: [
              Stack(
                overflow: Overflow.visible,
                children: [
                  Container(
                    height: 230,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(80.0),
                        bottomLeft: Radius.circular(80.0),
                      ),
                      image: DecorationImage(
                        image: const AssetImage('images/baliCity.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -20,
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                        ),
                        child: TabBar(
                          controller: _tabController,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              15.0,
                            ),
                            color: Color(0xff2f4f4f),
                          ),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Tab(
                              child: Text(
                                'Details',
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Locations',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 22,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 10, right: 10, bottom: 20),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Bali ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'island',
                                          style: TextStyle(
                                            color: font_color,
                                            fontSize: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 22,
                                    backgroundColor: font_color,
                                    // decoration: BoxDecoration(
                                    //   color: font_color,
                                    //   borderRadius: BorderRadius.circular(30),
                                    // ),
                                    child: Center(
                                      child: IconButton(
                                        iconSize: 30,
                                        icon: Icon(
                                          fav
                                              ? Icons.favorite_outline_outlined
                                              : Icons.favorite,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            fav = !fav;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RatingBar.builder(
                                  allowHalfRating: true,
                                  itemSize: 25,
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 1),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amberAccent,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.amberAccent,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Text(
                                      '3.5 Stars',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '29 Reviews ',
                                    style: TextStyle(color: font_color),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    15.0,
                                  ),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: ReadMoreText(
                                    'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                                    style: TextStyle(color: font_color),
                                    trimLines: 2,
                                    colorClickableText: Colors.red,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: 'Read more',
                                    trimExpandedText: ' show less',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20, left: 20, top: 20, bottom: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Photos ',
                                    style: TextStyle(
                                        color: font_color,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Story(),
                                  Story(),
                                ],
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //       top: 20, bottom: 10, right: 15, left: 15),
                            //   child: Container(
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(25),
                            //       color: Colors.white,
                            //     ),
                            //     child: ListTile(
                            //       leading: CircleAvatar(
                            //         backgroundColor: font_color,
                            //         child: CircleAvatar(
                            //           backgroundColor: Colors.white,
                            //           child: Icon(Icons.person_outline_rounded),
                            //           foregroundColor: font_color,
                            //         ),
                            //       ),
                            //       title: Text('UserName'),
                            //       subtitle: Text('this is my comment'),
                            //       trailing: Icon(
                            //         Icons.arrow_drop_up_sharp,
                            //         size: 40,
                            //         color: font_color,
                            //       ),
                            //       onTap: () {
                            //         showModalBottomSheet<void>(
                            //           shape: RoundedRectangleBorder(
                            //               borderRadius:
                            //                   BorderRadius.circular(20)),
                            //           isScrollControlled: true,
                            //           context: context,
                            //           builder: (BuildContext context) {
                            //             return Container(
                            //               decoration: BoxDecoration(
                            //                   color: font_color,
                            //                   borderRadius: BorderRadius.only(
                            //                       topRight: Radius.circular(20),
                            //                       topLeft:
                            //                           Radius.circular(20))),
                            //               height: 200,
                            //               child: Center(
                            //                 child: SingleChildScrollView(
                            //                   child: Padding(
                            //                     padding:
                            //                         const EdgeInsets.symmetric(
                            //                             horizontal: 25),
                            //                     child: Column(
                            //                       mainAxisAlignment:
                            //                           MainAxisAlignment.center,
                            //                       mainAxisSize:
                            //                           MainAxisSize.min,
                            //                       children: <Widget>[
                            //                         Container(
                            //                           decoration: BoxDecoration(
                            //                             borderRadius:
                            //                                 BorderRadius
                            //                                     .circular(50.0),
                            //                             color: Colors.white,
                            //                           ),
                            //                           height: 4,
                            //                           width: 40,
                            //                         ),
                            //                         Padding(
                            //                           padding:
                            //                               const EdgeInsets.only(
                            //                                   top: 20,
                            //                                   bottom: 10),
                            //                           child: TextFormField(
                            //                             decoration:
                            //                                 InputDecoration(
                            //                               prefixIcon: Icon(
                            //                                 Icons.person,
                            //                                 color: Colors.white,
                            //                               ),
                            //                               hintText:
                            //                                   '   Add a public comment',
                            //                               suffixIcon:
                            //                                   IconButton(
                            //                                 icon: Icon(Icons
                            //                                     .arrow_forward),
                            //                               ),
                            //                             ),
                            //                           ),
                            //                         ),
                            //                         Container(
                            //                           decoration: BoxDecoration(
                            //                             borderRadius:
                            //                                 BorderRadius
                            //                                     .circular(15),
                            //                             color: bk_color,
                            //                           ),
                            //                           child: ListTile(
                            //                             leading: Icon(Icons
                            //                                 .person_outline_rounded),
                            //                             title: Text('Home'),
                            //                             onTap: () {},
                            //                           ),
                            //                         ),
                            //                       ],
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             );
                            //           },
                            //         );
                            //       },
                            //     ),
                            //   ),
                            // ),
                            BottomSheetModal(),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Map(),
                    ),
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.vertical,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(10),
                    //     child: Column(
                    //       children: [
                    //         Favorite_Card(
                    //           CardName: 'pyramids',
                    //           CardDate: '22 mai 2021 ',
                    //           CardRating: 4.9,
                    //           CardReviews: 19,
                    //         ),
                    //         Favorite_Card(
                    //           CardName: 'pyramids',
                    //           CardDate: '22 mai 2021',
                    //           CardRating: 4.9,
                    //           CardReviews: 19,
                    //         ),
                    //         Favorite_Card(
                    //           CardName: 'pyramids',
                    //           CardDate: '22 mai 2021',
                    //           CardRating: 4.9,
                    //           CardReviews: 19,
                    //         ),
                    //         Favorite_Card(
                    //           CardName: 'pyramids',
                    //           CardDate: '22 mai 2021',
                    //           CardRating: 4.9,
                    //           CardReviews: 19,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
