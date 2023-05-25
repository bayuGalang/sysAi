import 'package:intl/intl.dart';
import 'package:itcc_mobile/shared/thame.dart';
import 'package:recase/recase.dart';
import 'package:flutter/material.dart';

String? validateName(String? value) {
  if (value!.length == 0)
    return 'Nama lengkap tidak boleh kosong';
  else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value))
    return 'Format Nama Tidak Valid';
  else
    return null;
}

String? validatePassword(String? value) {
  if (value!.length == 0)
    return 'Password tidak boleh kosong';
  else if (value.length < 8)
    return 'Password minimal harus berjumlah 8 karakter';
  else
    return null;
}

String? validateRePassword(String? value, String password) {
  if (value!.length == 0)
    return 'Password tidak boleh kosong';
  else if (value.length < 8)
    return 'Password minimal harus berjumlah 8 karakter';
  else if (value != password) {
    return 'Password tidak sama';
  }
  return null;
}

String? validateEmail(String? value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern.toString());
  if (value!.length == 0)
    return 'Email tidak boleh kosong';
  else if (!regex.hasMatch(value))
    return 'Mohon masukkan email yang valid';
  else
    return null;
}

String? validateReEmail(String? value, String email) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern.toString());
  if (value!.length == 0)
    return 'Konfirmasi email tidak boleh kosong';
  else if (!regex.hasMatch(value))
    return 'Mohon masukkan konfirmasi email yang valid';
  else if (value != email)
    return 'Email tidak sama';
  else
    return null;
}

String? validatePhone(String? value) {
  Pattern pattern =
      r'^[08][0-9]{11}$';
  RegExp regex = new RegExp(pattern.toString());
  if (value!.length == 0)
    return 'Nomor telepon tidak boleh kosong';
  else if (!regex.hasMatch(value))
    return 'Mohon masukkan nomor telepon yang valid';
  else
    return null;
}

String? validateNim(String? value) {
  Pattern pattern =
      r'^[0-9]';
  RegExp regex = new RegExp(pattern.toString());
  if (value!.length != 9)
    return 'Nim Harus Sesuai';
  else if (!regex.hasMatch(value))
    return 'Mohon masukkan NIM yang valid';
  else
    return null;
}
String? validateAngkatan(String? value) {
  if (value!.length != 4)
    return 'Masukan Tahun Angkatan';
  else
    return null;
}

String? validateCoupon(String? value) {
  Pattern pattern =
      r'^[0-9]';
  RegExp regex = new RegExp(pattern.toString());
  if (value!.contains(' '))
    return 'Harap masukkan kupon tanpa spasi';
  else if (!regex.hasMatch(value))
    return 'Mohon masukkan Tahun Angkatan yang valid';
  else {
    return null;
  }
}

String? validateMasaBerlaku(String? value) {
  if (value!.length != 5)
    return 'Data belum lengkap';
  else
    return null;
}

String? validateKodeKeamanan(String? value) {
  if (value!.length != 3)
    return 'Panjang Kode Keamanan harus 3 karakter';
  else
    return null;
}

String? validateDate(String? value) {
  if (value!.isEmpty) {
    return 'Data tidak boleh kosong';
  }

  int year;
  int month;
  // The value contains a forward slash if the month and year has been
  // entered.
  if (value.contains(new RegExp(r'(\/)'))) {
    var split = value.split(new RegExp(r'(\/)'));
    // The value before the slash is the month while the value to right of
    // it is the year.
    month = int.parse(split[0]);
    year = int.parse(split[1]);
  } else {
    // Only the month was entered
    month = int.parse(value.substring(0, (value.length)));
    year = -1; // Lets use an invalid year intentionally
  }

  if ((month < 1) || (month > 12)) {
    // A valid month is between 1 (January) and 12 (December)
    return 'Masukkan Bulan yang valid';
  }

  var fourDigitsYear = convertYearTo4Digits(year);
  if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
    // We are assuming a valid year should be between 1 and 2099.
    // Note that, it's valid doesn't mean that it has not expired.
    return 'Masukkan Tahun yang valid';
  }

  if (!hasDateExpired(month, year)) {
    return "Kartu telah kadaluarsa";
  }
  return null;
}

/// Convert the two-digit year to four-digit year if necessary
int convertYearTo4Digits(int year) {
  if (year < 100 && year >= 0) {
    var now = DateTime.now();
    String currentYear = now.year.toString();
    String prefix = currentYear.substring(0, currentYear.length - 2);
    year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
  }
  return year;
}

bool hasDateExpired(int? month, int? year) {
  return !(month == null || year == null) && isNotExpired(year, month);
}

bool isNotExpired(int year, int month) {
  // It has not expired if both the year and date has not passed
  return !hasYearPassed(year) && !hasMonthPassed(year, month);
}

bool hasMonthPassed(int year, int month) {
  var now = DateTime.now();
  // The month has passed if:
  // 1. The year is in the past. In that case, we just assume that the month
  // has passed
  // 2. Card's month (plus another month) is less than current month.
  return hasYearPassed(year) ||
      convertYearTo4Digits(year) == now.year && (month < now.month + 1);
}

