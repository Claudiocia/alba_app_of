import 'package:alba_app/helpers/noticia_helper.dart';
import 'package:alba_app/models/noticia_model.dart';
import 'package:web_scraper/web_scraper.dart';

class NewsApi {
  NewsApi();

  NoticiaHelper helperNoti = NoticiaHelper();

  Future<List> loadNews() async {
    List<NoticiaModel> listNews = List();

    //Metodo para buscar as noticias no site da Alba
    final webScraper = WebScraper('http://www.al.ba.gov.br');
    if (await webScraper.loadWebPage('/midia-center/noticias')) {
      //lista com endereço das imagens
      List<Map<String, dynamic>> elements2 =
      webScraper.getElement('img.media-object', ['src']);
      //lista com as manchetes e link da matéria
      List<Map<String, dynamic>> elements =
      webScraper.getElement('h5.media-heading > a.title-new', ['href']);
      List<Map<String, dynamic>> elements3 =
      webScraper.getElement('h5.media-heading > b.title-new', ['']);
      List<Map<String, dynamic>> elements4 =
      webScraper.getElement('div.media-body > p.sub-title-new', ['']);

      //print('Tamanho do mapa ${elements.length}');

      for (int i = 0; i < elements.length; i++) {
        NoticiaModel noti = NoticiaModel();
        var nome = elements[i]["title"];
        String tit = (nome as String).trim();
        var email = elements[i]['attributes'];
        String link = "http://www.al.ba.gov.br" +
            (email.toString()).substring(7, (email.toString()).length - 1);
        var image = elements2[i]['attributes'];
        String img = "http://www.al.ba.gov.br" +
            (image.toString()).substring(6, (image.toString()).length - 1);
        var data = elements3[i]['title'];
        String datHora =
        (data.toString()).substring(0, (data.toString()).length - 3);
        String res = (elements4[i]['title']).toString();
        print('TituNot: $tit \nLinkNot: $link \nLinkImg: $img');
        noti.titleNoticia = tit;
        noti.dataNoticia = datHora;
        noti.resumoNoticia = res;
        noti.linkNoticia = link;
        noti.fotoNoticia = img;

        helperNoti.getNotiExist(noti).then((value){
          if(value == null){
            try {
              helperNoti.saveNoticia(noti);
            } catch (e) {
              //print(e);
            }
          }
        });
        listNews.add(noti);
      }
    }
    helperNoti.deleteNotiPrazo().then((valor) {
      print("o retorno do delete é: $valor");
    });
    return listNews;
  }
}