import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup-screen';
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isChecked = false;
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
              _signin(context),
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
            ],
          ),
      ),
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

  _header(context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Create Free Account",
          style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.black,),
          textAlign: TextAlign.center,
        ),
        Text(
          "Sign up using social networks",
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
                hintText: "Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none
                ),
                fillColor: const Color.fromARGB(255, 240,	244,	243),
                filled: true,
              ),
          ),
        ),
        
        const SizedBox(height: 20),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child:
            TextField(
            decoration: InputDecoration(
                hintText: "Surname",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none
                ),
                fillColor: const Color.fromARGB(255, 240,	244,	243),
                filled: true,
              ),
          ),
        ),
        
        const SizedBox(height: 20),

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
              ),
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
                ),
          ),
        ),
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(value: isChecked, onChanged: (bool? value){
              setState(() {
                isChecked = value!;
              });
            }),
            RichText(
              text: const TextSpan(
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(text: 'I have read the '),
                  TextSpan(text: 'Terms & Conditions', style:  TextStyle(color: Color.fromARGB(255, 58, 177,	155))),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20,),
        SizedBox(width: 275, 
          child: 
            ElevatedButton(
            onPressed: () {
            },
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: const Color.fromARGB(255, 58, 177,	155),
            ),
            child: const Text(
              "SIGN UP",
              style: TextStyle(fontSize: 15, color: Colors.white)),
            ),
          )
      ],
    );
  }

  _signin(context) {
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
              "One of Us?",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
            ),

            const SizedBox(height: 10,),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 75),
              child:
                const Text(
                "If you already have an account, just sign in. We've missed you!",
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
                "SIGN IN",
                style: TextStyle(fontSize: 15, color: Colors.black)),
              ),
            ),
            const SizedBox(height: 50,),
          ],
        ),
    );
    
  }
}