String? validateString(String? value) {
  if (value == null || value.isEmpty) {
    return 'กรุณากรอกข้อมูล';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'กรุณากรอกข้อมูล';
  } else if (!RegExp(
          r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(value.trim())) {
    return 'รูปแบบอีเมลไม่ถูกต้อง';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'กรุณากรอกข้อมูล';
  } else if (value.length < 6) {
    return 'กรุณากรอกรหัสผ่าน 6 ตัวขึ้นไป';
  }
  return null;
}

String? validatePasswordMatching(String? value1, String? value2) {
  if (value1 == null || value1.isEmpty) {
    return 'กรุณากรอกข้อมูล';
  } else if (value1 != value2) {
    return 'รหัสผ่านไม่เหมือนกัน';
  }
  return null;
}

String? validateStringWithLength(String? value, int length) {
  if (value == null || value.isEmpty) {
    return 'กรุณากรอกข้อมูล';
  } else if (value.length != length) {
    return 'ต้องมี $length หลัก!';
  }
  return null;
}

/*String? validateInt(String? value) {
  if (value == null || value.isEmpty) {
    return 'กรุณากรอกข้อมูล';
  } else if (!isNumeric(value)) {
    return 'เฉพาะตัวเลขเท่านั้น';
  }
  return null;
}*/

/*String? validatePhone(String? value) {
  if (value == null || value.isEmpty) {
    return LocaleKeys.please_enter_information.tr();
  } else if (value.length != 10) {
    return LocaleKeys.phone_number_must_ten_digits.tr();
  } else if (!isNumeric(value)) {
    return LocaleKeys.only_numbers.tr();
  }
  return null;
}*/

/*String? validatateBookBank(String? value) {
  if (value == null || value.isEmpty) {
    return LocaleKeys.please_enter_information.tr();
  } else if (value.length < 10 || value.length > 15) {
    return 'เลขที่บัญชีธนาคารต้องมี 10-15 หลัก';
  } else if (!isNumeric(value)) {
    return LocaleKeys.only_numbers.tr();
  }
  return null;
}*/

/*String? validateIdcard(String? value) {
  if (value == null || value.isEmpty) {
    return LocaleKeys.please_enter_information.tr();
  } else if (value.length != 13) {
    return 'เลขบัตรประจำตัวประชาชนต้องมี 13 หลัก';
  } else if (!isNumeric(value)) {
    return LocaleKeys.only_numbers.tr();
  }
  return null;
}*/
