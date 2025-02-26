/// Name validator
String? nameValidator(String? value){
  if (value!.trim().isEmpty) {
    return "Bạn chưa nhập tên";
  }
  else if (value.length < 8) {
    return "Tên phải có ít nhất 8 ký tự ";
  }
  return null;
}

/// Phone validator
String? phoneValidator(String? value) {
  RegExp regex = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
  if (value!.trim().isEmpty) {
    return "Bạn chưa nhập số điện thoại";
  }
  else if (!regex.hasMatch(value)) {
    return "Số điện thoại không hợp lệ";
  }
  return null;
}

/// Email validator
String? emailValidator(String? value) {
  RegExp regex = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if (value!.trim().isEmpty) {
    return "Bạn chưa nhập email";
  }
  else if (!regex.hasMatch(value)) {
    return "Email không chính xác, vui lòng nhập lại";
  }
  return null;
}

/// Password validator
String? passwordValidator(String? value) {
  RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value!.trim().isEmpty) {
    return "Bạn chưa nhập mật khẩu";
  }
  else if (value.length < 8 || value.length >20) {
    return "Mật khẩu phải có ít nhất 8 ký tự và không quá 20 ký tự";
  }
  else if (!regex.hasMatch(value)) {
    return "Mật khẩu phải có ít nhât 1 ký tự viết hoa, 1 ký tự số, 1 ký tự đặc biệt";
  }
  return null;
}

/// Confirm password validator
String? confirmPasswordValidator(String? value, String? password) {
  if (value != password) {
    return "Mật khẩu chưa trùng khớp, vui lòng kiểm tra lại";
  } else if (password!.isEmpty) {
    return "Bạn chưa nhập mật khẩu";
  }
  return null;
}