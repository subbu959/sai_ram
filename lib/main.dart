import 'package:flutter/material.dart';
import 'package:sai_ram/addnew.dart';
import 'package:sai_ram/recents.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  List<String> _tabs = ["New", "History", "Report"];
  @override  initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: _tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("సాయి రామ్ కంకర"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
              Tab(icon: Icon(Icons.fiber_new)),
              Tab(icon: Icon(Icons.history)),
              Tab(icon: Icon(Icons.attach_money)),
            ],
        ),
      ),
  
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          AddingNewData(),
          Resultdata(),
                    Center(child: Text("Report"))
                  ],
                )
              );
            }
          }  


