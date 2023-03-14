import 'package:flutter/material.dart';
import 'package:noticias/providers/news_provider.dart';
import 'package:noticias/widgets/politic_news.dart';

import '../util/color_util.dart';

class PoliticsPage extends StatelessWidget {
  const PoliticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    newsProvider.getPoliticNews();

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 30,),
            Text(
              'Politics',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: getColor('primary'),
              ),
            ),
            const SizedBox(height: 20,),
            _listOfPolitics()
          ],
        ),
      ),
    );

  }

  Widget _listOfPolitics(){
    return StreamBuilder(
      stream: newsProvider.politicsStreamController.stream,
      builder: (context, snapshot) {

        if(snapshot.hasData){
          return PoliticNews(
            politicNews: snapshot.data, 
            nextList: newsProvider.getPoliticNews
          );
        }
        else{
          return const CircularProgressIndicator();
        }
      }
    );
  }
}