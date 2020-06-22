import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_dowry/project_helper/constants.dart';

class ThemeHelper {
  static Card getCard({content}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: content,
    );
  }

  static Text customTextWithColor(context, String text,
          {color,
          size,
          bool isBold = false,
          fontStyle,
          textAlign,
          fontfamily}) =>
      Text(text,
          textAlign: textAlign,
          style: TextStyle(
            fontFamily: fontfamily,
            fontStyle: fontStyle ?? FontStyle.normal,
            color: color ?? Colors.black87,
            fontSize: size ?? 18.0,
            fontWeight: isBold ? FontWeight.w500 : FontWeight.normal,
          ));

  static Text splashText(context, String text,
          {color,
          size,
          bool isBold = false,
          fontStyle,
          textAlign,
          fontfamily}) =>
      Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: size,
            fontFamily: "Lyster",
            fontWeight: FontWeight.w900,
            color: Colors.white),
      );

  static Widget getButton(context, {text, onPressed}) {
    return SizedBox(
      height: 50.0,
      width: double.infinity,
      child: RaisedButton(
        onPressed: onPressed,
        color: Themes.primaryColor,
        child: ThemeHelper.customTextWithColor(context, text,
            color: Colors.white, isBold: true),
      ),
    );
  }

  static Widget networkImage(context, item, {scale,width,height}) {
    return Center(
      child: CachedNetworkImage(
          imageUrl: item,
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
          placeholder: (context, url) => CupertinoActivityIndicator(radius: 24.0,),
          errorWidget: (context, url, error) =>
              Image.asset(AppImages.dummyImage,
                  width: width??double.infinity,
                  height: height??double.infinity,
                  fit:BoxFit.fill)),
    );
  }
  //In swipe card
  static Widget circularButtons(context,{text,backgroundColor})
  {
    return SizedBox(
      width: 100.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          color: backgroundColor??Themes.alterColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0,),
          child: ThemeHelper.customTextWithColor(context, text,
              color: Themes.secondaryColor, isBold: true,size: 17.0,textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
