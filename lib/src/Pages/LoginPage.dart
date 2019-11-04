import 'package:crudfirebaseflutter/src/Blocs/Provider.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[_createBackGround(context), _loginForm(context)],
    ));
  }

  Widget _createBackGround(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final backGroundPurple = Container(
      height: size.height * .4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(63, 63, 156, 1.0),
        Color.fromRGBO(90, 70, 178, 1.0),
      ])),
    );

    final circle = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );

    final personalInfo = Container(
      padding: EdgeInsets.only(top: 80.0),
      child: Column(
        children: <Widget>[
          Icon(
            Icons.person_pin,
            color: Colors.white,
            size: 100.0,
          ),
          SizedBox(height: 10.0, width: double.infinity),
          Text(
            'Andrés Felipe Cardozo Cañas',
            style: TextStyle(color: Colors.white, fontSize: 25.0),
          )
        ],
      ),
    );

    return Stack(
      children: <Widget>[
        backGroundPurple,
        Positioned(
          top: 90.0,
          left: 30.0,
          child: circle,
        ),
        Positioned(
          top: -40.0,
          right: -30.0,
          child: circle,
        ),
        Positioned(
          bottom: -50.0,
          right: -10.0,
          child: circle,
        ),
        Positioned(
          bottom: 120.0,
          right: 20.0,
          child: circle,
        ),
        Positioned(
          bottom: -50.0,
          left: -20.0,
          child: circle,
        ),
        personalInfo
      ],
    );
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);

    final size = MediaQuery.of(context).size;

    final safeArea = SafeArea(
      child: Container(
        height: 180.0,
      ),
    );

    final formContainer = Container(
      width: size.width * 0.85,
      margin: EdgeInsets.symmetric(vertical: 30.0),
      padding: EdgeInsets.symmetric(vertical: 50.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black45,
                blurRadius: 3.0,
                offset: Offset(0.0, 5.0),
                spreadRadius: 4.0)
          ]),
      child: Column(
        children: <Widget>[
          Text('Ingreso', style: TextStyle(fontSize: 20.0)),
          SizedBox(height: 30.0),
          _createEmailInput(bloc),
          SizedBox(height: 30.0),
          _createPasswordInput(bloc),
          SizedBox(height: 30.0),
          _createButton(bloc),
        ],
      ),
    );

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          safeArea,
          formContainer,
          Text('Olvidó su contraseña?'),
          SizedBox(height: 100.0)
        ],
      ),
    );
  }

  Widget _createEmailInput(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.alternate_email,
                  color: Colors.deepPurple,
                ),
                hintText: 'ejemplo@correo.com',
                labelText: 'Email',
                counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _createPasswordInput(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.lock_outline,
                  color: Colors.deepPurple,
                ),
                labelText: 'Contraseña',
                counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _createButton(LoginBloc bloc) {
    final raisedButton = RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
        child: Text('Ingresar'),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 0.5,
      color: Colors.deepPurple,
      textColor: Colors.white,
      onPressed: () {
        print('CLick in button');
      },
    );
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Ingresar'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          elevation: 0.5,
          color: Colors.deepPurple,
          textColor: Colors.white,
          onPressed: snapshot.hasData ? () {} : null,
        );
      },
    );
  }
}
