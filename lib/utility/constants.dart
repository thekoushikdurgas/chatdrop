import 'dart:io';
import 'dart:math';
import 'package:chatdrop/models/fil_system.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

const Map<String, String> countryCodeJson = {
  'Argentina': 'ar',
  'Austria': 'at',
  'Australia': 'au',
  'Belgium': 'be',
  'Bulgaria': 'bg',
  'Bolivia': 'bo',
  'Brazil': 'br',
  'Canada': 'ca',
  'Chile': 'cl',
  'Colombia': 'co',
  'Costa Rica': 'cr',
  'Czech Republic': 'cz',
  'Denmark': 'dk',
  'Dominican Republic': 'do',
  'Ecuador': 'ec',
  'Estonia': 'ee',
  'Egypt': 'eg',
  'El Salvador': 'sv',
  'Finland': 'fi',
  'France': 'fr',
  'Germany': 'de',
  'Greece': 'gr',
  'Guatemala': 'gt',
  'Hong Kong': 'hk',
  'Honduras': 'hn',
  'Hungary': 'hu',
  'Indonesia': 'id',
  'Ireland': 'ie',
  'Israel': 'il',
  'India': 'in',
  'Iceland': 'is',
  'Italy': 'it',
  'Japan': 'jp',
  'Korea': 'kr',
  'Lithuania': 'lt',
  'Luxembourg': 'lu',
  'Latvia': 'lv',
  'Morocco': 'ma',
  'Mexico': 'mx',
  'Malaysia': 'my',
  'Nicaragua': 'ni',
  'Netherlands': 'nl',
  'Norway': 'no',
  'New Zealand': 'nz',
  'Panama': 'pa',
  'Peru': 'pe',
  'Philippines': 'ph',
  'Poland': 'pl',
  'Portugal': 'pt',
  'Paraguay': 'py',
  'Romania': 'ro',
  'Russian Federation': 'ru',
  'Saudi Arabia': 'sa',
  'Sweden': 'se',
  'Singapore': 'sg',
  'Spain': 'es',
  'South Africa': 'za',
  'Slovakia': 'sk',
  'Switzerland': 'ch',
  'Thailand': 'th',
  'Turkey': 'tr',
  'Taiwan': 'tw',
  'Ukraine': 'ua',
  'United Arab Emirates': 'ae',
  'United Kingdom': 'gb',
  'United States': 'us',
  'Uruguay': 'uy',
  'Vietnam': 'vn',
};

