class TValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email là bắt buộc.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Email không hợp lệ.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Chưa nhập mật khẩu.';
    }

    // Check for minimum password length
    if (value.length < 6) {
      return 'Mật khẩu phải có từ 6 kí tự trở lên.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Mật khẩu phải có ít nhất 1 kí tự viết hoa.';
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Mật khẩu phải có ít nhất 1 số.';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Mật khẩu phải có ít nhất 1 kí tự đặc biệt.';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Số điện thoại là bắt buộc.';
    }

    // Regular expression for phone number validation (VN phone number format)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Định dạng số điện thoại không hợp lệ';
    }

    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Tên là bắt buộc.';
    }

    // // Regular expression for name validation (no special characters)
    // final nameRegExp = RegExp(r'^[a-zA-Z_0-9]+$');

    // if (!nameRegExp.hasMatch(value)) {
    //   return 'Tên không được chứa kí tự đặc biệt.';
    // }

    return null;
  }

  static String? validateOldPassword(String? value, String? oldPassword) {
    if (value == null || value.isEmpty) {
      return 'Chưa nhập mật khẩu.';
    } else if (value != oldPassword) {
      return 'Mật khẩu không trùng khớp.';
    }

    return null;
  }

  static String? validateRetypePassword(String? value, String? newPassword) {
    if (value == null || value.isEmpty) {
      return 'Chưa nhập lại mật khẩu.';
    } else if (value != newPassword) {
      return 'Nhập lại mật khẩu không đúng.';
    }

    return null;
  }
// Add more custom validators as needed for your specific requirements.
}
