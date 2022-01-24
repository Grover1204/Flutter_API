import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api_data.dart';
import 'crew_json.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Future<Crew?> submitData(
  String basic,
  String blogs,
  String clientPostings,
  String crewPostings,
  String events,
  String isLoggedIn,
  String locations,
  String portfolio,
  String professions,
  String questions,
  String skills,
  String socialHubs,
) async {
  // await SharedPreferences.getInstance();
  var response = await http.post(
    Uri.https(
      'py.crewbella.com',
      'user/api/profile/chiragbalani',
    ),
    body: {
      'basic': basic,
      'blogs': blogs,
      'clientPostings': clientPostings,
      'crewPostings': crewPostings,
      'events': events,
      'isLoggedIn': isLoggedIn,
      'locations': locations,
      'portfolio': portfolio,
      'professions': professions,
      'questions': questions,
      'skills': skills,
      'socialHubs': socialHubs,
    },
  );
  var data = response;
  var jsonData = jsonDecode(response.body);
  // ignore: avoid_print
  // print(data + 'hello');
  print(response.body.length);
  String responsestring = response.body;
  dataModelFromJson(responsestring);
  // if (response != null) {

  // } else {
  //   return null;
  // }
}

void dataModelFromJson(String responsestring) {}

class _MyHomePageState extends State<MyHomePage> {
  late Crew _crewdata;
  String? value;
  final items = [
    'basic',
    'blogs',
    'clientPostings',
    'crewPostings',
    'events',
    'isLoggedIn',
    'locations',
    'portfolio',
    'professions',
    'questions',
    'skills',
    'socialHubs',
  ];

  TextEditingController namecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(bottom: 100, top: 100),
              child: const Text(
                'Crewbella',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(left: 15, right: 15, top: 5),
              color: Colors.white70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        padding: EdgeInsets.all(20),
                        alignedDropdown: true,
                        child: DropdownButton(
                          elevation: 10,
                          onChanged: (value) {
                            setState(() {
                              this.value = value as String?;
                              print(value);
                            });
                          },
                          items: items.map(buildMenuItem).toList(),
                          value: value,
                          iconSize: 30,
                          icon: Icon(Icons.arrow_drop_down),
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                          hint: Text('Select Data'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  ApiData()));
                  String basics = namecontroller.text;

                  Crew? data = await submitData(
                    basics,
                    basics,
                    basics,
                    basics,
                    basics,
                    basics,
                    basics,
                    basics,
                    basics,
                    basics,
                    basics,
                    basics,
                  );
                  setState(() {
                    _crewdata = data!;
                    // print(data.clientPostings);
                  });
                  
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text('API data'),
                )),
          ],
        ),
      ),
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );

