import 'package:flutter/material.dart';

class DadosCadastrais extends StatefulWidget {
  final String
      text; // forma de como recuperar dados de outra tela, se cria um final e adicona abaixa required this.text
  final List<String> dados;


  const DadosCadastrais({super.key, required this.text, required this.dados});

  @override
  State<DadosCadastrais> createState() => _DadosCadastraisState();
}

class _DadosCadastraisState extends State<DadosCadastrais> {
  TextEditingController nomeController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.text),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Nome: ",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            TextField(
              controller: nomeController,
            ),

            // Botão de login ---------------------------------------------------------------------------------------
                  ElevatedButton(
                    onPressed: () {
                      // LÓGICA DE VERIFICAÇÃO
                      debugPrint(nomeController.text);
                    },
                    child: const Text('Login'),
                  )
          ],
        ),
      ),
    );
  }
}
