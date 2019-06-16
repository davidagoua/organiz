import 'package:flutter/material.dart';
import 'package:organiz/ClientDetails.dart';
import 'models/User.dart';


class UserList extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _UserListState();
  }

}


class _UserListState extends State<UserList>{

  List userList = <User>[
    User.fill(nom: "Benoit Gourvier", pays: "Côte d'Ivoire", skills: "Graphiste | UI/UX Designer",
    status: "Participant", number: "+225 87654322"),
    User.fill(nom: "Koudou Gbatte", pays: "France", skills: "Architect Software",
    status: "Participant", number: "+33 34563456"),
    User.fill()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des Participants"),
      ),
      body: ListView.separated(
        itemCount: this.userList.length,
        itemBuilder: (BuildContext context, int index){
          var user = userList[index];
          return ListTile(
            title: Text(user.nom, style: TextStyle(fontSize: 20)),
            subtitle: Text(user.skills, style:TextStyle(color: Colors.grey[600], fontStyle: FontStyle.italic)),
            leading: user.image,
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ClientDetails.take(user)));
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider() ,
      ),
    );
  }

}