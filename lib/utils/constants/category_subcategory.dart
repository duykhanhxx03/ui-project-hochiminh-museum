class TCategorySubCategoryConstanst {
  static const Map<String, List<String>> newsCategoryWithSubCategories = {
    'Tin Tức - Sự kiện': [
      'Hoạt động của bảo tàng Hồ Chí Minh',
      'Hoạt động của hệ thống các bảo tàng, di tích lưu niệm về chủ tích Hồ Chí Minh',
      'Hoạt động ngành di sản văn hóa',
      'Hoạt động bảo tàng trên thế giới'
    ],
    'Nghiên cứu': [
      'Nghiên cứu về Hồ Chí Minh',
      'Chuyện kể về Hồ Chí Minh',
      'Ấn phẩm về Hồ Chí Minh',
      'Bộ sưu tập',
      'Hiện vật kể chuyện',
      'Hoạt động khoa học',
      'Công bố khoa học'
    ],
    'Giáo dục': [
      'Học tập và làm theo tấm gương đạo đức, phong cách Hồ Chí Minh',
      'Kể chuyện tấm gương đạo đức Hồ Chí Minh',
      'Những tấm gương bình dị mà cao quý',
      'Phòng khám phá, trải nghiệm',
      'Bồi dưỡng nghiệp vụ thuyết minh',
      'Các hoạt động giáo dục khác',
    ],
    // 'Trưng bày': [
    //   'Trưng bày online',
    //   'Trưng bày thường xuyên',
    //   'Trưng bày chuyên đề',
    // ],
    // 'Hỗ trợ tham quan': [
    //   'Giờ mở cửa',
    //   'Thông tin vé tham quan',
    //   'Nội quy tham quan'
    // ],
  };
  static List<String> getAvailableSubCategories(selectedNewsCategory) {
    return newsCategoryWithSubCategories[selectedNewsCategory] ?? [];
  }

  static String getSubNewsCategoryDBName(
      String newsCategory, String subNewsCategory) {
    switch (newsCategory) {
      case 'Tin Tức - Sự kiện':
        switch (subNewsCategory) {
          case 'Hoạt động của bảo tàng Hồ Chí Minh':
            return 'HDBaoTang';
          case 'Hoạt động của hệ thống các bảo tàng, di tích lưu niệm về chủ tích Hồ Chí Minh':
            return 'HDHeThongCacBT_DTLuuNiemHCM';
          case 'Hoạt động ngành di sản văn hóa':
            return 'HDNganhDSVH';
          case 'Hoạt động bảo tàng trên thế giới':
            return 'HDBaoTangTrenTG';
        }
        break;
      case 'Nghiên cứu':
        switch (subNewsCategory) {
          case 'Nghiên cứu về Hồ Chí Minh':
            return 'NghienCuuHCM';
          case 'Chuyện kể về Hồ Chí Minh':
            return 'ChuyenKeHCM';
          case 'Ấn phẩm về Hồ Chí Minh':
            return 'AnPhamHCM';
          case 'Bộ sưu tập':
            return 'BoSuuTap';
          case 'Hiện vật kể chuyện':
            return 'HienVatKeChuyen';
          case 'Hoạt động khoa học':
            return 'HDKhoaHoc';
          case 'Công bố khoa học':
            return 'CongBoKH';
        }
        break;
      case 'Giáo dục':
        switch (subNewsCategory) {
          case 'Học tập và làm theo tấm gương đạo đức, phong cách Hồ Chí Minh':
            return 'HocTapTheoTamGuongHCM';
          case 'Kể chuyện tấm gương đạo đức Hồ Chí Minh':
            return 'KeChuyenHCM';
          case 'Những tấm gương bình dị mà cao quý':
            return 'NhungTamGuong';
          case 'Phòng khám phá, trải nghiệm':
            return 'PhongKhamPha';
          case 'Bồi dưỡng nghiệp vụ thuyết minh':
            return 'BoiDuongNghiepVu';
          case 'Các hoạt động giáo dục khác':
            return 'CacHoatDongKhac';
        }
        break;
    }
    return '';
  }

  static String getSubNewsCategoryName(
      String newsCategory, String subNewsCategory) {
    switch (newsCategory) {
      case 'Tin Tức - Sự kiện':
        switch (subNewsCategory) {
          case 'HDBaoTang':
            return 'Hoạt động của bảo tàng Hồ Chí Minh';
          case 'HDHeThongCacBT_DTLuuNiemHCM':
            return 'Hoạt động của hệ thống các bảo tàng, di tích lưu niệm về chủ tích Hồ Chí Minh';
          case 'HDNganhDSVH':
            return 'Hoạt động ngành di sản văn hóa';
          case 'HDBaoTangTrenTG':
            return 'Hoạt động bảo tàng trên thế giới';
        }
        break;
      case 'Nghiên cứu':
        switch (subNewsCategory) {
          case 'NghienCuuHCM':
            return 'Nghiên cứu về Hồ Chí Minh';
          case 'ChuyenKeHCM':
            return 'Chuyện kể về Hồ Chí Minh';
          case 'AnPhamHCM':
            return 'Ấn phẩm về Hồ Chí Minh';
          case 'BoSuuTap':
            return 'Bộ sưu tập';
          case 'HienVatKeChuyen':
            return 'Hiện vật kể chuyện';
          case 'HDKhoaHoc':
            return 'Hoạt động khoa học';
          case 'CongBoKH':
            return 'Công bố khoa học';
        }
        break;
      case 'Giáo dục':
        switch (subNewsCategory) {
          case 'HocTapTheoTamGuongHCM':
            return 'Học tập và làm theo tấm gương đạo đức, phong cách Hồ Chí Minh';
          case 'KeChuyenHCM':
            return 'Kể chuyện tấm gương đạo đức Hồ Chí Minh';
          case 'NhungTamGuong':
            return 'Những tấm gương bình dị mà cao quý';
          case 'PhongKhamPha':
            return 'Phòng khám phá, trải nghiệm';
          case 'BoiDuongNghiepVu':
            return 'Bồi dưỡng nghiệp vụ thuyết minh';
          case 'CacHoatDongKhac':
            return 'Các hoạt động giáo dục khác';
        }
        break;
    }
    return '';
  }

  static String getNewsCategoryDBName(String newsCategory) {
    switch (newsCategory) {
      case 'Tin Tức - Sự kiện':
        return 'TinTucSuKien';
      case 'Nghiên cứu':
        return 'NghienCuu';
      case 'Giáo dục':
        return 'GiaoDuc';
      // case 'Trưng bày':
      //   return 'TrungBay';
      // case 'Hỗ trợ tham quan':
      //   return 'HoTroThamQuan';
      default:
        return '';
    }
  }

  static String getNewsCategoryName(String newsCategory) {
    switch (newsCategory) {
      case 'TinTucSuKien':
        return 'Tin Tức - Sự kiện';
      case 'NghienCuu':
        return 'Nghiên cứu';
      case 'GiaoDuc':
        return 'Giáo dục';
      // case 'TrungBay':
      //   return 'Trưng bày';
      // case 'HoTroThamQuan':
      //   return 'Hỗ trợ tham quan';
      default:
        return '';
    }
  }
}
