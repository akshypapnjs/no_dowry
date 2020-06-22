import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:no_dowry/framework_helper/super_state.dart';
import 'package:no_dowry/project_helper/constants.dart';
import 'package:no_dowry/project_helper/theme_helper.dart';

class NewUsersWidget extends StatefulWidget {
  final int screenType;

  NewUsersWidget({this.screenType});

  @override
  State<StatefulWidget> createState() {
    return NewUsersWidgetState();
  }
}

class NewUsersWidgetState extends SuperState<NewUsersWidget> {
  var textSize = 15.0;
  var textButtonSie = 16.0;
  var iconSize = 30.0;

  @override
  normalState() {
    return Container(child: ThemeHelper.getCard(content: getContent()));
  }

  getContent() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              getRectangularImage(context),
              right(value: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ThemeHelper.customTextWithColor(context, "Mohit Mehta",
                      color: Colors.blueGrey, size: 17.0, isBold: true),
                  ThemeHelper.customTextWithColor(
                      context, "Marketing Professional",
                      color: Colors.grey, size: textSize),
                  ThemeHelper.customTextWithColor(
                      context, "27 Years, 5'5'', Brahmin",
                      color: Colors.grey, size: textSize),
                  ThemeHelper.customTextWithColor(
                      context, "Brahchar, Gujrati, Kach",
                      color: Colors.grey, size: textSize),
                  ThemeHelper.customTextWithColor(
                      context, "Rs. 5-7 Lakhs, Never....",
                      color: Colors.grey, size: textSize),
                ],
              )
            ],
          ),
          top(),
          getBottomBar(iconSize),
        ],
      ),
    );
  }

  getBottomBar(iconSize) {
    if (widget.screenType == ScreenType.receivedInterest) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            right(value: 140.0),
            ThemeHelper.customTextWithColor(context, "DECLINE",
                color: Themes.alterColor, size: textButtonSie, isBold: true),
            right(value: 10.0),
            ThemeHelper.customTextWithColor(context, "ACCEPT",
                color: Themes.primaryColor, size: textButtonSie, isBold: true),
            right(value: 0.0),
          ],
        ),
      );
    } else if (widget.screenType == ScreenType.sentInterest) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            right(value: 100.0),
            getFavoriteIcon(),
            getBellIcon(),
            getCancelIcon(),
          ],
        ),
      );
    } else if (widget.screenType == ScreenType.shortlisted) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            right(value: 100.0),
            getFavoriteIcon(),
            getStarIcon(),
            getChatIcon(),
          ],
        ),
      );
    } else if (widget.screenType == ScreenType.choosedUs) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            right(value: 100.0),
            getFavoriteIcon(),
            Container(),
            getChatIcon(),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  getFavoriteIcon({onTap}) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.favorite_border,
        color: Themes.heartButtonColor,
        size: iconSize,
      ),
    );
  }

  getStarIcon({onTap}) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.star_border,
        color: Themes.starButtonColor,
        size: iconSize,
      ),
    );
  }

  getBellIcon({onTap}) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.notifications_none,
        color: Themes.notificationButtonColor,
        size: iconSize,
      ),
    );
  }

  getCancelIcon({onTap}) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        CupertinoIcons.clear_thick,
        color: Themes.cancelButtonColor,
        size: iconSize,
      ),
    );
  }

  getChatIcon({onTap}) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.chat,
        color: Themes.cancelButtonColor,
        size: iconSize,
      ),
    );
  }
}

class SliderWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SliderWidgetState();
  }
}

class SliderWidgetState extends SuperState<SliderWidget> {
  var _current;

  List _list;

  @override
  void initState() {
    _current = 0;
    _list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    super.initState();
  }

  @override
  normalState() {
    return CarouselSlider(
      height: 200.0,
      viewportFraction: 1.0,
      autoPlay: true,
      enableInfiniteScroll: true,
      onPageChanged: (index) {
        _current = index;
        setState(() {});
      },
      items: _list.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(child: NewUsersWidget());
          },
        );
      }).toList(),
    );
  }
}

class SwipableWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SliderWidgetState();
  }
}

class SwipableWidgetState extends SuperState<SwipableWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  normalState() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: screenWidth() / 1.0,
      child: TinderSwapCard(
        orientation: AmassOrientation.BOTTOM,
        totalNum: 6,
        stackNum: 3,
        swipeEdge: 4.0,
        maxWidth: MediaQuery.of(context).size.width * 0.9,
        maxHeight: MediaQuery.of(context).size.width * 0.9,
        minWidth: MediaQuery.of(context).size.width * 0.8,
        minHeight: MediaQuery.of(context).size.width * 0.8,
        cardBuilder: (context, index) => Card(
          child: Image.asset(AppImages.dummyImage),
        ),
        cardController: CardController(),
        swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
          /// Get swiping card's alignment
          if (align.x < 0) {
//Card is LEFT swiping
          } else if (align.x > 0) {
//Card is RIGHT swiping
          }
        },
        swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
          /// Get orientation & index of swiped card!
        },
      ),
    );
  }
}

getTextField({controller, hintText, obsecure, onchanged, inputType}) {
  return Container(
    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
    child: TextFormField(
        onChanged: (value) {},
        obscureText: obsecure ?? false,
        enabled: true,
        controller: controller,
        cursorColor: Colors.white,
        keyboardType: inputType ?? TextInputType.text,
        style: TextStyle(color: Colors.white70),
        decoration: InputDecoration(
          labelText: hintText ?? '',
          hintText: 'Enter Recepients',
          labelStyle: TextStyle(color: Colors.white70),
          hintStyle: TextStyle(color: Colors.white70),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.redAccent),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.redAccent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.white70),
          ),
        )),
  );
}

getRectangularImage(context, {img=Constants.dummyUrl, width, height}) {
  return Container(
    width: width ?? 110.0,
    height: height ?? 100.0,
    decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey)),
    child: ThemeHelper.networkImage(context, img,
        width: double.infinity, height: double.infinity),
  );
}
getAssetRectangularImage(context, {img, width, height}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: height ?? 100.0,
    decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey)),
    child: Image.asset(img,
        width: double.infinity, height: double.infinity),
  );
}

Widget getBellIcon({onTap}) {
  return InkWell(
    onTap: onTap,
    child: Icon(
      Icons.notifications_none,
      color: Themes.secondaryColor,
      size: Dimensions.barIconSize,
    ),
  );
}

Widget getSearchIcon({onTap}) {
  return InkWell(
    onTap: onTap,
    child: Icon(
      Icons.search,
      color: Themes.secondaryColor,
      size: Dimensions.barIconSize,
    ),
  );
}

Widget getChatIcon({onTap}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.only(top:3.0,right: 3.0),
      child: Icon(
        Icons.chat_bubble_outline,
        color: Themes.secondaryColor,
        size: 23.0??Dimensions.barIconSize,
      ),
    ),
  );
}