const Map<String, String> localChartCodeJson = {
  'Global': '37i9dQZEVXbMDoHDwVN2tF',
  'Argentina': '37i9dQZEVXbMMy2roB9myp',
  'Australia': '37i9dQZEVXbJPcfkRz0wJ0',
  'Austria': '37i9dQZEVXbKNHh6NIXu36',
  'Belarus': '37i9dQZEVXbIYfjSLbWr4V',
  'Belgium': '37i9dQZEVXbJNSeeHswcKB',
  'Bolivia': '37i9dQZEVXbJqfMFK4d691',
  'Brazil': '37i9dQZEVXbMXbN3EUUhlg',
  'Bulgaria': '37i9dQZEVXbNfM2w2mq1B8',
  'Canada': '37i9dQZEVXbKj23U1GF4IR',
  'Chile': '37i9dQZEVXbL0GavIqMTeb',
  'Colombia': '37i9dQZEVXbOa2lmxNORXQ',
  'Costa Rica': '37i9dQZEVXbMZAjGMynsQX',
  'Czeck Republic': '37i9dQZEVXbIP3c3fqVrJY',
  'Denmark': '37i9dQZEVXbL3J0k32lWnN',
  'Dominican Republic': '37i9dQZEVXbKAbrMR8uuf7',
  'Ecuador': '37i9dQZEVXbJlM6nvL1nD1',
  'Egypt': '37i9dQZEVXbJqdarpmTJDL',
  'El Salvador': '37i9dQZEVXbLxoIml4MYkT',
  'Estonia': '37i9dQZEVXbLesry2Qw2xS',
  'Finland': '37i9dQZEVXbMxcczTSoGwZ',
  'France': '37i9dQZEVXbIPWwFssbupI',
  'Germany': '37i9dQZEVXbJiZcmkrIHGU',
  'Greece': '37i9dQZEVXbJqdarpmTJDL',
  'Guatemala': '37i9dQZEVXbLy5tBFyQvd4',
  'Honduras': '37i9dQZEVXbJp9wcIM9Eo5',
  'Hong Kong': '37i9dQZEVXbLwpL8TjsxOG',
  'Hungary': '37i9dQZEVXbNHwMxAkvmF8',
  'Iceland': '37i9dQZEVXbKMzVsSGQ49S',
  'India': '37i9dQZEVXbLZ52XmnySJg',
  'Indonesia': '37i9dQZEVXbObFQZ3JLcXt',
  'Ireland': '37i9dQZEVXbKM896FDX8L1',
  'Israel': '37i9dQZEVXbJ6IpvItkve3',
  'Italy': '37i9dQZEVXbIQnj7RRhdSX',
  'Japan': '37i9dQZEVXbKXQ4mDTEBXq',
  'Kazakhstan': '37i9dQZEVXbM472oKPNKzS',
  'Latvia': '37i9dQZEVXbJWuzDrTxbKS',
  'Lithuania': '37i9dQZEVXbMx56Rdq5lwc',
  'Luxembourg': '37i9dQZEVXbKGcyg6TFGx6',
  'Malaysia': '37i9dQZEVXbJlfUljuZExa',
  'Mexico': '37i9dQZEVXbO3qyFxbkOE1',
  'Morocco': '37i9dQZEVXbJqdarpmTJDL',
  'Netherlands': '37i9dQZEVXbKCF6dqVpDkS',
  'New Zealand': '37i9dQZEVXbM8SIrkERIYl',
  'Nicaragua': '37i9dQZEVXbISk8kxnzfCq',
  'Nigeria': '37i9dQZEVXbKY7jLzlJ11V',
  'Norway': '37i9dQZEVXbJvfa0Yxg7E7',
  'Pakistan': '37i9dQZEVXbJkgIdfsJyTw',
  'Panama': '37i9dQZEVXbKypXHVwk1f0',
  'Paraguay': '37i9dQZEVXbNOUPGj7tW6T',
  'Peru': '37i9dQZEVXbJfdy5b0KP7W',
  'Philippines': '37i9dQZEVXbNBz9cRCSFkY',
  'Poland': '37i9dQZEVXbN6itCcaL3Tt',
  'Portugal': '37i9dQZEVXbKyJS56d1pgi',
  'Romania': '37i9dQZEVXbNZbJ6TZelCq',
  'Saudi Arabia': '37i9dQZEVXbLrQBcXqUtaC',
  'Singapore': '37i9dQZEVXbK4gjvS1FjPY',
  'Slovakia': '37i9dQZEVXbKIVTPX9a2Sb',
  'South Africa': '37i9dQZEVXbMH2jvi6jvjk',
  'South Korea': '37i9dQZEVXbNxXF4SkHj9F',
  'Spain': '37i9dQZEVXbNFJfN1Vw8d9',
  'Sweden': '37i9dQZEVXbLoATJ81JYXz',
  'Switzerland': '37i9dQZEVXbJiyhoAPEfMK',
  'Taiwan': '37i9dQZEVXbMnZEatlMSiu',
  'Thailand': '37i9dQZEVXbMnz8KIWsvf9',
  'Turkey': '37i9dQZEVXbIVYVBNw9D5K',
  'Ukraine': '37i9dQZEVXbKkidEfWYRuD',
  'UAE': '37i9dQZEVXbM4UZuIrvHvA',
  'United Kingdom': '37i9dQZEVXbLnolsZ8PSNw',
  'USA': '37i9dQZEVXbLRQDuF5jeBp',
  'Uruguay': '37i9dQZEVXbMJJi3wgRbAy',
  'Venezuela': '37i9dQZEVXbJ6IpvItkve3',
  'Vietnam': '37i9dQZEVXbLdGSmz6xilI',
};

const Map<String, String> languageCodeJson = {
  'English': 'en',
  'Arabic': 'ar',
  'Belarusian': 'be',
  'Chinese': 'zh',
  'Czech': 'cs',
  'Dutch': 'nl',
  'French': 'fr',
  'German': 'de',
  'Hebrew': 'he',
  'Hindi': 'hi',
  'Hungarian': 'hu',
  'Indonesian': 'id',
  'Italian': 'it',
  'Japanese': 'ja',
  'Korean': 'ko',
  'Malayalam': 'ml',
  'Nepali': 'ne',
  'Polish': 'pl',
  'Portuguese': 'pt',
  'Punjabi': 'pa',
  'Russian': 'ru',
  'Spanish': 'es',
  'Tamil': 'ta',
  'Turkish': 'tr',
  'Ukrainian': 'uk',
  'Urdu': 'ur',
};

