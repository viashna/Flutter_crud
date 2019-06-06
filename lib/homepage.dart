import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


  

class Home extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Home> {

  String textCode, textName,textDescription,textquantity;
  double textunitprice;

  getCode(code) {
    textCode = code;
    print(textCode);
  }
  getName(name) {
    textName = name;
    print(textName);
  }
  getDescription(description) {
    textDescription = description;
    print(textDescription);
  }

  getUnitPrice(price){
  textunitprice=double.parse(price);
  print(textunitprice);
  }
  getQuantity(quality){
   textquantity=quality;
   print(textquantity);
  }


  createData(){
    DocumentReference dRef = Firestore.instance.collection("Shopping").document(textName);
    Map<String, dynamic> gericht = {
      "Code": textCode,
      "Name": textName,
      "Description": textDescription,
      "UnitPrice":textunitprice,
      "AvailableQuality":textquantity,
    };
    dRef.setData(gericht).whenComplete(() {
      print("$textName gespeichert");
    });
  }

  updateData(){
    DocumentReference dRef = Firestore.instance.collection("Shopping").document(textName);
    Map<String, dynamic> gericht = {
    "Code": textCode,
    "Name": textName,
    "Description": textDescription,
    "UnitPrice": textunitprice,
    "AvailableQuality": textquantity
    };
    dRef.setData(gericht).whenComplete(() {
      print("$textName gespeichert");
    });
  }

  
  deleteData(){
    DocumentReference dRef = Firestore.instance.collection("Shopping").document(textName);
    dRef.delete().whenComplete(() {
      print("$textName gelöscht");
    });
  }
  
  void readGericht(code, name, description,unitprice, availablequality) {
    showDialog(context: context,
    child: AlertDialog(
      title: Text("$code: $textCode"),
      content: SingleChildScrollView(
       child: ListBody(
         children: <Widget>[
           Divider(),
           Text(name),
         ],
       ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Ok"),
          onPressed: (){
            Navigator.of(context).pop();
          },
        )
      ],
    )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inventory App"),
        //leading: Icon(Icons.home),
      ),
      body: 
      
      Padding(
          padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: "Inventory Code"
              ),
              onChanged: (String code) {
                getCode(code);
              },
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Name"
              ),
              onChanged: (String name) {
                getName(name);
              },
            ),
            TextField(
              //keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Description"
              ),
              onChanged: (String description) {
                getDescription(description);
              },
            ),

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "UnitPrice"
              ),
              onChanged: (String price) {
                getUnitPrice(price);
              },
            ),

            TextField(
              //keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Available Quality"
              ),
              onChanged: (String quality) {
                getQuantity(quality);
              },
            ),



            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: RaisedButton(
                      color: Colors.brown[50],
                      child: Text("Create"),
                      onPressed: (){
                        createData();
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: RaisedButton(
                      color: Colors.brown[100],
                      child: Text("Update"),
                      onPressed: (){
                        updateData();
                      },
                    ),
                  ),
                  
                  
                  Padding(
                    padding: EdgeInsets.only(right: 0.0),
                    child: RaisedButton(
                      color: Colors.brown[200],
                      child: Text("Delete"),
                      onPressed: (){
                        deleteData();
                      },
                    ),
                  ),
                ],
              ),
            ),Row(
              textDirection: TextDirection.ltr,
              children: <Widget>[
                Expanded(
                  child: Text("Code"),
                ),
                Expanded(
                  child: Text("Name"),
                ),

                Expanded(
                  child: Text("Description"),
                ),

                Expanded(
                  child: Text("UnitPrice"),
                ),

                Expanded(
                  child: Text("AvailableQuality"),
                ),
              ],
            ),
          StreamBuilder(
            stream: Firestore.instance.collection("Shopping").snapshots(),
            builder: (context, snapshot){
              if (snapshot.hasData){
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  padding: EdgeInsets.only(top: 10.0),
                  itemBuilder: (context, index){
                    DocumentSnapshot ds = snapshot.data.documents[index];
                    return Column(
                      children: <Widget>[
                        Row(
                          textDirection: TextDirection.ltr,
                          children: <Widget>[
                            Expanded(child: Text(ds["Code"])),
                            Expanded(child: Text(ds["Name"])),
                            //Expanded(child: Text(ds["Preis"].toString())),
                            Expanded(child: Text(ds["Description"])),
                            //Expanded(child: Text(ds["UnitPrice"])),

                            Expanded(child: Text(ds["UnitPrice"].toString())),
                            Expanded(child: Text(ds["AvailableQuality"].toString())),
                           
                          ],
                        )
                      ],
                    );
                  },
                );
              } else {
                return Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
          ],
        ),
      ),
    
    );
  }
}








