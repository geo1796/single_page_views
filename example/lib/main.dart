import 'package:flutter/material.dart';
import 'package:single_page_views/model/single_page_view.dart';
import 'package:single_page_views/single_page_views.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: buildSinglePageViews(views));
  }
}

final views = <SinglePageView>[
  SinglePageView(
    scaffold: Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: const Center(child: Text('Home content')),
    ),
    leading: Icon(Icons.home, color: Colors.white),
    title: Text('Home', style: TextStyle(color: Colors.white)),
  ),
  SinglePageView(
    scaffold: Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: const Center(child: Text('Settings content')),
    ),
    leading: Icon(Icons.settings, color: Colors.white),
    title: Text('Settings', style: TextStyle(color: Colors.white)),
  ),
];
