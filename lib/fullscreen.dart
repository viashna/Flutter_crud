import 'package:flutter/material.dart';

class FullScreenPage extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    
    return Container(
    width: 200.0,
    height: 200.0,
    color: Colors.white,
    alignment: Alignment.center,
    
     // where to position the child
    child: Container(
      width: 250.0,
      height: 250.0,
      color: Colors.teal[50],
      child: Center(
        
                child: Text(''),
              ),
    ),
    );
    
  }
}