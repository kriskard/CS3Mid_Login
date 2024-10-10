import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var jsonList;
  
  void getData(int? album) async{
    try {
      var response = await Dio().get('https://jsonplaceholder.typicode.com/photos', queryParameters: {'albumId' : album});
      if (response.statusCode == 200) {
        jsonList = response.data as List;
        Navigator.pushNamed(context, '/album-screen',
          arguments: {'list':jsonList}
        );
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: ListView(
            children: [
              _logout(context),
              _albums(context),
            ],
          ),
      ),
    );
  }

 _albums(context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (BuildContext bcontext, int index){
        return Card(
            child: InkWell(
              onTap: () {getData((index+1));},
              child: ListTile(
                title: Text('Album ${index+1}'),
                subtitle: Text('Description for Album ${index+1}'),
              ),
            )
          );
      },
      itemCount: 100,
    );
  }

  _logo(context) {
    return Row(
      children: [
        Transform.scale(
          scale: 0.95,
          child: 
          Image.asset('assets/white_logo.png'),
        ),
      ],
    );
  }

  _logout(context) {
    return Container( 
      width: double.infinity,
      decoration: const BoxDecoration( 
        gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 59,164,178),
                Color.fromARGB(255, 6, 236, 152),
              ],
        ),
      ),
      child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: _logo(context),
            ),
            
            const SizedBox(height: 50,),

            const Text(
              "Log Out?",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
            ),

            const SizedBox(height: 10,),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 75),
              child:
                const Text(
                "I don't have time to make something fancy so I just copy-pasted the signup",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),

            const SizedBox(height: 35,),

            SizedBox(width: 275, 
            child: 
              ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login-screen');
              },
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.white,
              ),
              child: const Text(
                "LOG OUT",
                style: TextStyle(fontSize: 15, color: Colors.black)),
              ),
            ),
            const SizedBox(height: 50,),
          ],
        ),
    );
    
  }
}