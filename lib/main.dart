import 'dart:developer';

import 'package:amiibo_list/view_model/main_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: MainViewModel())
      ],
      child: MaterialApp(
        title: 'Amiibo List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Amiibo'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();


}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    Provider.of<MainViewModel>(context).getList();
    var result = Provider.of<MainViewModel>(context).list;
      log(result.toString());
      return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: ListView.builder(
              itemCount: result.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  width: 200,
                  child: Text(result[index].character),
                );
                return CircularProgressIndicator();
              })
        // This trailing comma makes auto-formatting nicer for build methods
      );
  }

  @override
  void initState() {
    super.initState();
  }
}