bool hasYearPassed(int year) {
  int fourDigitsYear = convertYearTo4Digits(year);
  var now = DateTime.now();
  // The year has passed if the year we are currently, is greater than card's
  // year
  return fourDigitsYear < now.year;
}

String cleanTagHtml(String htmlText) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  return htmlText.replaceAll(exp, '');
}

String filterDuration(String str) {
  str = str.replaceAll('m', ' menit ');
  str = str.replaceAll('j', ' jam ');
  str = str.replaceAll('d', ' detik video pembelajaran');
  return str;
}

// numberFormat(String? discountPrice) {
//   return NumberFormat.currency(
//     locale: 'id',
//     decimalDigits: 0,
//     symbol: 'Rp. ',
//   ).format(int.parse(discountPrice ?? '0'));
// }
String? birthDateValidator(String? value) {
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy');
  final String formatted = formatter.format(now);
  String? str1 = value;
  List<String> str2 = str1!.split('/');
  String month = str2.isNotEmpty ? str2[0] : '';
  String day = str2.length > 1 ? str2[1] : '';
  String year = str2.length > 2 ? str2[2] : '';
  if (value!.isEmpty) {
    return 'BirthDate is Empty';
  } else if (int.parse(month) > 13) {
    return 'Month is invalid';
  } else if (int.parse(day) > 32) {
    return 'Day is invalid';
  } else if ((int.parse(year) > int.parse(formatted))) {
    return 'Year is invalid';
  } else if ((int.parse(year) < 1920)) {
    return 'Year is invalid';
  }
  return null;
}

String validatorSearch(String inputSearch) {
  inputSearch = inputSearch.trimLeft();
  inputSearch = inputSearch.replaceAll(' ', '%');

  return inputSearch;
}

String dateFormatUlasan(String date) {
  date = date.replaceAll(' ', '-');
  date = date.replaceAll('Januari', 'Jan');
  date = date.replaceAll('Februari', 'Feb');
  date = date.replaceAll('Maret', 'Mar');
  date = date.replaceAll('April', 'Apr');
  date = date.replaceAll('Juni', 'Jun');
  date = date.replaceAll('Juli', 'Jul');
  date = date.replaceAll('Agustus', 'Agu');
  date = date.replaceAll('September', 'Sep');
  date = date.replaceAll('Oktober', 'Okt');
  date = date.replaceAll('November', 'Nov');
  date = date.replaceAll('Desember', 'Des');
  return date;
}

String formatAktivitas(String input) {
  if (input.length >= 6) {
    input = input.replaceAll('m', ':');
    input = input.replaceAll('j', ':');
    input = input.replaceAll('d', '');
    return input = '0' + input;
  } else {
    input = input.replaceAll('m', ':');
    input = input.replaceAll('j', ':');
    input = input.replaceAll('d', '');
  }

  return input;
}

String persentaseUlasan(String input) {
  input = input.replaceAll('%', '');
  if (input.length > 4) {
    input = input.replaceAll('.', '');
    input = input.substring(0, 2);
  }
  return input;
}

String iconCategory(String input) {
  input = input.replaceAll('fas fa-', '');

  return input.camelCase;
}

// late List<String> _words;
// String _upperCaseFirstLetter(String word) {
//   return '${word.substring(0, 1).toUpperCase()}${word.substring(1).toLowerCase()}';
// }

// String getCamelCase({String separator: ''}) {
//   List<String> words = _words.map(_upperCaseFirstLetter).toList();
//   if (_words.isNotEmpty) {
//     words[0] = words[0].toLowerCase();
//   }

//   return words.join(separator);
// }
// List<String> words(String subject, [Pattern customPattern = defaultPattern]) {
//   if (subject is! String || subject.length == 0) {
//     return [];
//   }

//   RegExp pattern;

//   if (customPattern is String) {
//     pattern = RegExp(customPattern);
//   } else if (customPattern is RegExp) {
//     pattern = customPattern;
//   }

//   return pattern.allMatches(subject).map((m) => m.group(0)).toList();
// }
// String camelCase(String subject) {
//   List<String> _splittedString = words(subject);

//   if (_splittedString.length == 0) {
//     return '';
//   }

//   String _firstWord = lowerCase(_splittedString[0]);
//   List<String> _restWords = _splittedString
//       .sublist(1)
//       .map((String x) => capitalize(x, true))
//       .toList();

//   return _firstWord + _restWords.join('');
// }

String filterAnd(String input) {
  input = input.replaceAll('&amp;', '&');
  return input;
}

numberFormat(String? discountPrice) {
  return NumberFormat.currency(
    locale: 'id',
    decimalDigits: 0,
    symbol: 'Rp ',
  ).format(int.parse(discountPrice ?? '0'));
}

customTextValidator(bool? isTextEmpty, String validatorText) {
  return Text(
    isTextEmpty == null
        ? ''
        : isTextEmpty
        ? "     " + validatorText
        : '',
    style: blackTextStyle.copyWith(
      color: Colors.red[700],
      fontSize: 12.5,
      height: isTextEmpty == null
          ? 0
          : isTextEmpty
          ? null
          : 0,
    ),
    textAlign: TextAlign.start,
  );
}