/*
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

8void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.lightBlue[800],
      accentColor: Colors.cyan[600],
    ),
    home: MyApp(),
  )
);

class Home extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Home> {

  String textName, textBeschreibung;
  double textPreis;

  getNameData(name) {
    textName = name;
    print(textName);
  }
  getBeschreibungData(beschreibung) {
    textBeschreibung = beschreibung;
    print(textBeschreibung);
  }
  getPreisData(preis) {
    textPreis = double.parse(preis);
    print(textPreis);
  }

  createData(){
    DocumentReference dRef = Firestore.instance.collection("Gerichte").document(textName);
    Map<String, dynamic> gericht = {
      "Name": textName,
      "Beschreibung": textBeschreibung,
      "Preis": textPreis
    };
    dRef.setData(gericht).whenComplete(() {
      print("$textName gespeichert");
    });
  }

  updateData(){
    DocumentReference dRef = Firestore.instance.collection("Gerichte").document(textName);
    Map<String, dynamic> gericht = {
      "Name": textName,
      "Beschreibung": textBeschreibung,
      "Preis": textPreis
    };
    dRef.setData(gericht).whenComplete(() {
      print("$textName gespeichert");
    });
  }

  readData(){

    DocumentReference dRef = Firestore.instance.collection("Gerichte").document(textName);
    dRef.get().then((datasnapshot) {
      print(datasnapshot.data["Name"]);
      print(datasnapshot.data["Beschreibung"]);
      print(datasnapshot.data["Preis"]);

      readGericht(datasnapshot.data["Name"], datasnapshot.data["Beschreibung"], datasnapshot.data["Preis"]);
    });


  }

  deleteData(){
    DocumentReference dRef = Firestore.instance.collection("Gerichte").document(textName);
    dRef.delete().whenComplete(() {
      print("$textName gelöscht");
    });
  }
  
  void readGericht(name, beschreibung, preis) {
    showDialog(context: context,
    child: AlertDialog(
      title: Text("$name: $preis"),
      content: SingleChildScrollView(
       child: ListBody(
         children: <Widget>[
           Divider(),
           Text(beschreibung),
         ],
       ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Ok"),
          onPressed: (){
            Navigator.of(context).pop();
          },
        )
      ],
    ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase CRUD"),
      ),
      body: Padding(
          padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: "Name"
              ),
              onChanged: (String name) {
                getNameData(name);
              },
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Beschreibung"
              ),
              onChanged: (String beschreibung) {
                getBeschreibungData(beschreibung);
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Preis"
              ),
              onChanged: (String preis) {
                getPreisData(preis);
              },
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: RaisedButton(
                      color: Colors.green,
                      child: Text("Create"),
                      onPressed: (){
                        createData();
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: RaisedButton(
                      color: Colors.orange,
                      child: Text("Update"),
                      onPressed: (){
                        updateData();
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: RaisedButton(
                      child: Text("Read"),
                      onPressed: (){
                        readData();
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 0.0),
                    child: RaisedButton(
                      color: Colors.red,
                      child: Text("Delete"),
                      onPressed: (){
                        deleteData();
                      },
                    ),
                  ),
                ],
              ),
            ),Row(
              textDirection: TextDirection.ltr,
              children: <Widget>[
                Expanded(
                  child: Text("Name"),
                ),
                Expanded(
                  child: Text("Beschreibung"),
                ),
                Expanded(
                  child: Text("Preis"),
                ),
              ],
            ),
          StreamBuilder(
            stream: Firestore.instance.collection("Gerichte").snapshots(),
            builder: (context, snapshot){
              if (snapshot.hasData){
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  padding: EdgeInsets.only(top: 10.0),
                  itemBuilder: (context, index){
                    DocumentSnapshot ds = snapshot.data.documents[index];
                    return Column(
                      children: <Widget>[
                        Row(
                          textDirection: TextDirection.ltr,
                          children: <Widget>[
                            Expanded(child: Text(ds["Name"])),
                            Expanded(child: Text(ds["Beschreibung"])),
                            Expanded(child: Text(ds["Preis"].toString())),
                          ],
                        )
                      ],
                    );
                  },
                );
              } else {
                return Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
          ],
        ),
      ),
    );
  }
}

*/