import 'package:flutter/material.dart';
import 'package:noticias/util/url_launcher.dart';

class PoliticNews extends StatelessWidget {

  final List politicNews;
  final Function nextList;

  PoliticNews({super.key, required this.politicNews, required this.nextList});

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;
    _controller.addListener(() {
      if(_controller.position.pixels == _controller.position.maxScrollExtent){
        nextList();
      }
    });

    return SizedBox(
      height: screenSize.height * 0.8,
      width: screenSize.width * 1,
      child: ListView.builder(
        controller: _controller,
        itemCount: politicNews.length,
        itemBuilder: (context, index){
          return _createImageList(context, politicNews[index]);
        }
      ),
    );
  }

  Widget _createImageList(BuildContext context, Map data){

    final screenSize = MediaQuery.of(context).size;

    String noImageUrl = 'https://i.pinimg.com/originals/61/54/18/61541805b3069740ecd60d483741e5bb.jpg';

    return Container(
      padding: const EdgeInsets.only(bottom: 40),
      child: GestureDetector(
        onTap: () => urlLauncher.launchingUrl(data['url']),
        child: Column( 
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/images/camera_loading.png'),
                image: NetworkImage(data['urlToImage'] ?? noImageUrl), 
                width: screenSize.width * 1
              ),
            ),
            const SizedBox(height: 10),
            Text(data['title'], style: const TextStyle(fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}