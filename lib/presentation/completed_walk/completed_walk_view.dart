import 'package:flutter/material.dart';
import 'package:tracker/presentation/resources/assets_manager.dart';
import 'package:tracker/presentation/resources/string_manager.dart';

import '../resources/routes_manager.dart';

class CompletedView extends StatefulWidget {
  const CompletedView({Key? key}) : super(key: key);

  @override
  State<CompletedView> createState() => _CompletedViewState();
}

class _CompletedViewState extends State<CompletedView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
              child: const Text(
                  AppString.goalCompletion,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  )
              ),
            ),
            Center(
              child: Image.asset(ImageAssets.completedImage,height: 150,width: 150,),
            ),
            const SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.all(20),
              color: Colors.green,
              width: 200,
              child: Card(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width-100,
                  height: 50,
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(context, Routes.setLimit);
                    },
                    child: const Center(
                        child: Text("Go back",
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        )
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
