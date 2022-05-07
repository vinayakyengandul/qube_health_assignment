

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageOne extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Back to Qube Health"),
              onPressed: (){
                Get.offNamed("/");
              },
            ),
            ElevatedButton(
              child: Text("Dummy Page"),
              onPressed: (){
                Get.offNamed("/two");
              },
            ),
          ],
        )
      ),
    );
  }
}