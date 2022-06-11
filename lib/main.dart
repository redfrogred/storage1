import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:storage1/classes/Storage.dart';
import 'classes/Storage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }
  
  Storage storage = Storage();

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
              Text(storage.str),
              const SizedBox(height:32),




              // SET COOKIE
              ElevatedButton(   
                onPressed: () async  {
                  storage.cookie.setString('name','Peter');  
                },
                child: Text('Store Name'), // change to: fruit, color, name, etc.
              ),



              // READ COOKIE
              ElevatedButton(   
                onPressed: () async  {
                  String? crumb = storage.cookie.getString('fruit');  
                  if (crumb == null) return;
                  setState(() { storage.str = crumb; });
                },
                child: Text('Load Fruit'),
              ),
              ElevatedButton(   
                onPressed: () async  {
                  String? crumb = storage.cookie.getString('name');  
                  if (crumb == null) return;
                  setState(() { storage.str = crumb; });
                },
                child: Text('Load Name'),
              ),
              ElevatedButton(   
                onPressed: () async  {
                  String? crumb = storage.cookie.getString('color');  
                  if (crumb == null) return;
                  setState(() { storage.str = crumb; });
                },
                child: Text('Load Color'),
              )                 
            ],
          ),
        ),
      ),
    );
  }
}