String convertTime(Duration duration) {
  int secRemaining = duration.inSeconds % 60;
  int minsRemaining = duration.inMinutes % 60;
  int hrs = duration.inHours;
  String hrsStr = hrs < 10
      ? hrs == 0
          ? ''
          : '0$hrs:'
      : '$hrs:';
  String minsStr = minsRemaining < 10 ? '0$minsRemaining:' : '$minsRemaining:';
  String secStr = secRemaining < 10 ? '0$secRemaining' : '$secRemaining';
  return '$hrsStr$minsStr$secStr';
}

String getFileSize(int bytes, int decimals) {
  if (bytes <= 0) return "0 B";
  const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
  var i = (log(bytes) / log(1024)).floor();
  return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
}

String getFileDate(DateTime dateTime) {
  String day = dateTime.day.toString().padLeft(2, '0');
  String month = dateTime.month.toString().padLeft(2, '0');
  String year = dateTime.year.toString();
  String hour = dateTime.hour.toString().padLeft(2, '0');
  String minute = dateTime.minute.toString().padLeft(2, '0');
  return '$day-$month-$year $hour:$minute';
}

int generateUniqueId(int lenght) {
  int currentTimestamp = DateTime.now().millisecondsSinceEpoch;
  int uniqueId = currentTimestamp ~/ 1000;
  String idString = uniqueId.toString();
  if (idString.length > lenght) idString = idString.substring(0, lenght);
  return uniqueId;
}

String filesize(dynamic size, [int round = 2]) {
  var divider = 1024;
  int size0;
  try {
    size0 = int.parse(size.toString());
  } catch (e) {
    throw ArgumentError('Can not parse the size parameter: $e');
  }

  if (size0 < divider) {
    return '$size0 B';
  }

  if (size0 < divider * divider && size0 % divider == 0) {
    return '${(size0 / divider).toStringAsFixed(0)} KB';
  }

  if (size0 < divider * divider) {
    return '${(size0 / divider).toStringAsFixed(round)} KB';
  }

  if (size0 < divider * divider * divider && size0 % divider == 0) {
    return '${(size0 / (divider * divider)).toStringAsFixed(0)} MB';
  }

  if (size0 < divider * divider * divider) {
    return '${(size0 / divider / divider).toStringAsFixed(round)} MB';
  }

  if (size0 < divider * divider * divider * divider && size0 % divider == 0) {
    return '${(size0 / (divider * divider * divider)).toStringAsFixed(0)} GB';
  }

  if (size0 < divider * divider * divider * divider) {
    return '${(size0 / divider / divider / divider).toStringAsFixed(round)} GB';
  }

  if (size0 < divider * divider * divider * divider * divider && size0 % divider == 0) {
    num r = size0 / divider / divider / divider / divider;
    return '${r.toStringAsFixed(0)} TB';
  }

  if (size0 < divider * divider * divider * divider * divider) {
    num r = size0 / divider / divider / divider / divider;
    return '${r.toStringAsFixed(round)} TB';
  }

  if (size0 < divider * divider * divider * divider * divider * divider && size0 % divider == 0) {
    num r = size0 / divider / divider / divider / divider / divider;
    return '${r.toStringAsFixed(0)} PB';
  } else {
    num r = size0 / divider / divider / divider / divider / divider;
    return '${r.toStringAsFixed(round)} PB';
  }
}

Color calculateTextColor(Color background) {
  return ThemeData.estimateBrightnessForColor(background) == Brightness.light ? Colors.black : Colors.white;
}

Color calculateBackgroudColor(Color background) {
  return ThemeData.estimateBrightnessForColor(background) == Brightness.dark ? Colors.black : Colors.white;
}

// Color calculateTextColor(Color background) {
//   return background.computeLuminance() >= 0.5 ? Colors.black : Colors.white;
// }
String? validateEmail(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);
  return value!.isNotEmpty && !regex.hasMatch(value) ? 'Enter a valid email address' : null;
}

const String androidpath = '/storage/emulated/0/durgas';

Future<void> downloadImage(String url, String foldername, String filename) async {
  var response = await get(Uri.parse(url));
  FileSystem documentDirectory = FileSystem(File("$androidpath/$foldername/$filename"));
  await Directory('$androidpath/$foldername').create(recursive: true);
  documentDirectory.writeAsImage(response.bodyBytes);
  debugPrint(documentDirectory.filepath);
}
