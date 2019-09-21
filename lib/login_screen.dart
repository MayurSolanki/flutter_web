
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:html' as html;
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}



class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String localStorage="";
  String sessionStorage="";
  String cookies="";



  @override
  Widget build(BuildContext context) {


    Widget enterLocalStorageValue() {
      return Container(
        width: 400.0,
        child: TextField(

          decoration:  InputDecoration(
              labelText: "Enter local storage value",
              labelStyle: TextStyle(color: Colors.green),
              hintText: "Enter local storage value",
              alignLabelWithHint: true,
              prefixIcon: new Icon(Icons.text_fields)
          ),
            obscureText: false,
            onChanged: (value) {
              localStorage = value.trim();
          },
        ),
      );
    }

    Widget enterSessionStorageValue() {
      return Container(
        width: 400.0,
        child: TextField(
          decoration:  InputDecoration(
              labelText: "Enter session storage value",
              labelStyle: TextStyle(color: Colors.green),
              hintText: "Enter session storage value",
              alignLabelWithHint: true,
              prefixIcon: new Icon(Icons.text_fields)
          ),
          obscureText: false,
          onChanged: (value) {
            sessionStorage = value.trim();
          },
        ),
      );
    }


    Widget enterCookieValue() {
      return Container(
        width: 400.0,

        child: TextField(
          decoration:  InputDecoration(
              labelText: "Enter cookies  value",
              labelStyle: TextStyle(color: Colors.green),
              hintText: "Enter cookies  value",
              alignLabelWithHint: true,
              prefixIcon: new Icon(Icons.text_fields)
          ),
          obscureText: false,
          onChanged: (value) {
            cookies = value.trim();
          },
        ),
      );
    }





    final localStoreBtn = new Container(
      width: 400.0,
        height: 40.0,
        child: new RaisedButton(
          child: new Text(
            'Local storage',
            style: new TextStyle(color: Colors.white),
          ),
          onPressed : () => _localStorage(),
          color: Colors.blue,
        ),
        margin: new EdgeInsets.only(top: 25.0)
    );


    final sessionStoreBtn = new Container(
        width: 400.0,

        height: 40.0,
        child: new RaisedButton(
          child: new Text(
            'Session storage',
            style: new TextStyle(color: Colors.white),
          ),
          onPressed : () => _sessionStore(),
          color: Colors.blue,
        ),
        margin: new EdgeInsets.only(top: 25.0)
    );

    final cookieStoreBtn = new Container(
        width: 400.0,

        height: 40.0,
        child: new RaisedButton(
          child: new Text(
            'Cookies',
            style: new TextStyle(color: Colors.white),
          ),
          onPressed : () => _cookieStorage(),
          color: Colors.blue,
        ),
        margin: new EdgeInsets.only(top: 25.0)
    );

    final apiCallBtn = new Container(
        width: 400.0,
        height: 40.0,
        child: new RaisedButton(

          child: new Text(

            'Tap to call api',
            style: new TextStyle(color: Colors.white),
          ),
          onPressed : () => getData(),
          color: Colors.blue,

        ),
        margin: new EdgeInsets.only(top: 25.0)
    );




    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Flutter web sample',style: TextStyle(fontSize: 18),),
      ),
      body:  Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(

                  children: <Widget>[


                     Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: <Widget>[
                         enterLocalStorageValue(),
                         localStoreBtn,
                       ],
                     ),

                   Padding(
                     padding: const EdgeInsets.all(8.0),
                   ),

                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: <Widget>[
                       enterSessionStorageValue(),
                       sessionStoreBtn,
                     ],
                   ),

                   Padding(
                     padding: const EdgeInsets.all(8.0),
                   ),

                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: <Widget>[
                       enterCookieValue(),
                       cookieStoreBtn,
                     ],
                   ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        apiCallBtn,
                      ],
                    ),




                  ],
           ),
      )
    );

  }

   _localStorage() {
     html.window.localStorage['local_value'] = localStorage;
  }

  _sessionStore() {
    html.window.sessionStorage['session_value'] = sessionStorage;
  }

  _cookieStorage() {
    html.window.document.cookie= "username=${cookies}; expires=Thu, 18 Dec 2020 12:00:00 UTC";
  }




    getData() async {
    try {
      final response = await http.get('https://jsonplaceholder.typicode.com/posts');
      print(response.body);

    } catch (e) {
      print(e);
    }
  }



}


