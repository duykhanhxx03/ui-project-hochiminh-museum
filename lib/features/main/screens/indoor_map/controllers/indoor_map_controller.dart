import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

var mapJson = [
  'assets/json/indoor_map/rooms1.json',
  'assets/json/indoor_map/rooms2.json',
  'assets/json/indoor_map/rooms3.json',
];
var mapUrl = [
  'assets/images/indoor_map/floor_1.png',
  'assets/images/indoor_map/floor_2.png',
  'assets/images/indoor_map/floor_3.png',
];

class IndoorMapController extends GetxController {
  static IndoorMapController get instance => Get.find();

  double mapWidth = 0;
  double mapHeight = 0;

  var currentMapJson = mapJson[0].obs;
  var currentMapUrl = mapUrl[0].obs;

  void changeFloor(int value) {
    currentMapJson.value = mapJson[value];
    currentMapUrl.value = mapUrl[value];
  }

  Future<String> loadAsset() async {
    await getMapInfo();
    // print('loadAssets');
    return await rootBundle.loadString(currentMapJson.value);
  }

  Future<int> findRoomByPoint(Offset p) async {
    final allRoom = jsonDecode(await loadAsset());
    // print("findRoomByPoint");
    int room = 0;
    for (var r in allRoom['Datas']) {
      final rArr = (r['coords'].split(','));
      double xMax = 0.0, xMin = mapWidth, yMax = 0.0, yMin = mapHeight;

      for (var i = 0; i < rArr.length; i += 2) {
        if (xMax < double.parse(rArr[i])) xMax = double.parse(rArr[i]);
        if (xMin > double.parse(rArr[i])) xMin = double.parse(rArr[i]);
      }

      for (var i = 1; i < rArr.length; i += 2) {
        if (yMax < double.parse(rArr[i])) yMax = double.parse(rArr[i]);
        if (yMin > double.parse(rArr[i])) yMin = double.parse(rArr[i]);
      }

      if (p.dx > xMin && p.dx < xMax && p.dy > yMin && p.dy < yMax) {
        room = int.parse(r['href'].split('_')[1]);
        break;
      }
    }

    return room;
  }

  getMapInfo() async {
    final img = await rootBundle.load(currentMapUrl.value);
    final decodedImage = await decodeImageFromList(img.buffer.asUint8List());
    mapWidth = decodedImage.width.toDouble();
    mapHeight = decodedImage.height.toDouble();
    // print('getMapInfo');
  }
}
