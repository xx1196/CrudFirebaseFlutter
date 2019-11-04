import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Producto'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            child: Column(
              children: <Widget>[
              	_createName(),
	              _createPrice(),
	              _createRaisedButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _createName() {
    final textFormField = TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Producto'),
    );

    return textFormField;
  }

  Widget _createPrice() {
    final textFormField = TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(labelText: 'Precio'),
    );

    return textFormField;
  }
  
  Widget _createRaisedButton() {
    final raisedButton = RaisedButton.icon(
	    shape: RoundedRectangleBorder(
		    borderRadius: BorderRadius.circular(20.0)
	    ),
	    color: Colors.deepPurple,
	    textColor: Colors.white,
	    label: Text('Guardar'),
	    icon: Icon(Icons.save),
	    onPressed: (){},
    );

    return raisedButton;
  }
}
