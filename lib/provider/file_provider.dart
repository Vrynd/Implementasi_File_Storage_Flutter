import 'package:file_app/service/file_service.dart';
import 'package:flutter/material.dart';

class FileProvider extends ChangeNotifier {
  final FileService _service;

  FileProvider(this._service);

  String? _contents;
  String? get contents => _contents;

  String? _message;
  String? get message => _message;

  List<String> _filesName = [];
  List<String> get filesName => _filesName;


  // Save File
  Future<void> saveFile(String filename, String contents) async{
    try{
      await _service.writeFile(filename, contents);
      _message = "File saved successfully";
      notifyListeners();
    }catch(e){
      _message = "Failed to save file: $e";
      notifyListeners();
    }
  }

  // Read File
  Future<void> readFile(String filename) async{
    try{
      _contents = await _service.readFile(filename);
      notifyListeners();
    }catch(e){
      _message = "Failed to read file: $e";
      notifyListeners();
    }
  }

  // Get File
  Future<void> getFileInDirectory() async{
    try{
      _filesName = await _service.getFileInDirectory();
      notifyListeners();
    }catch(e){
      _message = "Failed to read file: $e";
      notifyListeners();
    }
  }
}
