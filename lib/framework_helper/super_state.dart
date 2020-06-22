import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_dowry/project_helper/constants.dart';
import 'package:no_dowry/project_helper/theme_helper.dart';
import 'package:page_transition/page_transition.dart';

abstract class RepositoryState<T extends StatefulWidget> extends State<T> {}

abstract class SuperState<T extends StatefulWidget> extends RepositoryState<T> {
  /// abstract methods..
  normalState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.backgroundColor,
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: normalState(),
    );
  }

  /// util methods...
  screenHeight() {
    return MediaQuery.of(context).size.height;
  }

  screenWidth() {
    return MediaQuery.of(context).size.width;
  }

  moveTop(screen) {
    Navigator.push(context,
        PageTransition(type: PageTransitionType.rightToLeft, child: screen));
  }

  moveClear(screen) {
    Navigator.pushReplacement(context,
        PageTransition(type: PageTransitionType.rightToLeft, child: screen));
  }

  top({value}) {
    return SizedBox(
      height: value ?? 6.0,
    );
  }

  Widget right({value}) {
    return SizedBox(
      width: value ?? 6.0,
    );
  }
}

abstract class SuperScaffoldState<T extends StatefulWidget>
    extends SuperState<T> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.white70,
      drawer: getDrawer(),
      backgroundColor: Themes.backgroundColor,
      appBar: getAppBar(),
      body: Padding(
        padding: EdgeInsets.all(Constants.basePadding),
        child: scaffoldState(),
      ),
    );
  }

  getAppBar() => AppBar(
        backgroundColor: Themes.primaryColor,
        actions: getAppBarActions(),
        leading: getAppBarLeading(),
        title: getAppBarTitleWidget(),
        centerTitle: getAppBarCenterTitle(),
        iconTheme: IconThemeData(color: Themes.secondaryColor),
      );

  normalState() => null;

  getAppBarActions() => null;

  getAppBarLeading() => null;

  getDrawer() => Drawer();

  getAppBarTitleWidget() =>
      ThemeHelper.customTextWithColor(context, getAppBarTitle(),
          color: Themes.secondaryColor, isBold: true, size: 20.0);

  getAppBarCenterTitle() => false;

  getAppBarTitle() => null;

  scaffoldState();
}
