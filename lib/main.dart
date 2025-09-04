import 'package:file_app/provider/file_provider.dart';
import 'package:file_app/screens/home_screen.dart';
import 'package:file_app/service/file_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // todo-03-provider-07: register the provider
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => FileService()),
        ChangeNotifierProvider(
          create: (context) => FileProvider(context.read<FileService>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
