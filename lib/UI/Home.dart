
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ufiles/Engine/FileMain.dart';
import 'package:ufiles/Engine/Permissions.dart';
import 'package:ufiles/Styles/Styles.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    getPermissions();
    streamhelm();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: appbar(),
      bottomNavigationBar: bottombar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: StreamBuilder(
                  stream: mainstream.stream,
                  builder: (context, filelist) {
                    return ListView.builder(
                        padding: EdgeInsets.all(8),
                        itemCount: directories.length,
                        itemBuilder: (context, index) {
                          if (directories.length < 1) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return InkWell(
                            onTap: () {
                              setState(() {
                                if (filelist.data[index] is File) {
                                
                                } else {
                                  setDirectory(filelist.data[index].path);
                                  streamhelm();
                                }
                              });
                            },
                            child: Card(
                              child: ListTile(
                                title: Text(filelist.data[index].path),
                              ),
                            ),
                          );
                        });
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget bottombar(){
    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      items: [
      BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('List')),
      BottomNavigationBarItem(icon: Icon(Icons.grid_on), title: Text('List')),
    ]);
  }


  Widget appbar(){
    return AppBar(
        actions: <Widget>[
         PopupMenuButton<FlatButton>(itemBuilder: (context) =>[
            PopupMenuItem(child: FlatButton(onPressed: (){}, child: Text('Settings'),)),
            PopupMenuItem(child: FlatButton(onPressed: (){}, child: Text('Themes'),)),
            PopupMenuItem(child: FlatButton(onPressed: (){}, child: Text('About'),)),
         ])
        ],
        title: Row(
          children: <Widget>[
            Container(
              height: 64,
              width: 64,
              child: FlatButton(
                  shape: rounded(64),
                  onPressed: () {
                    setState(() {
                      if (storage.path == '/storage/emulated/0' || storage.path == '/storage/emulated/0/') {
                        
                      } else {
                        print(storage.parent.path);
                        setDirectory(storage.parent.path);
                        streamhelm();
                      }
                    });
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
            ),
            Container(child: Text(storage.path.split('/').last)),
          ],
        ),
      );
  }
}
