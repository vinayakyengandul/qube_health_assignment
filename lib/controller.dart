import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'model.dart';

class HomeController extends GetxController with StateMixin {
  Feeling? feeling;
  Rx<YoutubePlayerController> youtubeCont = Rx<YoutubePlayerController>(
      YoutubePlayerController(initialVideoId: 'ml6cT4AZdqI'));
  Rx<DateTime> selectedDate = new Rx<DateTime>(DateTime.now());
  Rx<DateTime> startDate = new Rx<DateTime>(DateTime.now());
  Rx<DateTime> endDate = new Rx<DateTime>(DateTime.now());

  @override
  void onInit() async {
    startDate.value = DateTime.now().subtract(new Duration(days: 30));
    endDate.value = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    youtubeCont.value = YoutubePlayerController(
      initialVideoId: 'ml6cT4AZdqI',
      params: YoutubePlayerParams(
        playlist: ['ml6cT4AZdqI'], // Defining custom playlist
        startAt: Duration(seconds: 50),
        showControls: true,
        showFullscreenButton: true,
        desktopMode: false,
        privacyEnhanced: true,
        useHybridComposition: true,
      ),
    );
    youtubeCont.value.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    };
    youtubeCont.value.onExitFullscreen = () {
    };
    apiData(startDate.value);
    super.onInit();
  }

  apiData(date) async {
    selectedDate.value = date;
    print(date);
    var bodyData = {
      'user_id': 3206161992,
      'feeling_date': DateFormat('dd-MM-yyyy').format(date)
    };
    var header = {
      'X-Api-Key': 'f6d646a6c2f2df883ea0cccaa4097358ede98284',
      'Content-Type': 'application/json'
    };
    var url = Uri.parse(
        'https://www.qubehealth.com/qube_services/api/testservice/getListOfUserFeeling');
    var response =
        await http.post(url, body: json.encode(bodyData), headers: header);

    if (response.statusCode == 200) {
      print(response.body);
      feeling = feelingModelFromJson(response.body);
      change("sucess", status: RxStatus.success());
    } else {
      change("error", status: RxStatus.error());
    }
  }

  feelingsRow() {
    List<Widget> children = [];
    if (feeling != null) {
      feeling?.data.feelingPercentage.toJson().entries.forEach((element) {
        children.add(feelingAction(element.key, element.value));
      });
      return children;
    }
    children.add(const Text('Something went wrong in API calling.'));
    return children;
  }

  List<Widget> calendarRow({DateTime? date}) {
    List<Widget> children = [];
for (int i = 0; i <= 30; i++){
      children.add(calDayWidget(DateTime.now().subtract(new Duration(days: 30 - i))));
      children.add(SizedBox(
        width: 10,
      ));
    }
    return children;
  }

  calDayWidget(DateTime datetime) {
    return InkWell(
      onTap: () {
        apiData(datetime);
      },
      child: Container(
        height: 70,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: DateFormat('EE').format(datetime) ==
                      DateFormat('EE').format(selectedDate.value) &&
                  datetime.day == selectedDate.value.day
              ? Color(0xff4F4F4F)
              : Colors.transparent,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Text(DateFormat('EE').format(datetime),
                style: TextStyle(
                    fontWeight: FontWeight.w100, color: Color(0xffA7A7A7))),
            SizedBox(
              height: 5,
            ),
            Text(datetime.day.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w100,
                    color: DateFormat('EE').format(datetime) ==
                                DateFormat('EE').format(selectedDate.value) &&
                            datetime.day == selectedDate.value.day
                        ? Color(0xffF1F2F3)
                        : Colors.black)),
          ],
        ),
      ),
    );
  }

  Widget feelingAction(String feeling, String feelingPercentage) {
    return Opacity(
      opacity: feelingPercentage == '0' ? 0.3 : 1,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffF1F2F3),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: const Color(0xffF1F2F3),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                    child: Center(
                        child: Text('$feelingPercentage%',
                            style:
                                const TextStyle(fontWeight: FontWeight.w100))),
                    flex: 5),
                Container(
                  width: 40,
                  height: 40,
                  child: Image.asset('assets/images/${feeling.toLowerCase()}.png'),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xFF85C454)),
                )
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(feeling, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
