import 'dart:convert';
import 'package:financialapp/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String respDesc = '';
  List<Map<String, String>> otpList = [];

  void getData() async {
    try {
      final response = await http.get(Uri.parse(
          'http://196.11.150.234:8888/walletmobileapi/rest/wallet/fbns/customer/fetchotp/2348639906665/%7Bsecurity%7D'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        setState(() {
          respDesc = jsonData['respdesc'];
          otpList = List<Map<String, String>>.from(
              jsonData['otp'].map((otp) => Map<String, String>.from(otp)));
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Respdesc: $respDesc'),
              SizedBox(height: 16),
              const Text('OTP List:', style: TextStyle(fontWeight: FontWeight.bold)),
              Column(
                children: otpList
                    .map((otp) => ListTile(
                  title: Text('OTP: ${otp['otp']}'),
                  subtitle: Text('Status: ${otp['status']}'),
                ))
                    .toList(),
              ),

                Builder(
                  builder: (context) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  HomePage()));
                        }, child: Text("fetch data")),

                      ],
                    );
                  }
                ),

            ],
          ),

        ),
      ),
    );
  }
}