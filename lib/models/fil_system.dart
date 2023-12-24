import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:chatdrop/utility/color.dart';
import 'package:chatdrop/utility/tkdicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FileSystem {
  final File file;
  FileState state = FileState.error;
  FileSystem(this.file);
  String get filepath => file.path;
  String get filename => file.uri.pathSegments.last;
  String get fileextension => file.path.split('.').last;

  Future<FileState> checkexists() async {
    if (state == FileState.error) {
      bool fileExists = await file.exists();
      if (!fileExists) {
        try {
          await file.create(recursive: true);
          state = FileState.created;
        } catch (e) {
          state = FileState.error;
        }
      } else {
        state = FileState.already;
      }
    } else {
      state = FileState.already;
    }
    return state;
  }

  writeAsString(String jsonEncode) async {
    await file.writeAsString(jsonEncode);
  }

  delete() async {
    bool fileExists = await file.exists();
    if (fileExists) {
      try {
        await file.delete();
      } catch (e) {
        debugPrint('File delete error: $e');
      }
    }
  }

  writeAsImage(Uint8List jsonEncode) async {
    file.writeAsBytesSync(jsonEncode);
  }

  Future<Map> readAsMap() async {
    await file.readAsString().then((value) {
      debugPrint(value.toString());
      // Map valueMap = json.decode(readAsString);
      Map valueMap = jsonDecode(value);
      debugPrint(valueMap.toString());
      return valueMap;
    });
    return {};
  }

  Future<int> length() async {
    return await file.length();
  }

  // void writeAsBytesSync(Uint8List bodyBytes) {}
}

enum FileState {
  created,
  already,
  error,
}

enum FileType {
  msWord,
  msPowerPoint,
  msExcel,
  msOutlook,
  msAccess,
  video,
  music,
  docs,
  image,
  other,
}

enum FolderType {
  simpleFolder,
  memorycard,
  video,
  music,
  docs,
  image,
  other,
}

IconData fileIcon(type) {
  switch (type) {
    case FolderType.memorycard:
      return Tkdicons.sdCard;
    case FolderType.simpleFolder:
      return Tkdicons.folder;
    case FileType.msAccess:
      return Tkdicons.ms_access;
    case FileType.msExcel:
      return Tkdicons.ms_excel;
    case FileType.msOutlook:
      return Tkdicons.ms_outlook;
    case FileType.msPowerPoint:
      return Tkdicons.ms_power_point;
    case FileType.msWord:
      return Tkdicons.ms_word;
    case FileType.video:
      return Tkdicons.videoFolder;
    case FileType.music:
      return Tkdicons.music;
    case FileType.docs:
      return Tkdicons.doc_text_inv;
    case FileType.image:
      return Tkdicons.albumFolder;
    default:
      return Icons.extension;
  }
}

LinearGradient fileGradient(type) {
  switch (type) {
    case FileType.msAccess:
      return const LinearGradient(
        colors: [Colors.redAccent, Colors.red],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    case FileType.msExcel:
      return const LinearGradient(
        colors: [Colors.greenAccent, Colors.green],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    case FileType.msOutlook:
      return const LinearGradient(
        colors: [Colors.lightBlueAccent, Colors.lightBlue],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    case FileType.msPowerPoint:
      return const LinearGradient(
        colors: [Colors.orangeAccent, Colors.orange],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    case FileType.msWord:
      return const LinearGradient(
        colors: [Colors.blueAccent, Colors.blue],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    default:
      return LinearGradient(
        colors: [TKDColor.tkd1, TKDColor.tkd2],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
  }
}
