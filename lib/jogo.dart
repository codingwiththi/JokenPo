import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo:";
  var _numVit = 0;
  var _numDer = 0;
  var _numEmp = 0;

  void _opcaoSelecionada(var escolhaUsuario){
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var _escolhaApp = opcoes[numero];


    //Exibição da imagem escolhida pelo app
    switch(_escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;

    }

    //Validação do ganhador
    if((escolhaUsuario == "pedra" && _escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && _escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && _escolhaApp == "pedra")){

      setState(() {
        _numVit++;
        this._mensagem = "Você Venceu!";
      });



    }else if(escolhaUsuario == _escolhaApp) {
      setState(() {
        _numEmp++;
        this._mensagem = "Empate";
      });

    }else{
      setState(() {
        _numDer++;
        this._mensagem = "Perdeu Mané";
      });

    }


}//fim Void

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo!"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
              padding: EdgeInsets.only(top: 25, bottom: 16),
                child: Text(
                    "Escolha do App",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Image(image: _imagemApp),
              Padding(
                padding: EdgeInsets.only(top: 25, bottom: 16),
                child: Text(
                  this._mensagem,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),

                ),

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("pedra"),
                    child: Image.asset("images/pedra.png", height: 100),
                  ),
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("papel"),
                    child: Image.asset("images/papel.png", height: 100),
                  ),
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("tesoura"),
                    child: Image.asset("images/tesoura.png", height: 100),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 25, bottom: 5),
                child: Text(
                  "Vitórias: $_numVit",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),

                ),

              ),
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  "Empates: $_numEmp",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),

                ),

              ),
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  "Derrotas: $_numDer",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),

                ),

              ),
            ],
          ),
        ),
          //text Escolha do App

          //img
          //text
          //3 imgs
      ),
    );
  }
}
