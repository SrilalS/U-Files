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
    // TODO: implement initState
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
      appBar: AppBar(
        title: Container(
          height: 64,
          width: 64,
          child: FlatButton(
            shape: rounded(64),
            onPressed: (){
                    setState(() {
                      setDirectory(storage.parent.path);
                      streamhelm();
                    });
                  }, child: Icon(Icons.arrow_back, color: Colors.white,)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              
              height: h*0.8,
              child: StreamBuilder(
                  stream: mainstream.stream,
                  builder: (context, files) {
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
                                setDirectory(files.data[index].path);
                                streamhelm();

                              });
                            },
                            child: Card(
                              child: ListTile(
                                title: Text(files.data[index].path),
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
}
