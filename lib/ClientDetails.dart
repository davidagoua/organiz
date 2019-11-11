import 'package:flutter/material.dart';
import 'package:organiz/models/User.dart';



class ClientDetails extends StatefulWidget{

  User _user;


  User get user => _user;

  set user(User value) {
    this._user = value;
  }

  ClientDetails():super(){
    this._user = User()
      ..pays = "Gabon"
      ..skills = "Developper web | mobile"
      ..nom = "John Doe"
      ..status = "Participant"
      ..number = "+225 00 09 08 07";
  }

  ClientDetails.take(user):super(){
    this.user = user?? User.fill() ;
  }

  @override
  State createState() {
    return _ClientDetailsState(this.user);
  }

}


class _ClientDetailsState extends State<ClientDetails>{

  User user;

  _ClientDetailsState(this.user):super();


  @override
  Widget build(BuildContext context) {

    try{
      user.image = Image.network("https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png", fit: BoxFit.fill,);
    }catch(e){
     user.image = Image.asset("assets/images/user.png");
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.lightBlue,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            height: 220,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                    child: this.user.image,
                    height: 120,
                    width: 90,
                  ),
                  Text(
                    this.user.nom,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  Text(this.user.skills, style: TextStyle(color: Colors.white)),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.location_on, size: 15.0, color: Colors.white,),
                      Text("  "),
                      Text(this.user.pays, style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
            ),
            child: Center(
              heightFactor: 1.9,
              widthFactor: 2.1,
              child: Text(this.user.status, style: TextStyle(color: Colors.lightBlue, fontSize: 23)),
            ),
          ),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
            ),
            child: Center(
              heightFactor: 2.1,
              widthFactor: 1.4,
              child: Text(this.user.number?? "Numero", style: TextStyle(color: Colors.lightBlue, fontSize: 18)),
            ),
          ),
          SizedBox(height: 40,),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.grey[300],
            elevation: 4,
            child: Container(
              height: 150,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Column(
                children: <Widget>[
                  Text("Veuillez vérifier les \n informations", style:TextStyle(color: Colors.grey[600], fontSize: 16), textAlign: TextAlign.center,),
                  Text("&", style: TextStyle(fontSize: 26, color: Colors.grey[600],)),
                  RaisedButton(
                    onPressed: ()=> Navigator.pop(context),
                    child: Text("Confirmer"),
                    color: Colors.lightBlue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  )
                ],
              )
            ),
          )
        ],
      )
    );
  }

}
