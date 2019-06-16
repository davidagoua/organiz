import 'package:flutter/material.dart';


class User {

  Image image;
  String nom;
  String pays;
  String skills;
  String status;
  String number;

  User();

  User.fromJson(String json);

  User.fill({image: null, nom: "John Doe", pays: "Côte d'Ivoire", skills:"Developper",
      status:"Participant",
      number:"+225 00 00 00 00"}){
    this.nom = nom;
    this.number = number;
    this.pays = pays;
    this.skills = skills;
    this.status = status;
    this.image = Image.asset("assets/images/user.png");
  }

  User.defaultImage(this.nom, this.pays, this.skills, this.status, this.number){
    this.image = Image.asset("assets/images/user.png");
  }


}