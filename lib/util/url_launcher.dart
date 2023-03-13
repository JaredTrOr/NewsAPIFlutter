import 'package:url_launcher/url_launcher.dart';

class UrlLauncher{

  //Empty constructor
  UrlLauncher();

  Future<void> launchingUrl(String userUrl) async {

    final Uri url = Uri.parse(userUrl);

    try{
      await launchUrl(url);
    }catch(err){
      throw Exception('Cannot open $url');
    }
  }
}

final urlLauncher = UrlLauncher();
