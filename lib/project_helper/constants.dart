import 'package:flutter/material.dart';

class Constants {
  static const int splashDelay = 5;
  static const double basePadding = 10.0;
  static const String appName = "No Dowry.com";
  static const String dummyUrl = "http://nodowry.com/public/images/allu.jpg";
}

class Dimensions
{

  static double barIconSize=25.0;
}

class AppImages {
  static const String imagesPath = "assets/images/";
  static const String loginBackground = imagesPath + "background_image.jpg";
  static const String logo = imagesPath + "nodowry_splash_logo.png";
  static const String dummyImage = imagesPath + "dummy_image.jpeg";
  static const String homeBottomImage = imagesPath + "nodowry.png";
  static const String girlImage = imagesPath + "samantha.jpg";
}

class Themes {
  static const Color primaryColor = Color(0xFFF65F34);
  static const Color secondaryColor = Color(0xFFFFFFFF);
  static const Color alterColor = Color(0xFFEF2676);
  static const Color purpleColor = Color(0xFF8F288F);
  static const Color cancelButtonColor = Color(0xFFEF2676);
  static const Color starButtonColor = primaryColor;
  static const Color notificationButtonColor = primaryColor;
  static const Color heartButtonColor = purpleColor;
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color greyColor = Colors.grey;
}

class ScreenType {
  static int receivedInterest = 0;
  static int sentInterest = 1;
  static int shortlisted = 3;
  static int choosedUs = 4;
}
