import 'package:alba_app/helpers/noticia_helper.dart';
import 'package:alba_app/models/noticia_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class PlaceNoticiaWidget extends StatefulWidget {
  PlaceNoticiaWidget();

  @override
  PlaceNoticiaWidgetState createState() => PlaceNoticiaWidgetState();
}

class PlaceNoticiaWidgetState extends State<PlaceNoticiaWidget> {
  NoticiaHelper helperNoti = NoticiaHelper();
  NoticiaModel noti = NoticiaModel();
  List<NoticiaModel> listNotis = List();
  String path;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    helperNoti.getAllNoticias().then((list) {
      setState(() {
        listNotis = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listaNoticias(),
    );
  }

  listaNoticias() {
    return ListView.separated(
        padding: EdgeInsets.only(left: 0.0, top: 5.0, right: 0.0, bottom: 5.0),
        separatorBuilder: (context, index) => Divider(color: Colors.black54),
        itemCount: listNotis.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              listNotis[index].dataNoticia,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            subtitle: Text(
              listNotis[index].titleNoticia,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              maxLines: 2,
            ),
            leading: Image.network(
              listNotis[index].fotoNoticia,
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Qual o seu desejo?"),
                    content: Text(
                      listNotis[index].titleNoticia,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: (){
                          _launchURL(listNotis[index].linkNoticia);
                          Navigator.of(context).pop(true);
                        },
                        child: Text("Ler a íntegra da noticia!"),
                      ),
                      FlatButton(
                        onPressed: (){
                          _shareLink(listNotis[index].linkNoticia);
                          Navigator.of(context).pop(true);
                        },
                        child: Text("Compartilhar"),
                      ),
                      FlatButton(
                          onPressed: (){
                            Navigator.of(context).pop(true);
                          },

                          child: Text('FECHAR'))
                    ],
                  ));
            },
          );
        });
  }

  _launchURL(String urlNew) async {

    var url = urlNew;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _shareLink(String texto) async {
    await Share.share(texto);
  }

}
