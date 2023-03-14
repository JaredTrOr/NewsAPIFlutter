import 'package:flutter/material.dart';
import 'package:noticias/providers/news_provider.dart';
import 'package:noticias/util/url_launcher.dart';
import 'package:noticias/widgets/breaking_news.dart';

import '../util/color_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _renderTopBreakingNew(),
          const SizedBox(height: 20),
          _createBreakingNews(context)
        ],
      ),
    );
  }

  Widget _renderTopBreakingNew() {
    return FutureBuilder(
        future: newsProvider.getBreakingNews(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                List data = snapshot.data!;
                return _createBreakingNewOfTheDay(context, data[0]);
              }
          }
        });
  }

  Widget _createBreakingNewOfTheDay(BuildContext context, Map data) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(
          image: NetworkImage(data['urlToImage']),
          fit: BoxFit.cover,
          width: screenSize.width * 1,
        ),
        Container(
            padding: const EdgeInsets.all(30),
            width: screenSize.width * 1,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: _createInformationCard(data))
      ],
    );
  }

  Widget _createInformationCard(Map data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Top breaking new',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: getColor('primary'),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          data['title'],
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 20),
        Text(data['description'], textAlign: TextAlign.justify),
        const SizedBox(height: 20),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: getColor('primary') 
            ),
            onPressed: () {
              urlLauncher.launchingUrl(data['url']);
            },
            child: const Text('Click for more'))
      ],
    );
  }

  Widget _createBreakingNews(BuildContext context){
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            'Breaking news',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: getColor('primary')
            ),
          ),
          const SizedBox(height: 40),
          StreamBuilder(
            stream: newsProvider.newsStreamController.stream,
            builder: (context, snapshot){
              if(snapshot.hasData){
                return BreakingNews(
                  news: snapshot.data!,
                  nextPage: newsProvider.getBreakingNews,
                );
              }
              else{
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
          )
        ],
      ),
    );
  }
}
