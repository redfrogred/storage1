import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:storage1/classes/Storage.dart';
import 'classes/Stored.dart';

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
              Text('name = "${ storage.name }"'),
              Text('count = "${ storage.count.toString() }"'),
              const SizedBox(height:32),




              // SET COOKIE
              ElevatedButton(   
                onPressed: () async  {
                  storage.prefs.setString('name','Charlie 1');  
                },
                child: Text('Store Name'), // change to: fruit, color, name, etc.
              ),
              ElevatedButton(   
                onPressed: () async  {
                  storage.prefs.setInt('count',15);  
                },
                child: Text('Store number'), // change to: fruit, color, name, etc.
              ),


              // READ COOKIE
              ElevatedButton(   
                onPressed: () async  {
                  String? _name = storage.prefs.getString('name');  
                  int? _count = storage.prefs.getInt('count');  
                  if (_name == null) {
                    _name = '';
                  }
                  if (_count == null) {
                    _count = 0;
                  }                  
                  setState(() { 
                    storage.name = _name!;
                    // bump it up
                    storage.count = _count! +1;  
                    storage.prefs.setInt('count',storage.count);
                  });
                },
                child: Text('Load Prefs'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}