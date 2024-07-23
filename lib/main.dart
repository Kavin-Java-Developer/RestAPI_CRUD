import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //getdata
  Future<void> getData() async {
    final res = await http.get(Uri.parse(
        'https://api.restful-api.dev/objects/ff80818190c0e1170190d045c71f1531'));
    print(res.statusCode);
    print(res.body.toString());
  }

  Future<void> postData() async {
    final res =
        await http.post(Uri.parse('https://api.restful-api.dev/objects'),
            headers: {
              'Content-Type': 'application/json',
            },
            body: jsonEncode(
              {
                'name': 'kavin',
                'data': {
                  'rollno': '20IT016',
                  'class': 'B.Tech IT',
                  'Year': '4th year',
                  'CGPA': '9.1',
                }
              },
            ));
    print(res.body.toString());
  }

  Future<void> updateData() async {
    final res = await http.put(
        Uri.parse(
            'https://api.restful-api.dev/objects/ff80818190c0e1170190cb120f121115'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            'name': 'Kavin',
            'data': {
              'rollno': '20IT016',
              'class': 'B.Tech Information Technology',
              'Year': '3rd year',
              'CGPA': '9.1',
            }
          },
        ));
    print(res.body.toString());
  }

  Future<void> patchUpdateData() async {
    final res = await http.patch(
        Uri.parse(
            'https://api.restful-api.dev/objects/ff80818190c0e1170190cb120f121115'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            'name': 'Kavin S 123',
            'data': {
              // 'rollno': '20IT016',
              // 'class': 'B.Tech Information Technology',
              // 'Year': '3rd year',
              // 'CGPA': '9.1',
            }
          },
        ));
    print(res.body.toString());
  }

  Future<void> deleteData() async {
    final res = await http.delete(
      Uri.parse(
          'https://api.restful-api.dev/objects/ff80818190c0e1170190cb120f121115'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print(res.body.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    //postData();
    //getData();
    //updateData();
    //patchUpdateData();
    deleteData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Rest API (CRUD)'),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
