import 'package:flutter/material.dart';

import 'HomeView.dart';



class LoginView extends StatelessWidget{

  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var textStyle = TextStyle(fontSize: 17, color: Colors.grey[700]);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 35, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(height: 20,),
            Text(
              "Authentification",
              style: TextStyle(fontSize: 29, color: Colors.blue, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            TextFormField(
              controller: usernameController,
              style: textStyle,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.verified_user),
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                fillColor: Colors.white,
                filled: true,
                hintText: "Nom d'utilisateur",
                contentPadding: EdgeInsets.all(3.0),
              ),
            ),
            TextFormField(
              controller: passwordController,
              style: textStyle,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(3.0),
                hintText: "Mot de passe",
                prefixIcon: Icon(Icons.lock),
                prefixStyle: TextStyle(color: Colors.purple),
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                fillColor: Colors.white,
                filled: true,
              ),
              obscureText: true,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              child: Icon(Icons.send),
              color: Colors.lightBlue,
              textColor: Colors.white,
              splashColor: Colors.lightBlue,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return HomeView();
                }));
              },
              padding: EdgeInsets.all(10.0),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Se connecter avec", style: TextStyle(fontSize: 15, color: Colors.grey[600]),),
                Icon(Icons.face, size: 15, color: Colors.grey,),
                Icon(Icons.flag, size: 15, color: Colors.grey),
              ],
            ),
            SizedBox(height: 20,),
          ],
        ),
      )
    );
  }
}