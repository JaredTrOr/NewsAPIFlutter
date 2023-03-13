import 'package:flutter/material.dart';
import 'package:noticias/pages/home_page.dart';
import 'package:noticias/providers/news_provider.dart';

void main() => runApp(const MyApp());

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

  int _pageIndex = 0;
  static const List<Widget> _pages = <Widget>[
    Text('Tech'),
    HomePage(),
    Text('Policy'),
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: MyApp._mainColor,
          title: const Text('News'),
        ),
        body: _pages.elementAt(_pageIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.laptop_mac_outlined),
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
