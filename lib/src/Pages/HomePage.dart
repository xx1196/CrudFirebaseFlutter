import 'package:crudfirebaseflutter/src/Blocs/Provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(),
      floatingActionButton: _makeButton(context),
    );
  }

  Widget _makeButton(BuildContext context) {
    final floatingActionButton = FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: () => Navigator.pushNamed(context, 'product')
    );

    return floatingActionButton;
  }
}
