import 'package:flutter/material.dart';

class ApiData extends StatefulWidget {
  const ApiData({Key? key}) : super(key: key);

  @override
  _ApiDataState createState() => _ApiDataState();
}

class _ApiDataState extends State<ApiData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API DATA'),centerTitle: true,),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text('text'),
                  ]),
            ),
          );
        },
        itemCount: 50,
      ),
    );
  }
}
