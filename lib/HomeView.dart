import 'package:flutter/material.dart';
import 'package:organiz/models/User.dart';
import 'package:organiz/models/VerifScan.dart';
import 'ClientDetails.dart';
import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';



void startProgressBar(BuildContext context, var message){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(message),
          content: CircularProgressIndicator(),
        );
      }
  );
}

void toaster(BuildContext context, var message){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("QR code scanner"),
          content: Text(message)
        );
      }
  );
}

class HomeView extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Container(
          height: 380,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  child: Text("Les participants"),
                  color: Colors.lightBlue,
                  textColor: Colors.white,
                  onPressed: (){
                    Navigator.pushNamed(context, '/list');
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  child: Text("Scan à l'entrée"),
                  color: Colors.lightBlue,
                  textColor: Colors.white,
                  onPressed: (){scan(context, false);},
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  child: Text("Scan à la sortie"),
                  color: Colors.lightBlue,
                  textColor: Colors.white,
                  onPressed: (){ scan(context, true);},
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 60,),
              RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Colors.lightBlue,
                textColor: Colors.white,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.info_outline, size: 15.0,),
                    Text("  "),
                    Text("Quitter")
                  ],
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        )
      ),
    );
  }

  Future scan(context, bool entree) async{

    try{
      //String barcode_text = await BarcodeScanner.scan();
      int barcode_int = 95;
      var resultat = await VerifEngine.sendQrNum(context, barcode_int);
      //toaster(context, "Message: $barcode_text");
    }on PlatformException catch(e){

      if(e.code == BarcodeScanner.CameraAccessDenied){
        toaster(context, "CameraAccessDenied");
      }else{
        toaster(context, "Erreur inconnu: $e");
      }

    }on FormatException catch(e){
      toaster(context, "Aucun code scanner !");
    } on Exception catch(e){
      toaster(context, "Erreur: $e");
    }

  }
}