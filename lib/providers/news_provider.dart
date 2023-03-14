import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

class NewsProvider {

  //Stream controllers
  final StreamController newsStreamController = StreamController.broadcast();
  final StreamController techStreamController = StreamController.broadcast();
  final StreamController politicsStreamController = StreamController.broadcast();

  //Arguments for the search function
  String arguments = '';
  set setArguments(String args) => arguments = args;
  get getArguments =>  arguments;

  //URL
  String q = '';
  String from = '2023';
  String sortBy = 'popularity';
  String key = 'e999ca68b2ef4297901a3e5bc31e51c8';
  
  Future<List> getBreakingNews() async {
    try{
      int day = int.parse(DateTime.now().toString().substring(8,10)) - 1;
      String fromDay = '2023-03-$day';
      q = 'Breaking News';
      String url = 'https://newsapi.org/v2/everything?q=$q&from=$fromDay&sortBy=$sortBy&apiKey=$key';
      Response response = await get(Uri.parse(url));
      Map? mapResponse = json.decode(response.body);

      newsStreamController.add(mapResponse!['articles']); //Stream controller

      return mapResponse['articles'];
    }catch(err){  
      print('ERROR: $err');
      return [];
    }
  }

  Future<List> getPoliticNews() async {
    try{
      int day = int.parse(DateTime.now().toString().substring(8,10)) - 1;
      String fromDay = '2023-03-$day';
      q = 'Politics';
      String url = 'https://newsapi.org/v2/everything?q=$q&from=$fromDay&sortBy=$sortBy&apiKey=$key';
      Response response = await get(Uri.parse(url));
      Map? mapResponse = json.decode(response.body);

      politicsStreamController.add(mapResponse!['articles']); //Stream controller

      return mapResponse['articles'];
    }catch(err){  
      print('ERROR: $err');
      return [];
    }
  }

  Future<List> getSearchNews(String typeOfNews) async {
    try{
      q = typeOfNews != '' ? typeOfNews : 'Tech';
      String url = 'https://newsapi.org/v2/everything?q=$q&from=$from&sortBy=$sortBy&apiKey=$key';
      Response response = await get(Uri.parse(url));
      Map? mapResponse = json.decode(response.body);

      techStreamController.add(mapResponse!['articles']); //Stream controller

      return mapResponse['articles'];
    }catch(err){  
      print('ERROR: $err');
      return [];
    }
  }

}

final newsProvider = NewsProvider();