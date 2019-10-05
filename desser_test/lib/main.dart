import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model/model_meal.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'detail_page.dart';

void main() {
  runApp(new MaterialApp(
    title: "DESERT",
    home: new Desert(),debugShowCheckedModeBanner: false,
  ));
}

class Desert extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Desert> {
  Map data;
  List userData = [];

  Map datadetail;
  dynamic userDataDetail;

  Future getData() async {
    http.Response response = await http
        .get("https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert");
    data = jsonDecode(response.body);
    print(data);
    setState(() {
      userData = data["meals"];
      print(userData);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
//    getDataDetail(userDataDetail);
  }

  @override
  Widget build(BuildContext context) {
//    getDataDetail(userDataDetail);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "DESERT",
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.8),
        itemCount: userData == null ? 0 : userData.length,
        itemBuilder: (BuildContext contsext, int index) {
          //getDataDetail(userDataDetail);
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  new Hero(
                    tag: userData[index]['strMeal'],
                    child: new Material(
                      child: new InkWell(
                        onTap: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) => new DetailPage(
                                idMeal: userData[index]['idMeal'],
                                nama: userData[index]['strMeal'],
                                picture: userData[index]["strMealThumb"],
                                description: userData[index]['strInstructions'],
                              ),
                            )),
                        child: Image.network(
                          (userData[index]["strMealThumb"]),
                          height: 125.0,
                          width: 125.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25.0,),
                  new Text(
                    "${userData[index]["strMeal"]}",
                    style:
                    TextStyle(fontSize: 12.0, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}