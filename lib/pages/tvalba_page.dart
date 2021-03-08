import 'package:alba_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class PlaceTVAlbaWidget extends StatefulWidget {
  PlaceTVAlbaWidget();
  @override
  _PlaceTVAlbaWidgetState createState() => _PlaceTVAlbaWidgetState();
}

class _PlaceTVAlbaWidgetState extends State<PlaceTVAlbaWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ALBA APP",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF004a92),
          centerTitle: true,
          title: Image.asset("assets/images/marca_mobi.png",
            width: 100.0,),
        ),
        drawer: CustomDrawer(),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Cheguei na página TV Alba"),
                ],
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Retornar'),
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
