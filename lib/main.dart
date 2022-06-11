import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
String name = '';
late SharedPreferences preferences;

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    preferences = await SharedPreferences.getInstance();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name),
              const SizedBox(height:32),
              ElevatedButton(   
                onPressed: () async  {
                  preferences.setString('name','felix');  
                },
                child: Text('Store'),
              ),

              ElevatedButton(   
                onPressed: () async  {
                  String? name = preferences.getString('name');  
                  if (name == null) return;
                  setState(() {
                    this.name = name;
                  });
                },
                child: Text('Load'),
              )              
            ],
          ),
        ),
      ),
    );
  }
}