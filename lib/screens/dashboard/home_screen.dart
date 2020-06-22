import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:no_dowry/framework_helper/super_state.dart';
import 'package:no_dowry/project_helper/common_widgets.dart';
import 'package:no_dowry/project_helper/constants.dart';
import 'package:no_dowry/project_helper/theme_helper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends SuperScaffoldState<HomeScreen> {
  var smallSizeImage = 75.0;

  @override
  getAppBarTitle() => 'Home Page';

  @override
  getAppBarActions() => actions();

  @override
  scaffoldState() {
    return ListView(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              getHeading("RECENT PROFILES"),
              top(),
              Container(
                  height: 160.0,
                  width: screenWidth() / 1.1,
                  child: SliderWidget()),
              top(value: 14.0),
              getHeading("RECOMMENDED PROFILES"),
              top(),
              Container(
                  height: 160.0,
                  width: screenWidth() / 1.1,
                  child: SliderWidget()),
              top(value: 14.0),
              getHeading("RECEIVED INTEREST"),
              getSwipeableCard(),
              top(value: 14.0),
              getHeading("SHORTLISTED"),
              top(),
              Container(
                  height: 160.0,
                  width: screenWidth() / 1.0,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (c, i) => Container(
                          height: 160.0,
                          width: screenWidth() / 1.1,
                          child: NewUsersWidget(
                            screenType: ScreenType.shortlisted,
                          )))),
              top(value: 14.0),
              getHeading("ONLINE MATCHES"),
              top(),
              Container(
                  height: 110.0,
                  width: screenWidth() / 1.0,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (c, i) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                    child: getRectangularImage(context,
                                        width: smallSizeImage,
                                        height: smallSizeImage)),
                                ThemeHelper.customTextWithColor(
                                    context, "Aman Soni",
                                    color: Colors.blueGrey,
                                    size: 17.0,
                                    isBold: true),
                              ],
                            ),
                          ))),
              top(value: 14.0),
              getHeading("PROFILE VISITORS"),
              top(),
              Container(
                  height: 110.0,
                  width: screenWidth() / 1.0,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (c, i) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                    child: getRectangularImage(context,
                                        width: smallSizeImage,
                                        height: smallSizeImage)),
                                ThemeHelper.customTextWithColor(
                                    context, "Aman Soni",
                                    color: Colors.blueGrey,
                                    size: 17.0,
                                    isBold: true),
                              ],
                            ),
                          ))),
              top(value: 14.0),
              getHeading("SENT INTEREST"),
              top(),
              Container(
                  height: 160.0,
                  width: screenWidth() / 1.0,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (c, i) => Container(
                          height: 160.0,
                          width: screenWidth() / 1.1,
                          child: NewUsersWidget(
                            screenType: ScreenType.sentInterest,
                          )))),
              top(value: 14.0),
              getAssetRectangularImage(context, img: AppImages.homeBottomImage)
            ],
          ),
        ),
      ],
    );
  }

  getHeading(text) {
    return Row(
      children: <Widget>[
        right(),
        ThemeHelper.customTextWithColor(context, text,
            size: 18.0, isBold: true, color: Themes.alterColor),
        Spacer(),
        ThemeHelper.customTextWithColor(context, "See All",
            size: 14.0, color: Colors.blueGrey, isBold: true),
      ],
    );
  }

  Widget getSwipeableCard() {
    return Container(
      height: 380.0,
      width: screenWidth() / 1.3,
      child: TinderSwapCard(
        orientation: AmassOrientation.BOTTOM,
        totalNum: 6,
        stackNum: 3,
        swipeEdge: 4.0,
        maxWidth: 270.0,
        maxHeight: 275.0,
        minWidth: 260.0,
        minHeight: 274.0,
        cardBuilder: (context, index) => ThemeHelper.getCard(
          content: Card(
            child: Column(
              children: <Widget>[
                Image.asset(
                  AppImages.girlImage,
                  height: 200.0,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Container(
                  height: 53.0,
                  color: Themes.greyColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      ThemeHelper.circularButtons(
                        context,
                        text: "Reject",
                      ),
                      ThemeHelper.circularButtons(context,
                          text: "Accept", backgroundColor: Themes.purpleColor),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        cardController: CardController(),
        swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
          if (align.x < 0) {
          } else if (align.x > 0) {}
        },
        swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {},
      ),
    );
  }

  actions() {
    return [
      getChatIcon(),
      right(),
      getBellIcon(),
      right(),
      getSearchIcon(),
      right(),
    ];
  }
}
