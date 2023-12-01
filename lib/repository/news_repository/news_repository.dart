import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/news/models/news_model.dart';

class NewsRepository extends GetxController {
  static NewsRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final initList = {
    'TinTucSuKien': [
      'HDBaoTang',
      'HDHeThongCacBT_DTLuuNiemHCM',
      'HDNganhDSVH',
      'HDBaoTangTrenTG',
    ],
    'NghienCuu': [
      'NghienCuuHCM',
      'ChuyenKeHCM',
      'AnPhamHCM',
      'BoSuuTap',
      'HienVatKeChuyen',
      'HDKhoaHoc',
      'CongBoKH',
    ],
    'GiaoDuc': [
      'HocTapTheoTamGuongHCM',
      'KeChuyenHCM',
      'NhungTamGuong',
      'PhongKhamPha',
      'BoiDuongNghiepVu',
      'CacHoatDongKhac',
    ]
  };

  Future<List<NewsModel>> getAllNews(
    String collection,
    String document,
  ) async {
    final box = GetStorage(collection);
    if (box.hasData(document)) {
      Map<String, dynamic> cache = box.read(document);
      final lastModified = cache['last-modified'] as DateTime;
      final List<NewsModel> newsCachedData = cache['data'];

      if (DateTime.now().difference(lastModified).inMinutes <= 10) {
        return newsCachedData;
      }
    }

    final snapshot = await _db
        .collection(collection)
        .doc(document)
        .collection('BaiBao')
        .get();
    final newsData =
        snapshot.docs.map((e) => NewsModel.fromSnapShot(e)).toList();

    box.write(
      document,
      {
        'last-modified': DateTime.now(),
        'data': newsData,
      },
    );

    return newsData;
  }

  createNews(NewsModel newsModel, String collection, String document) async {
    await _db
        .collection(collection)
        .doc(document)
        .collection('BaiBao')
        .add(newsModel.toJson())
        .whenComplete(
          () => Get.snackbar(
            'Thành công',
            'Bạn đã đăng báo thành công',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green,
          ),
        )
        // ignore: body_might_complete_normally_catch_error
        .catchError(
      (error, stacktrace) {
        () => Get.snackbar(
              'Lỗi',
              'Có gì đó không đúng, thử lại?',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.redAccent.withOpacity(0.1),
              colorText: Colors.red,
            );
        if (kDebugMode) {
          print(error.toString());
        }
      },
    );
  }

  Future<List<NewsModel>> searchNews(String searchTerm) async {
    searchTerm = searchTerm.toLowerCase();

    final snapshot = await _db
        .collectionGroup('BaiBao')
        .get();

    final filteredDocs = snapshot.docs.where((doc) {
      final newsContent = doc['news_content'] as List<dynamic>;
      //print(newsContent);

      // Check if any 'content' field contains the searchTerm
      return newsContent.any((contentMap) {
        final contentType = contentMap['type'] as dynamic;
        final content =  contentMap['content'] as dynamic;
        return content.toString().toLowerCase().contains(searchTerm) && contentType.toString().contains('title');
      });
    }).toList();

    // Convert the filtered documents to a list of NewsModel
    final newsData = filteredDocs.map((e) => NewsModel.fromSnapShot(e)).toList();

    return newsData;
  }
}
