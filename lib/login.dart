

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task/fullscreen.dart';
import 'package:task/homepage.dart';



class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => new _LoginPageState();

}

class _LoginPageState extends State<LoginPage>{
  String _email, _password;
  final GlobalKey<FormState> _formkey =GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     drawer: new Drawer(
        child: Column(
          children: <Widget>[
            Container(
            child: new Image.asset('assets/bookstore.jpg'),
           
           
            ),
            SizedBox(height: 22.0,),
            Container(
              padding: EdgeInsets.all(50.0),
              child: Center(
                child: Text('Manage your bookstore in your warehouse with our app!!!!!'),
              ),
              
            ),
            
            /*new ListTile(
title: new Text("About us"),
trailing: new Icon(Icons.supervisor_account),
onTap: () {FullScreenPage();}

),
new ListTile(
title: new Text("Share"),
trailing: new Icon(Icons.share),

),
new ListTile(
title: new Text("Review"),
trailing: new Icon(Icons.rate_review),
),
       */  
      
      FloatingActionButton(onPressed: () { Navigator.push(context,
        MaterialPageRoute(builder: (context) => FullScreenPage()));},
       child: Icon(Icons.album),
       ) ],
          
        ),
        
      ),

      appBar: AppBar(centerTitle: true,
        title: Text('Login page'),
      ),

      body: 
           
            
       
  
      Form(
        
        key: _formkey,
        child: Column(
          children: <Widget>[
TextFormField(
  validator: (input){
    if(input.isEmpty){
return "Type user name";
    }
  },
  onSaved: (input) => _email =input,
  decoration: InputDecoration(
    labelText: 'UserName'
  ),
),



TextFormField(
  validator: (input){
    if(input.length < 4){
return "Type password";
    }
  },

  onSaved: (input) => _password =input,
  decoration: InputDecoration(
    labelText: 'Password'
  ),
  obscureText: true,
),
RaisedButton(
  onPressed: signIn ,
  child: Text('Login'),
  color: Colors.brown[100],
)
 ], ),),

);}

  Future<void> signIn() async {
    
    final formState =_formkey.currentState;
    if(formState.validate()){
      formState.save();
      
      
      if(_email == "vaisu" && _password == "exam"){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      }else{
        Fluttertoast.showToast(
        msg: "Your user name or password incorrect check it",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER
        );
      }
      } }
}