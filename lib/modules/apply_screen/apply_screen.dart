import 'package:flutter/material.dart';

class ApplyScreen extends StatefulWidget {
  @override
  State<ApplyScreen> createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<ApplyScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 130.0,
          backgroundColor: Colors.deepPurple,
          actions: [
            IconButton(
              icon: Icon(Icons.account_circle,color: Colors.white,size: 40,),
              onPressed: () {},
            ),
          ],
          title:Padding(
            padding: const EdgeInsetsDirectional.only(top: 50.0),
            child: Row(
              children: [
                Text(
                  "CodeQuest",
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                ),
                SizedBox(width: 20),
                Expanded(child: TabBar(
                  indicatorColor: Colors.white,
                  indicatorWeight: 3,
                  labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                  tabs: [
                    Tab(text: "Apply"),
                    Tab(text: "Prepare"),
                    Tab(text: "Certify"),
                  ],
                ),)
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("Prepare Content")),
            Center(child: Text("Certify Content")),
            Center(child: Text("Apply Content")),
          ],
        ),
      ),
    );
  }
}
