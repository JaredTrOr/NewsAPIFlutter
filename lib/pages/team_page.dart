import 'package:flutter/material.dart';

import '../util/color_util.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  //const CardEquipo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: [
              const SizedBox(
                height: 30.0,
              ),
              Text(
                'Developer team',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: getColor('primary'),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              _CardAlan(),
              const SizedBox(
                height: 30.0,
              ),
              _CardLupe(),
              const SizedBox(
                height: 30.0,
              ),
              _CardPablo(),
              const SizedBox(
                height: 30.0,
              ),
              _CardAlexander(),
              const SizedBox(
                height: 30.0,
              ),
              _CardLuis(),
              const SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _CardAlan() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: const [
          ListTile(
            leading: Icon(
              Icons.account_circle,
            ),
            title: Text('Alan'),
          ),
          FadeInImage(
            placeholder: AssetImage('assets/images/camera_loading.png'),
            image: NetworkImage(
                'https://scontent.fqro1-1.fna.fbcdn.net/v/t39.30808-6/308837470_1709581562747949_1300483823944863263_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEf1ngyYqMzZRwiXwBsnioQsb-qmjPbisGxv6qaM9uKwUgXUBxfWji38_a1IsELbIapZ2TVUmgRvCsKnkwGhXaM&_nc_ohc=G4TYpAb-A58AX-zsrH8&_nc_ht=scontent.fqro1-1.fna&oh=00_AfDUSTAGIEVEL0-R0mk5UgexpMsf1pFRn8P1v4y6zb0ASw&oe=6414586E'),
            height: 200.0,
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _CardLupe() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: const [
          ListTile(
            leading: Icon(
              Icons.account_circle,
            ),
            title: Text('Maria Guadalupe'),
          ),
          FadeInImage(
            placeholder: AssetImage('assets/images/camera_loading.png'),
            image: NetworkImage(
                'https://scontent.fqro1-1.fna.fbcdn.net/v/t39.30808-6/318405896_576921837590836_7798390553428514957_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeGr27YRLNFSwwGmKE72S0wSUSu74AFgfFRRK7vgAWB8VBMNFTa6HjnI92l8E_gPpjQ6awfOoRPYEzQ_5pO1M7U8&_nc_ohc=fxu3qH0Nav0AX-SGAJr&_nc_ht=scontent.fqro1-1.fna&oh=00_AfDm6ACyeM_KJQKYCRMIgQ00bmN8GTCFD9XiniGlNAE7Og&oe=6415402E'),
            height: 200.0,
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _CardPablo() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: const [
          ListTile(
            leading: Icon(
              Icons.account_circle,
            ),
            title: Text('Juan Pablo'),
          ),
          FadeInImage(
            placeholder: AssetImage('assets/images/camera_loading.png'),
            image: NetworkImage(
                'https://scontent.fqro1-1.fna.fbcdn.net/v/t39.30808-6/335425884_781960416191763_7435077133673924244_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeES7HUH-ASf7Jkb44pTsfxexOWZG-THj3rE5Zkb5MePejdkOrlXIzkT4cIcRXhQBFqQjPa-FckYWQ2_E5m1yzRA&_nc_ohc=hLwtYR1xoTcAX8kqCGy&_nc_ht=scontent.fqro1-1.fna&oh=00_AfAZ7aPnMc_6QTo0nQ_NhOkRMX9IwfmMre_7f_QpImjjoQ&oe=64158E03'),
            height: 200.0,
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _CardAlexander() {
    return Card(
      
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: const [
          ListTile(
            leading: Icon(
              Icons.account_circle,
            ),
            title: Text('Jared Alexander '),
          ),
          FadeInImage(
            placeholder: AssetImage('assets/images/camera_loading.png'),
            image: NetworkImage(
                'https://pps.whatsapp.net/v/t61.24694-24/160817284_206045288566441_3828544719294026429_n.jpg?ccb=11-4&oh=01_AdSmXt2QZEP7V-NAmRlhOEF3oG5kqArHRNwLsBhOb4gEXA&oe=641D20B1'),
            height: 200.0,
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _CardLuis() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: const[
          ListTile(
            leading: Icon(
              Icons.account_circle,
            ),
            title: Text('Luis Manuel'),
          ),
          FadeInImage(
            placeholder: AssetImage('assets/images/camera_loading.png'),
            image: NetworkImage(
                'https://scontent.fqro1-1.fna.fbcdn.net/v/t39.30808-6/327051496_1696216067442063_8078370312544776529_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFJzxIy6HjoAze0sR_gMPXwOQ8SNK7FFVA5DxI0rsUVUHuYEyYIcOajeIrAb8f370F1ZpqlNRkH-ma6K7KOWpmr&_nc_ohc=pR-7zj92yO0AX-tRba-&_nc_ht=scontent.fqro1-1.fna&oh=00_AfAEYIrYNZOCyYTkkk86wOJAgICWMpRLxwg1uUu6EXgVJQ&oe=6414A740'),
            height: 200.0,
          )
        ],
      ),
    );
  }
}
