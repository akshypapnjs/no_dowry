import 'package:flutter/material.dart';
import 'package:no_dowry/project_helper/common_widgets.dart';
import 'package:no_dowry/project_helper/constants.dart';
import 'package:no_dowry/framework_helper/super_state.dart';
import 'package:no_dowry/project_helper/theme_helper.dart';
import 'package:no_dowry/screens/dashboard/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends SuperState<LoginScreen> {
  TextEditingController contactController, passwordController;

  @override
  void initState() {
    contactController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    contactController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  normalState() {
    var topSpace = 25.0;
    return Container(
      color: Colors.grey,
      width: screenWidth(),
      height: screenHeight(),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            AppImages.loginBackground,
            fit: BoxFit.fitHeight,
            colorBlendMode: BlendMode.softLight,
            color: Colors.black,
          ),
          Container(
            height: 350.0,
            decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.grey.withOpacity(0.0),
                      Colors.black,
                    ],
                    stops: [
                      0.0,
                      1.0
                    ])),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//                Expanded(child: Image.asset(AppImages.homeBottomImage)),
                Spacer(
                  flex: 1,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.favorite_border,
                      color: Themes.secondaryColor,
                    ),
                    right(),
                    ThemeHelper.customTextWithColor(
                        context, "Find Your Partner",
                        color: Themes.secondaryColor),
                  ],
                ),
                top(value: 25.0),
                getTextField(
                    inputType: TextInputType.phone,
                    controller: contactController,
                    hintText: "Contact Number",
                    onchanged: (value) {}),
                top(),
                getTextField(
                    controller: passwordController,
                    hintText: "Password",
                    obsecure: true,
                    onchanged: (value) {}),
                top(value: topSpace),
                ThemeHelper.getButton(context,
                    text: "LOG IN", onPressed: () => moveClear(HomeScreen())),
                top(value: topSpace),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ThemeHelper.customTextWithColor(
                      context, "Forgot Password ?",
                      color: Colors.white),
                ),
                top(value: 90.0),
                ThemeHelper.customTextWithColor(context, "CREATE NEW ACCOUNT",
                    color: Colors.white),
                Spacer(),
                ThemeHelper.customTextWithColor(context, "FIND YOUR BEST MATCH",
                    color: Colors.white, size: 10.0),
                top()
              ],
            ),
          )
        ],
      ),
    );
  }
}
