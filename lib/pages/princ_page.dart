import 'package:alba_app/helpers/usuario_helper.dart';
import 'package:alba_app/pages/albavox_page.dart';
import 'package:alba_app/pages/dep_page.dart';
import 'package:alba_app/pages/home_page.dart';
import 'package:alba_app/pages/mais_page.dart';
import 'package:alba_app/pages/partidos_page.dart';
import 'package:alba_app/pages/tel_page.dart';
import 'package:alba_app/pages/tvalba_page.dart';
import 'package:alba_app/utils/news_api.dart';
import 'package:alba_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
      title: "ALBA APP",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF004a92),
          centerTitle: true,
          title: Image.asset("assets/images/marca_mobi.png",
            width: 100.0,),
          //Text(
          //definirTitulo(selectedIndex)
          //),
          //leading: Image.asset("assets/images/ic_marca_round.png"),
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
      case 4:
        _launchURL("http://egbanet.egba.ba.gov.br/alba");
        break;
      case 5:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PlacePartidosWidget()));
        break;
      case 6:
      //_launchURL("http://www.al.ba.gov.br/midia-center/tvalba");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PlaceTVAlbaWidget()));
        break;
      case 7:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PlaceAlbavoxWidget()));
        break;
    }
  }

  _launchURL(String urlNew) async {
    var url = urlNew;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}