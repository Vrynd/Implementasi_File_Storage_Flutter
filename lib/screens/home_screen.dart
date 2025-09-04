import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _fileNameController = TextEditingController();
  final _contentsController = TextEditingController();

  final _textStyle = TextStyle(fontSize: 14);

  @override
  void dispose() {
    _fileNameController.dispose();
    _contentsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('HomeScreen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: _createNewFile,
                      child: Text('New File', style: _textStyle),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: _openFile,
                      child: Text('Open File', style: _textStyle),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: _saveFile,
                      child: Text('Save File', style: _textStyle),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _fileNameController,
                      style: _textStyle,
                      decoration: const InputDecoration(
                        hintText: "File name.txt",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox.square(dimension: 16),
              TextField(
                controller: _contentsController,
                maxLines: null,
                minLines: 6,
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  hintText: "Input your text here.",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createNewFile() {}
  void _openFile() async {}
  void _saveFile() async {}
}
