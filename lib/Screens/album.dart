import 'package:flutter/material.dart';


class AlbumScreen extends StatefulWidget {
  static const routeName = '/album-screen';
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {

  @override
  Widget build(BuildContext context) {
    final routeData = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final list = routeData['list'];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: ListView(
            children: [
              _logout(context),
              _images(context, list),
            ],
          ),
      ),
    );
  }

  _images(context, var jsonList) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (BuildContext bcontext, int index){
        return Card(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/image-screen',
                  arguments: {'src':jsonList[index]['url']}
                );
              },
              child: ListTile(
                leading: ClipRect(
                  child: Image.network(jsonList[index]['thumbnailUrl']),
                ),
                title: Text(jsonList[index]['title']),
              ),
            )
          );
      },
      itemCount: jsonList.length,
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
              "Go Back?",
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
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.white,
              ),
              child: const Text(
                "BACK",
                style: TextStyle(fontSize: 15, color: Colors.black)),
              ),
            ),
            const SizedBox(height: 50,),
          ],
        ),
    );
    
  }
}