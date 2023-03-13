import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

class NewsProvider {

  final StreamController newsStreamController = StreamController.broadcast();

  //URL
  String q = '';
  String from = '2023';
  String sortBy = 'popularity';
  String key = 'e999ca68b2ef4297901a3e5bc31e51c8';
  
  Future<List> getBreakingNews() async {
    try{
      q = 'Breaking News';
      String url = 'https://newsapi.org/v2/everything?q=$q&from=$from&sortBy=$sortBy&apiKey=$key';
      Response response = await get(Uri.parse(url));
      Map? mapResponse = json.decode(response.body);

      newsStreamController.add(mapResponse!['articles']); //Stream controller

      return mapResponse!['articles'];
    }catch(err){  
      print('ERROR: $err');
      return [];
    }
  }

}

final newsProvider = NewsProvider();