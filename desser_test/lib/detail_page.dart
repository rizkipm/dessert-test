import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


class DetailPage extends StatefulWidget {
  DetailPage({this.idMeal,this.nama, this.picture, this.description});
  final String nama;
  final String picture;
   String description, idMeal;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
              height: 250.0,
              child: new Hero(
                tag: widget.nama,
                child: new Material(
                  child: new InkWell(
                    /*child: Image.network(
                      (userData[index]["strMealThumb"]),
                      height: 200.0,
                      width: 150.0,
                    ),*/
                    child: Image.network(
                      "${widget.picture}",
                      height: 120,
                      width: 200,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              )),
          new PartName(
            nama: widget.nama,
          ),
          new PartIcon(),
          new Description(
            description: widget.idMeal,
          ),
        ],
      ),
    );
  }
}



class PartName extends StatelessWidget {
  PartName({this.nama});
  final String nama;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  nama,
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
                new Text(
                  "$nama\@gmail.com",
                  style: new TextStyle(fontSize: 17.0, color: Colors.grey),
                ),
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Icon(
                Icons.star,
                size: 30.0,
                color: Colors.red,
              ),
              new Text(
                "12",
                style: new TextStyle(fontSize: 18.0),
              )
            ],
          )
        ],
      ),
    );
  }
}

class PartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Iconteks(
            icon: Icons.call,
            teks: "Call",
          ),
          new Iconteks(
            icon: Icons.message,
            teks: "Message",
          ),
          new Iconteks(
            icon: Icons.photo,
            teks: "Photo",
          ),
        ],
      ),
    );
  }
}

class Iconteks extends StatelessWidget {
  Iconteks({this.icon, this.teks});
  final IconData icon;
  final String teks;
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: Colors.blue,
          ),
          new Text(
            teks,
            style: new TextStyle(fontSize: 18.0, color: Colors.blue),
          )
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  Description({this.description});
  final String description;

  /*final String url =
      'https://themealdb.com/api/json/v1/1/lookup.php?i=description';
  List data;

  Future<String> getData() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {'accept': 'application/json'});
    print(res);
    var toJsonData = json.decode(res.body);
    data = toJsonData['meals'];
  }*/

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Card(
          child: new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Text(
              "$description",
              style: new TextStyle(fontSize: 18.0),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ),
    );
  }
}