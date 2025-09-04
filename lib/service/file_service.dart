import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class FileService {
  Future<String> getFilePath(String filename) async {
    final directory = await getApplicationDocumentsDirectory();
    final prefixDirectory = directory.path;
    final absolutePath = path.join(prefixDirectory, filename);
    return absolutePath;
  }

  Future<void> writeFile(String filename, String contents) async {
    try {
      final filePath = await getFilePath(filename);
      final file = File(filePath);
      await file.writeAsString(contents);
    } catch (e) {
      throw Exception("Failed to write file: $e");
    }
  }

  Future<String> readFile(String filename) async {
    try {
      final filePath = await getFilePath(filename);
      final file = File(filePath);

      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      throw Exception("Failed to read file: $e");
    }
  }

  Future<List<String>>getFileInDirectory() async{
    try{
      final directory = await getApplicationDocumentsDirectory();
      final files = directory.listSync().toList().where((file) => file.path.endsWith('.txt'));
      final filesName = files.map((file) => path.split(file.path).last).toList();
      return filesName;
    }catch(e){
      throw Exception("Failed to read file: $e");
    }
  }
}
