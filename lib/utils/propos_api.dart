import 'package:alba_app/models/proposicao_model.dart';
import 'package:intl/intl.dart';
import 'package:web_scraper/web_scraper.dart';

class PropositionApi {
  PropositionApi();

  final String htmlAlba = "http://www.al.ba.gov.br";
  List<ProposicaoModel> proposiList = List();
  String porNumero = ""; //filtro 1
  String porTipo = ""; //filtro 2
  String porDep = ""; //filtro 3
  String porExec = ""; //filtro 3
  String dataIni = "";
  String dataFim = "";
  String link;
  int banco;
  var pagHtml;

  Future<List> loadProposic({int filtro, String valor, int bancoPesq}) async {
    final webScraperLiv = WebScraper(htmlAlba);
    print("O valor do bancoPesqu é $bancoPesq");
    if(bancoPesq != null){
      banco = bancoPesq;
    }else{
      banco = 2;
    }


    switch(filtro){
      case 1:
        valor = valor.replaceAll("/", "%2F");
        porNumero = valor;
        print("\nO valor já formatado: ${valor}");
        break;
      case 2:
        porTipo = valor;
        break;
      case 3:
        if(valor == "66") {
          porExec = valor;
        }else {
          porDep = valor;
        }
        break;
      default:
        DateTime dataHoje = DateTime.now();
        DateTime data90 = dataHoje.add(new Duration(days: -90));
        DateTime data19Jan = DateTime(2021, 1, 19, 0, 0, 0, 0);
        DateTime dt90;
        int result = data90.compareTo(data19Jan);
        if(result < 0){
          dt90 = data19Jan;
        }else{
          dt90 = data90;
        }
        final df = new DateFormat('dd-MM-yyyy hh:mm a');
        var hj = df.format(dataHoje);
        var d90 = df.format(dt90);
        String hoje = (hj.substring(0, 10)).replaceAll("-", "%2F");
        String dia90 = (d90.substring(0, 10)).replaceAll("-", "%2F");
        dataIni = dia90;
        dataFim = hoje;
        break;
    }
    if(banco == 2){
      pagHtml = "/atividade-legislativa-nova/proposicoes?numero=${porNumero}&palavra=&tipo=${porTipo}&deputado=${porDep}&exDeputado=&outros=${porExec}&dataInicio=${dataIni}&dataFim=${dataFim}";
    }else{
      pagHtml = "/atividade-legislativa/proposicoes?numero=${porNumero}&palavra=&tipo=${porTipo}&deputado=${porDep}&exDeputado=&outros=${porExec}&dataInicio=${dataIni}&dataFim=${dataFim}";
    }


    if(await webScraperLiv.loadWebPage(pagHtml)){
      List<Map<String, dynamic>> elements1 =
      webScraperLiv.getElement("button.btn.fe-btn-alba.fe-btn-min-r.fe-center-x > span", [""]); //num
      List<Map<String, dynamic>> elements2 =
      webScraperLiv.getElement("tr.table-itens > td > span", [""]); // ementa

      print("O tamanho da lista 1 é: ${elements1.length}");

      if(elements1.length > 0){

        for(int i =0; i < elements2.length; i++) {
          ProposicaoModel proposi = ProposicaoModel();

          var descr = elements2[i]["title"];
          String ement = (descr.toString()).trim();

          var numProp = elements1[i]["title"];
          String numerProposi = (numProp.toString()).trim();
          String end = numerProposi.replaceAll("/", "-");
          link = "${htmlAlba}/atividade-legislativa/proposicao/${end}";

          proposi.linkProposi = link;
          proposi.ementProposi = ement;
          proposi.numerProposi = numerProposi;

          proposiList.add(proposi);
        }
        return proposiList;
      }else{
        return null;
      }
    }
  }

}