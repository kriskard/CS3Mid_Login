import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login-screen';
  const LoginScreen({super.key});

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
              _logo(context),
              Container(
                margin: const EdgeInsets.all(20),
                child:
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _header(context),
                    const SizedBox(height: 10,),
                    _acctbuttons(context),
                    const SizedBox(height: 20,),
                    _inputField(context),
                    const SizedBox(height: 50,),
                  ],
                )
              ),
              _signup(context),
            ],
          ),
      ),
    );
  }

  _logo(context) {
    return Row(
      children: [
        Transform.scale(
          scale: 0.65,
          child: 
          Image.asset('assets/diprella_logo.png'),
        ),
      ],
    );
  }

  _header(context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Login to Your Account",
          style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.black,),
          textAlign: TextAlign.center,
        ),
        Text(
          "Login using social networks",
          style: TextStyle(fontSize: 20, color: Colors.black,),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

   _acctbuttons(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
            Image.asset('assets/facebook.png'),
            const SizedBox(width: 15,),
            Image.asset('assets/google.png'),
            const SizedBox(width: 15,),
            Image.asset('assets/linkedin.png'),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          child : const Center(child: Text("OR"),),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child:
            TextField(
            decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none
                ),
                fillColor: const Color.fromARGB(255, 240,	244,	243),
                filled: true,
                prefixIcon: const Icon(Icons.mail_outline)),
          ),
        ),
        
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child:
            TextField(
            decoration: InputDecoration(
                hintText: "Password",
                
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none
                ),
                fillColor: const Color.fromARGB(255, 240,	244,	243),
                filled: true,
                prefixIcon: const Icon(Icons.lock)),
          ),
        ),
        const SizedBox(height: 20,),
        SizedBox(width: 275, 
          child: 
            ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home-screen');
            },
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: const Color.fromARGB(255, 58, 177,	155),
            ),
            child: const Text(
              "SIGN IN",
              style: TextStyle(fontSize: 15, color: Colors.white)),
            ),
          )
      ],
    );
  }

  _signup(context) {
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
            const SizedBox(height: 50,),

            const Text(
              "New Here?",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
            ),

            const SizedBox(height: 10,),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 75),
              child:
                const Text(
                "Sign up and discover a great amount of new opporunities!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),

            const SizedBox(height: 35,),

            SizedBox(width: 275, 
            child: 
              ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup-screen');
              },
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.white,
              ),
              child: const Text(
                "SIGN UP",
                style: TextStyle(fontSize: 15, color: Colors.black)),
              ),
            ),
            const SizedBox(height: 50,),
          ],
        ),
    );
    
  }

}