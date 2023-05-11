import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'  as http;

class MyHomePageLogin extends StatefulWidget {
  const MyHomePageLogin({Key? key, required String title}) : super(key: key);

  @override
  State<MyHomePageLogin> createState() => _MyHomePageLoginState();
}

class _MyHomePageLoginState extends State<MyHomePageLogin> {
  int a = 0;

  List<dynamic>? getData;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rest API Call $a"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        fetchUsers();
        decreament();
        },
      ),
      body: GestureDetector(
        child: Center(child: Text('increament')),
        onTap: (){
          text();
        },
      ),
    );
  }

  void fetchUsers() async{

    final response = await http.get(Uri.parse('https://randomuser.me/api/?results=10'));

    if(response.statusCode == 200 ){

    var jsonD =  jsonDecode(response.body);
    
    getData = jsonD['results'];

    }
    else{

      print('error');
    }
  }

  void text(){
    setState(() {
      a++;
    });
  }
  void decreament(){
    setState(() {
      a--;
    });
  }
}
