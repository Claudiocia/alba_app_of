import 'package:alba_app/helpers/usuario_helper.dart';
import 'package:alba_app/pages/dep_page.dart';
import 'package:alba_app/pages/home_page.dart';
import 'package:alba_app/pages/mais_page.dart';
import 'package:alba_app/pages/tel_page.dart';
import 'package:alba_app/utils/news_api.dart';
import 'package:alba_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class PrincPage extends StatefulWidget {
  PrincPage();
  @override
  _PrincPageState createState() => _PrincPageState();
}

class _PrincPageState extends State<PrincPage> {

  //Variaveis para teste do banco
  UsuarioHelper helper = UsuarioHelper();
  NewsApi news = NewsApi();

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    news.loadNews().then((value){
      //print("Resultado da classe News: $value");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Dosis'),
      title: "ALBA APP",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF004a92),
          centerTitle: true,
          title: Image.asset("assets/images/marca_mobi.png",
            width: 100.0,
          ),
        ),
        drawer: CustomDrawer(),
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: new GridView.builder(
              itemCount: _filesNome.length,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2.0,
                  crossAxisCount: 1),
              itemBuilder: (BuildContext context, int index) {
                return new Card(
                  elevation:  10,
                  margin: EdgeInsets.all(10),
                  child: new InkResponse(
                    child: Image.asset(
                      _filesNome[index],
                      fit: BoxFit.fill,
                    ),
                    onTap: () {
                      _routesNavigations(context, index);
                    },
                  ),
                );
              }),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  List<String> _filesNome = [
    'assets/images/abt_noticias.jpg',
    'assets/images/abt_deputados.jpg',
    'assets/images/abt_tel_uteis.jpg',
    'assets/images/abt_mais_alba.jpg',
  ];

  _routesNavigations(BuildContext context, int id) {
    switch (id) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomePage()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DepPage()));
        break;
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TelPage()));
        break;
      case 3:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MaisPage()));
        break;
    }
  }

}