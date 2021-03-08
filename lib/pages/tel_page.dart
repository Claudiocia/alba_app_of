import 'package:alba_app/helpers/usuario_helper.dart';
import 'package:alba_app/pages/deputados_page.dart';
import 'package:alba_app/pages/maisalba_page.dart';
import 'package:alba_app/pages/noticias_page.dart';
import 'package:alba_app/pages/pesq_telefones_page.dart';
import 'package:alba_app/pages/telefones_page.dart';
import 'package:alba_app/pages/todosdep_page.dart';
import 'package:alba_app/splashscreen.dart';
import 'package:alba_app/utils/news_api.dart';
import 'package:alba_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class TelPage extends StatefulWidget {
  TelPage();
  @override
  _TelPageState createState() => _TelPageState();
}

class _TelPageState extends State<TelPage> {

  //Variaveis para teste do banco
  UsuarioHelper helper = UsuarioHelper();
  NewsApi news = NewsApi();

  //Variaves usadas nesta classe
  int selectedIndex = 2;
  String _noticia = "ALBA - Notícias";
  String _deputado = "ALBA - Deputados";
  String _telefone = "ALBA - Telefones";
  String _albaPlus = "ALBA - Mais Opções";
  String titlePag;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  definirTitulo(int index){
    switch (index){
      case 0:
        titlePag = _noticia;
        break;
      case 1:
        titlePag = _deputado;
        break;
      case 2:
        titlePag = _telefone;
        break;
      case 3:
        titlePag = _albaPlus;
        break;
    }
    return titlePag;
  }

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    news.loadNews().then((value){

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ALBA APP",
      home: Scaffold(
        appBar: botaoBarra(),
        body: Center(
          child: widgetOptions.elementAt(selectedIndex),
        ),
        drawer: CustomDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: 'Notícias',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Deputados',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_phone),
              label: 'Tel Uteis',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Mais Alba',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.blueAccent, //amber[800],
          onTap: onItemTapped,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
  List<Widget> widgetOptions = <Widget>[
    PlaceNoticiaWidget(),
    PlaceDeputadoWidget(),
    PlaceTelefoneWidget(),
    PlaceMaisAlbaWidget(),
  ];

  botaoBarra(){
    switch (selectedIndex){
      case 0:
        return AppBar(
          backgroundColor: Color(0xFF004a92),
          centerTitle: true,
          title: Image.asset("assets/images/marca_mobi.png",
            width: 100.0,),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              tooltip: "Recarregar",
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => SplashScreenPage()));
              },
            ),
          ],
        );
        break;
      case 1:
        return AppBar(
          backgroundColor: Color(0xFF004a92),
          centerTitle: true,
          title: Image.asset("assets/images/marca_mobi.png",
            width: 100.0,),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.people_outline),
              tooltip: "Listar todos dep",
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => PlaceTodosDepWidget()));
              },
            ),
          ],
        );
        break;
      case 2:
        return AppBar(
          backgroundColor: Color(0xFF004a92),
          centerTitle: true,
          title: Image.asset("assets/images/marca_mobi.png",
            width: 100.0,),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: "Pesquisar",
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => PlacePesqTelefonesWidget()));
              },
            ),
          ],
        );
        break;
      case 3:
        return AppBar(
          backgroundColor: Color(0xFF004a92),
          centerTitle: true,
          title: Image.asset("assets/images/marca_mobi.png",
            width: 100.0,),
        );
        break;
    }
  }

}