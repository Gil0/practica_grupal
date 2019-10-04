import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:practica_grupal/AuthService.dart';
import 'package:provider/provider.dart';
import 'package:practica_grupal/main.dart';
import 'package:practica_grupal/loginPage.dart';
class HomePage extends StatefulWidget {
  @override
  final DocumentSnapshot user;
  HomePage(
    this.user
  );
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  

  Widget build(BuildContext context) {
        
  

     return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true
      ),        
      body: Builder(
        builder: (context) => 
          ListView(
            children:[   
              Text('${widget.user["usuario"]}'),
              Text('${widget.user["matricula"]}'),
              Text('${widget.user["correo"]}'),
              Text('${widget.user["area"]}'),              
              Text('${widget.user["uid"]}'),
            ]                          
          )
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async{
            await Provider.of<AuthService>(context).salir();
            Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => LoginPage())); 
          },
          label: Text('Salir'),
          icon: Icon(Icons.exit_to_app),
          backgroundColor: Colors.pink,
        ),

     );
  }
}