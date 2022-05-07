import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qube_health_assignment/controller.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class HomePage extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.black),
            onPressed: () => Get.offNamed("/one"),
          ),
          backgroundColor: const Color(0xffFBFBFC),
          elevation: 0,
          title: const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text("Your Feelings History",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w700)),
          ),
        ),
        body: controller.obx(
            (state) => Container(
                  width: double.infinity,
                  color: const Color(0xffFBFBFC),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text("Your feelings from last 30 days",
                              style: TextStyle(fontSize: 16)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: controller.feelingsRow(),
                          ),
                        ),
                        Container(
                          height: 0.2,
                          color: const Color(0xff000000),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: const Color(0xffC6E5F7),
                            ),
                            padding: const EdgeInsets.all(5),
                            
                            // child: Text("10 Jun, 2021",
                            child: Text(
                                DateFormat('dd MMM, yyyy')
                                    .format(controller.selectedDate.value),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: controller.calendarRow()),
                          ),
                        ),
                        Container(
                          height: 0.2,
                          color: const Color(0xff000000),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    // flex: 5,
                                    width: 90,
                                    alignment: Alignment.center,
                                    child: Text("9 AM - 12 PM",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12)),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Image.asset('assets/images/love.png'),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    flex: 5,
                                    child: Text("Love",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    // flex: 5,
                                    width: 90,
                                    alignment: Alignment.center,
                                    child: Text("1 PM - 4 PM",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12)),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Image.asset('assets/images/angry.png'),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    flex: 5,
                                    child: Text("Angry",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    // flex: 5,
                                    width: 90,
                                    alignment: Alignment.center,
                                    child: Text("4 PM - 6 PM",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12)),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Image.asset('assets/images/angry.png'),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    flex: 5,
                                    child: Text("Angry",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 0.2,
                          color: const Color(0xff000000),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 10),
                          child: Text("You May Find This Interesting",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit euismod risus elementum magna scelerisque nunc sed varius. Tellus quis tristique adipiscing sed metus, sit ac adipiscing. Leo aenean sed eu purus maecenas posuere ",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.4),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: AspectRatio(
                            aspectRatio: 12 / 6,
                            child: controller.youtubeCont.value != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: YoutubePlayerIFrame(
                                        controller:
                                            controller.youtubeCont.value))
                                : Center(child: CircularProgressIndicator()),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            onLoading: Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )),
      ),
    );
  }

}
