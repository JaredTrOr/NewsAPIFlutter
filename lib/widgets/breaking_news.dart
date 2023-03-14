import 'package:flutter/material.dart';
import 'package:noticias/util/url_launcher.dart';

class BreakingNews extends StatelessWidget {

  final List news;
  final Function nextPage;

  BreakingNews({super.key, required this.news, required this.nextPage});
  
  final _pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.80
  );

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    _pageController.addListener(() {
      if(_pageController.position.pixels >= 
      _pageController.position.maxScrollExtent - 200){
        nextPage();
      }
    });


    // ignore: sized_box_for_whitespace
    return Container(
      height: screenSize.height * 0.6,
      width: screenSize.width * 1,
      child: PageView.builder(
        controller: _pageController,
        pageSnapping: false,
        itemCount: news.length,
        itemBuilder: (context, index) {
          return _createNewsCard(context, news[index]);
        }
      ),
    );
  }

  Widget _createNewsCard(BuildContext context, Map data){
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => urlLauncher.launchingUrl(data['url']),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: FadeInImage(
                placeholder: const AssetImage('assets/images/camera_loading.png'),
                image: NetworkImage(data['urlToImage']),
                width: screenSize.width * 1,
                height: screenSize.height * 0.2,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              data['title'],
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20
              ),
            )
          ],
        ),
      ),
    );

  }
}