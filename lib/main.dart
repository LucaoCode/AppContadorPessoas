import 'package:flutter/material.dart';
import 'dart:math'; // Import para gerar cores aleatórias

void main() {
  runApp(ContadorPessoasApp());
}

class ContadorPessoasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContadorPessoas(),
    );
  }
}

class ContadorPessoas extends StatefulWidget {
  @override
  _ContadorPessoasState createState() => _ContadorPessoasState();
}

class _ContadorPessoasState extends State<ContadorPessoas> {
  int _contador = 0; // Variável que armazena a contagem de pessoas
  Color _corDeFundo = Colors.white; // Cor inicial do fundo

  // Lista de cores predefinidas para o fundo
  final List<Color> _cores = [
    Colors.white,
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
    Colors.teal,
  ];

  // Método para incrementar o contador
  void _incrementar() {
    setState(() {
      _contador++; // Aumenta o valor do contador
    });
  }

  // Método para decrementar o contador
  void _decrementar() {
    setState(() {
      if (_contador > 0) _contador--; // Garante que não fique negativo
    });
  }

  // Método para trocar a cor de fundo aleatoriamente
  void _mudarCorDeFundo() {
    setState(() {
      _corDeFundo = _cores[Random().nextInt(_cores.length)]; // Cor aleatória
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador de Pessoas'),
        centerTitle: true,
      ),
      body: Container(
        color: _corDeFundo, 
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pessoas Contadas:',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                '$_contador',
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              // Mensagem de alerta se o contador for maior que 10
              if (_contador > 10)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Número máximo atingido!',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _incrementar,
                    child: Text('Adicionar'),
                  ),
                  SizedBox(width: 20), // Espaçamento entre os botões
                  ElevatedButton(
                    onPressed: _decrementar,
                    child: Text('Remover'),
                  ),
                ],
              ),
              SizedBox(height: 20), // Espaçamento para o botão de cor
              ElevatedButton(
                onPressed: _mudarCorDeFundo,
                child: Text('Mudar Cor de Fundo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
