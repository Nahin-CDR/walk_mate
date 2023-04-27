
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/presentation/resources/assets_manager.dart';
import 'package:tracker/presentation/resources/string_manager.dart';
import 'package:tracker/presentation/resources/theme_manager.dart';
import 'package:tracker/presentation/welcome/widgets.dart';
import '../resources/routes_manager.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  bool light = false;
  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    double multiplier = 2.0;
    return Consumer<ThemeManager>(
        builder:(context,themeProvider,child){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: themeProvider.currentTheme == 'dark'? Colors.black.withOpacity(.0):Colors.white,
              elevation: 0,
              title: const Text(""),
              actions: [
                Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(ImageAssets.walkMate,width: 100),
                        Container()
                      ],
                    )
                ),
                Switch(
                    value: light,
                    inactiveThumbColor: Colors.black,
                    activeColor: Colors.white,
                    onChanged: (bool value){
                      setState(() {
                        light = value;
                        if(light){
                          themeProvider.changeTheme(theme: "dark");
                        }else{
                          themeProvider.changeTheme(theme: "light");
                        }
                      });
                    }
                )
              ],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: const Text(AppString.walkingGoal,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  )),
                ),
                Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Positioned(
                                child:  Image.asset(
                                  themeProvider.currentTheme == 'dark'?ImageAssets.runImage2:ImageAssets.runImage1,
                                  height: MediaQuery.of(context).size.height-unitHeightValue*20,

                              )
                            ),
                            Positioned(
                                bottom: 10,
                                left: MediaQuery.of(context).size.width/2-unitHeightValue*20,
                                right:  MediaQuery.of(context).size.width/2-unitHeightValue*20,
                                child: Center(
                                  child: button(context: context, routeName:Routes.setLimit),
                                )
                            )
                          ],
                        ),
                      ],
                    )
                )
              ],
            ),
          );
        }
    );
  }
}
