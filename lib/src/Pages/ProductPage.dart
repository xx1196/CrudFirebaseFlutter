import 'package:crudfirebaseflutter/src/Utils/Utils.dart' as utils;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final formKey = GlobalKey<FormState>();

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
            key: formKey,
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
      validator: (value) {
        if (value.length < 3) {
          return 'El nombre debe de tener mas de 3 carácteres';
        } else {
          return null;
        }
      },
    );

    return textFormField;
  }

  Widget _createPrice() {
    final textFormField = TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(labelText: 'Precio'),
      validator: (value) {
        return (utils.isNumeric(value)) ? null : 'Solo números por favor';
      },
    );

    return textFormField;
  }

  Widget _createRaisedButton() {
    final raisedButton = RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Colors.deepPurple,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      onPressed: _submit,
    );

    return raisedButton;
  }

  void _submit() {
    if (!formKey.currentState.validate()) return;
  }
}
