import 'package:flutter/material.dart';
import 'package:noticias/pages/home_page.dart';
import 'package:noticias/pages/politics_page.dart';
import 'package:noticias/pages/team_page.dart';
import 'package:noticias/pages/tech_page.dart';
import 'package:noticias/providers/news_provider.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static const _mainColor = Color.fromARGB(255, 16, 122, 85);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void dispose(){
    newsProvider.newsStreamController.close();
    super.dispose();
  }

  int _pageIndex = 1;
  static const List<Widget> _pages = <Widget>[
    TechPage(),
    HomePage(),
    PoliticsPage(),
    TeamPage()
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News API',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: MyApp._mainColor,
          title: const Text('News API'),
        ),
        body: _pages.elementAt(_pageIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Laptop'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined),
              label: 'Book',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Person',
            ),
          ],
          iconSize: 30,
          currentIndex: _pageIndex,
          onTap: _onItemTapped,
          selectedItemColor: MyApp._mainColor,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _pageIndex = index;
    });
  }
}
