import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      home: const HomePage(),
    )
);
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
    State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //late promises that the variable will be stored later
  late final TextEditingController _email;
  late final TextEditingController _password;

  //Constructor
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
  }

  //Destructor
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('User Registeration'),),
      body: Column(
        children:[
          TextField(controller: _email,
                    decoration: const InputDecoration(
                      hintText: "Enter your email here"),
                      ),
          TextField(controller: _password,
                    decoration: const InputDecoration(
                      hintText: "Enter your password here"),
                    ),
          TextButton(
            onPressed:() async {
              final email = _email.text;
              final password = _password.text;
              final userCredential = 
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: email,
                  password: password
                );
              print(userCredential);
            }, 
            child: const Text('Register'),)
        ]
      )
    );
  }
}



