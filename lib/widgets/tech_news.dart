// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:noticias/providers/news_provider.dart';
import 'package:noticias/util/url_launcher.dart';

class TechNews extends StatelessWidget {

  final List techNews;
  final Function nextList;

  TechNews({super.key, required this.techNews, required this.nextList});

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    _controller.addListener(() {
        if(_controller.position.pixels == _controller.position.maxScrollExtent){
        nextList(newsProvider.arguments);
      }
    });

    if(techNews.isEmpty){
      return Column(
        children: const [
          SizedBox(height: 80,),
          Image(
            width: 200,
            image: AssetImage('assets/images/empty_search.png')
          ),
          SizedBox(height: 10,),
          Text(
            'No information of that topic :/',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20
            ),
          ),
        ],
      );
    }
    else{
      return SizedBox(
        height: screenSize.height * 0.7,
        width: screenSize.width * 1,
        child: ListView.builder(
          controller: _controller,
          itemCount: techNews.length,
          itemBuilder: (context, index){
            return _createListTile(context, techNews[index]); 
          }
        )
      );
    }
  }

  Widget _createListTile(BuildContext context, Map data){

    String author = '';
    String noImageUrl = 'https://i.pinimg.com/originals/61/54/18/61541805b3069740ecd60d483741e5bb.jpg';

    if(data['author'] != null){
      author = data['author'];
    }

    return 
    GestureDetector(
      onTap: () => urlLauncher.launchingUrl(data['url']),
      child: Container(
        padding: const EdgeInsets.only(top: 40),
        child: ListTile(
          leading: FadeInImage(
            placeholder: const AssetImage('assets/images/camera_loading.png'),
            image: NetworkImage(data['urlToImage'] ?? noImageUrl)),
          title: Text(data['title']),
          subtitle: Text('Author: '+author),
        ),
      ),
    );
  }
}