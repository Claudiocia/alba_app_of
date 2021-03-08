

class AutorForForm {
  int idAutor;
  String nomeAutor;

  AutorForForm(this.idAutor, this.nomeAutor);

  static getAutor(String nome) {
    int x = 0;
    switch(nome){
      case "Aderbal Caldas":
        x = 70;
        break;
      case "Adolfo Menezes":
        x = 100;
        break;
      case "Alan Castro":
        x = 386;
        break;
      case "Alan Sanches":
        x = 340;
        break;
      case "Alex da Piatã":
        x = 396;
        break;
      case "Alex Lima":
        x = 391;
        break;
      case "Antonio Henrique Junior":
        x = 398;
        break;
      case "Bobô":
        x = 389;
        break;
      case "Capitão Alden":
        x = 412;
        break;
      case "Dal":
        x = 413;
        break;
      case "David Rios":
        x = 383;
        break;
      case "Diego Coronel":
        x = 414;
        break;
      case "Eduardo Alencar":
        x = 415;
        break;
      case "Eduardo Salles":
        x = 390;
        break;
      case "Euclides Fernandes":
        x = 106;
        break;
      case "Fabíola Mansur":
        x = 388;
        break;
      case "Fabrício Falcão":
        x = 352;
        break;
      case "Fátima Nunes Lula":
        x = 373;
        break;
      case "Hilton Coelho":
        x = 416;
        break;
      case "Ivana Bastos":
        x = 351;
        break;
      case "Jacó Lula da Silva":
        x = 417;
        break;
      case "Janio Natal":
        x = 208;
        break;
      case "José de Arimateia":
        x = 212;
        break;
      case "Júnior Muniz":
        x = 418;
        break;
      case "Jurailton Santos":
        x = 419;
        break;
      case "Jurandy Oliveira":
        x = 27;
        break;
      case "Jusmari Oliveira":
        x = 73;
        break;
      case "Kátia Oliveira":
        x = 420;
        break;
      case "Laerte do Vando":
        x = 421;
        break;
      case "Luciano Simões Filho":
        x = 394;
        break;
      case "Marcelinho Veiga":
        x = 423;
        break;
      case "Marcelino Galo Lula":
        x = 359;
        break;
      case "Marcell dos Animais":
        x = 384;
        break;
      case "Maria del Carmen Lula":
        x = 287;
        break;
      case "Marquinho Viana":
        x = 377;
        break;
      case "Mirela Macedo":
        x = 407;
        break;
      case "Nelson Leal":
        x = 71;
        break;
      case "Neusa Lula Cadore":
        x = 119;
        break;
      case "Niltinho":
        x = 424;
        break;
      case "Olivia Santana":
        x = 425;
        break;
      case "Osni Cardoso Lula da Silva":
        x = 426;
        break;
      case "Pastor Isidório Filho":
        x = 427;
        break;
      case "Paulo Câmara":
        x = 429;
        break;
      case "Paulo Rangel Lula da Silva":
        x = 42;
        break;
      case "Pedro Tavares":
        x = 363;
        break;
      case "Poder Executivo":
        x = 66;
        break;
      case "Roberto Carlos":
        x = 46;
        break;
      case "Robinho":
        x = 399;
        break;
      case "Robinson Almeida Lula":
        x = 430;
        break;
      case "Rogério Andrade Filho":
        x = 431;
        break;
      case "Rosemberg Lula Pinto":
        x = 364;
        break;
      case "Samuel Júnior":
        x = 405;
        break;
      case "Sandro Régis":
        x = 50;
        break;
      case "Soldado Prisco":
        x = 382;
        break;
      case "Talita Oliveira":
        x = 432;
        break;
      case "Targino Machado":
        x = 54;
        break;
      case "Tiago Correia":
        x = 435;
        break;
      case "Tom Araújo":
        x = 367;
        break;
      case "Tom é Meu Amigo":
        x = 428;
        break;
      case "Tum":
        x = 433;
        break;
      case "Vitor Bonfim":
        x = 395;
        break;
      case "Zé Cocá":
        x = 434;
        break;
      case "Zé Raimundo Lula":
        x = 354;
        break;
      case "Zó":
        x = 400;
        break;
    }
    return x;
  }

  static List<String> getAutorString(){
    return <String>[
      "Aderbal Caldas", "Adolfo Menezes", "Alan Castro",  "Alan Sanches", "Alex da Piatã",
      "Alex Lima", "Antonio Henrique Junior", "Bobô", "Capitão Alden", "Dal", "David Rios",
      "Diego Coronel", "Eduardo Alencar", "Eduardo Salles", "Euclides Fernandes", "Fabíola Mansur",
      "Fabrício Falcão", "Fátima Nunes Lula",  "Hilton Coelho", "Ivana Bastos", "Jacó Lula da Silva",
      "Janio Natal", "José de Arimateia", "Júnior Muniz", "Jurailton Santos", "Jurandy Oliveira",
      "Jusmari Oliveira", "Kátia Oliveira", "Laerte do Vando", "Luciano Simões Filho", "Marcelinho Veiga",
      "Marcelino Galo Lula", "Marcell dos Animais", "Maria del Carmen Lula", "Marquinho Viana",
      "Mirela Macedo", "Nelson Leal", "Neusa Lula Cadore", "Niltinho", "Olivia Santana",
      "Osni Cardoso Lula da Silva", "Pastor Isidório Filho", "Paulo Câmara", "Paulo Rangel Lula da Silva",
      "Pedro Tavares", "Poder Executivo", "Roberto Carlos", "Robinho", "Robinson Almeida Lula",
      "Rogério Andrade Filho", "Rosemberg Lula Pinto", "Samuel Júnior", "Sandro Régis", "Soldado Prisco",
      "Talita Oliveira", "Targino Machado", "Tiago Correia", "Tom Araújo", "Tom é Meu Amigo", "Tum",
      "Vitor Bonfim", "Zé Cocá", "Zé Raimundo Lula", "Zó",
    ];
  }
}