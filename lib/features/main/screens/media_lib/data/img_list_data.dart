// List link ảnh
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/models/list_img.dart';

class ImageListData {
  static final List<ListImage> listImageData = [
    ListImage(
      imgTitle: 'Quê hương và gia đình của Chủ tịch Hồ Chí Minh',
      imgURL: [
        'https://baotanghochiminh.vn/pic/PhotoAlbum/455_636866985569091309_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/455_636866985581031992_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/455_636866985592092625_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/455_636866985598352983_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/455_636866985603763292_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/455_636866985607943531_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/455_636866985612703804_HasThumb.jpg',
      ],
      dateSubmitted: DateTime(2018, 3, 26),
    ),
    ListImage(
      imgTitle:
          'Chủ tịch Hồ Chí Minh cùng Trung ương Đảng lãnh đạo cuộc đấu tranh củng cố chính quyền cách mạng, kháng chiến chống thực dân Pháp xâm lược (1945-1954)',
      imgURL: [
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866979319163834_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866979324794156_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866979331984567_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866979336564829_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866979341755126_HasThumb.jpg',
      ],
      dateSubmitted: DateTime(2017, 5, 31),
    ),
    ListImage(
      imgTitle:
          'Chủ tịch Hồ Chí Minh cùng Trung ương Đảng lãnh đạo cuộc vận động giải phóng dân tộc và Cách mạng tháng Tám, thành lập nước Việt Nam Dân chủ Cộng hòa, nhà nước dân chủ nhân dân đầu tiên ở Đông Nam Châu Á (1930-1945)',
      imgURL: [
        'https://baotanghochiminh.vn/pic/PhotoAlbum/317_636866983194615497_HasThumb.jpg',
      ],
      dateSubmitted: DateTime(2017, 5, 31),
    ),
    ListImage(
      imgTitle:
          'Chủ tịch Hồ Chí Minh tìm thấy con đường cách mạng giải phóng dân tộc, người sáng lập Đảng Cộng sản Việt Nam (1911-1930)',
      imgURL: [
        'https://baotanghochiminh.vn/pic/PhotoAlbum/318_636866984696981427_HasThumb.jpg',
      ],
      dateSubmitted: DateTime(2017, 5, 31),
    ),
    ListImage(
      imgTitle:
          'Chủ tịch Hồ Chí Minh cùng Trung ương Đảng lãnh đạo cuộc cách mạng xã hội chủ nghĩa ở miền Bắc và đấu tranh thống nhất nước nhà (1954-1969)',
      imgURL: [
        'https://baotanghochiminh.vn/pic/PhotoAlbum/315_636866976738566232_HasThumb.jpg',
      ],
      dateSubmitted: DateTime(2017, 5, 31),
    ),
  ];
}
/*
import 'package:ui_project_hochiminh_museum/features/main/screens/media_lib/models/list_img.dart';

class ImageListData {
  static final List<ListImage> listImageData = [
    ListImage(
      imgTitle: 'Quê hương và gia đình của Chủ tịch Hồ Chí Minh',
      imgURL: [
        'https://baotanghochiminh.vn/pic/PhotoAlbum/455_636866985569091309_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/455_636866985581031992_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/455_636866985592092625_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/455_636866985598352983_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/455_636866985603763292_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/455_636866985607943531_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/455_636866985612703804_HasThumb.jpg',
      ],
      dateSubmitted: DateTime(2018, 3, 26),
    ),
    ListImage(
      imgTitle:
          'Chủ tịch Hồ Chí Minh cùng Trung ương Đảng lãnh đạo cuộc đấu tranh củng cố chính quyền cách mạng, kháng chiến chống thực dân Pháp xâm lược (1945-1954)',
      imgURL: [
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866979331984567_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866979319163834_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866979324794156_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866979336564829_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866979341755126_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866979347955480_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866979353635805_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866979359296129_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866979369586718_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866979375857076_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866979383397508_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866979403908681_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980362433505_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980367373788_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980377264354_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980384884789_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980392105202_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980398405563_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980406506026_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980417536657_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980424027028_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980429937366_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980436657751_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980442168066_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980452618664_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980459939082_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980465869421_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980470779702_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980706433181_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980712233513_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980717743828_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980724154195_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980732814690_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980737894980_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980743985329_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980749365637_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980754585935_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980760236258_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980766876638_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980781647483_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980787877839_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980799378497_HasThumb.jpg',
        'https://baotanghochiminh.vn/pic/PhotoAlbum/316_636866980805748861_HasThumb.jpg',
      ],
      dateSubmitted: DateTime(2017, 5, 31),
    ),
    ListImage(
      imgTitle:
          'Chủ tịch Hồ Chí Minh cùng Trung ương Đảng lãnh đạo cuộc vận động giải phóng dân tộc và Cách mạng tháng Tám, thành lập nước Việt Nam Dân chủ Cộng hòa, nhà nước dân chủ nhân dân đầu tiên ở Đông Nam Châu Á (1930-1945)',
      imgURL: [
        'https://baotanghochiminh.vn/pic/PhotoAlbum/317_636866983194615497_HasThumb.jpg',
      ],
      dateSubmitted: DateTime(2017, 5, 31),
    ),
    ListImage(
      imgTitle:
          'Chủ tịch Hồ Chí Minh tìm thấy con đường cách mạng giải phóng dân tộc, người sáng lập Đảng Cộng sản Việt Nam (1911-1930)',
      imgURL: [
        'https://baotanghochiminh.vn/pic/PhotoAlbum/318_636866984696981427_HasThumb.jpg',
      ],
      dateSubmitted: DateTime(2017, 5, 31),
    ),
    ListImage(
      imgTitle:
          'Chủ tịch Hồ Chí Minh cùng Trung ương Đảng lãnh đạo cuộc cách mạng xã hội chủ nghĩa ở miền Bắc và đấu tranh thống nhất nước nhà (1954-1969)',
      imgURL: [
        'https://baotanghochiminh.vn/pic/PhotoAlbum/315_636866976738566232_HasThumb.jpg',
      ],
      dateSubmitted: DateTime(2017, 5, 31),
    ),
  ];
}

*/