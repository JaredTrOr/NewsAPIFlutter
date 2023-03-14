import 'package:flutter/material.dart';
import 'package:noticias/providers/news_provider.dart';
import 'package:noticias/widgets/tech_news.dart';

import '../util/color_util.dart';
import '../widgets/input_search.dart';

class TechPage extends StatefulWidget {
  const TechPage({super.key});

  @override
  State<TechPage> createState() => _TechPageState();
}

class _TechPageState extends State<TechPage> {
  TextEditingController searchController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;
    newsProvider.getSearchNews('');

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Text(
                'Discover',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: getColor('primary'),
                ),
              ),
              const SizedBox(height: 20),
              InputSearch(
                inputController: searchController,
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: screenSize.width * 0.8,
                child: ElevatedButton(
                  onPressed: _search, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: getColor('primary'),
                  ),
                  child: const Text('Search'),
                ),
              ),
              const SizedBox(height: 10),
              _createTechNewsList() //List view
            ],
          ),
        ),
      ),
    );
  }

  Widget _createTechNewsList(){
    // ignore: sized_box_for_whitespace
    return StreamBuilder(
      stream: newsProvider.techStreamController.stream,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          //Create validation if it doesn't have data
          print('Luisma data');
          print(snapshot.data);
          return TechNews(
            techNews: snapshot.data, 
            nextList: newsProvider.getSearchNews
          );
        }
        else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }

   void _search() async {
    if(formKey.currentState!.validate()) {
      print('validaated');
      newsProvider.getSearchNews(searchController.text.toString());
      newsProvider.setArguments = searchController.text.toString();
    }
   }
}