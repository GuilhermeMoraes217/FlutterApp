import 'package:flutter/material.dart';
import 'package:flutterapp/pages/main_page.dart';
import 'package:flutterapp/service/gerardor_numero.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numeroAletatorio = 0;
  var numeroCliques = 0;

  //CAMPOS DE EMAIL E SENHA
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController senhaController = TextEditingController(text: "");

  bool isVisibleSenha = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tela de Login'),
        ),
        // CRIANDO O SCROLL VIEW DA TELA
        body: SingleChildScrollView(
          // CRIANDO O CONSTRAINTE PARA PEGAR O TAMANHO DA TELA
          child: ConstrainedBox(
            // PASSANDO UNS PARAMENTRO PARA O CONSTRAINT
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Imagem do logo
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Image.network(
                      'https://www.google.com.br/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',
                    ),
                  ),

                  // Campo de e-mail ----------------------------------------------------------------------------------
                  TextField(
                    controller: emailController,
                    onChanged: (value) {
                      //email = value;
                      debugPrint(value);
                    },
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color.fromARGB(255, 38, 142, 173),
                      ),
                    ),
                  ),

                  // Espaçamento entre os campos de e-mail e senha
                  const SizedBox(height: 20.0),

                  // Campo de senha --------------------------------------------------------------------------------------
                  TextField(
                    controller: senhaController,
                    onChanged: (value) {
                      //senha = value;
                      debugPrint(value);
                    },
                    obscureText: isVisibleSenha,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color.fromARGB(255, 38, 142, 173),
                      ),
                      //COMANDO DE AÇÃO NO ICONE  - InkWell - GestureDetector (ONTAP)
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isVisibleSenha = !isVisibleSenha;
                          });
                        },
                        child: Icon(
                          isVisibleSenha
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: const Color.fromARGB(255, 38, 142, 173),
                        ),
                      ),
                    ),
                  ),

                  // Espaçamento abaixo dos campos de e-mail e senha
                  const SizedBox(height: 40.0),

                  // Texto perguntando se já possui uma conta
                  Text(
                    'Já possui uma conta? $numeroCliques',
                    textAlign: TextAlign.center,
                  ),

                  // Espaçamento abaixo do texto "Possui cadastro"
                  const SizedBox(height: 20.0),
                  // Botão de login ---------------------------------------------------------------------------------------
                  ElevatedButton(
                    onPressed: () {
                      // LÓGICA DE VERIFICAÇÃO DE EMAIL E SENHA
                      if (emailController.text.trim() ==
                              "guilhermefurtado78@gmail.com" &&
                          senhaController.text.trim() == "15462390") {
                        //NAVEGAÇÃO PARA OUTRA TELA DO APLICATIVO (Navigator.push (mas se torna uma pilha)) 
                        //Navigator.pushReplacement(mas se torna uma pilha))
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainPage()));
                        debugPrint("Login efetuado com sucesso.");
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Error! Incorrect login or password.')));
                        debugPrint("Erro ! Login ou senha incorretos.");
                      }
                      // Ação do botão de login
                      debugPrint("Email: ${emailController.text}");
                      debugPrint("Email: ${senhaController.text}");

                      setState(() {
                        numeroCliques =
                            GeradorNumeroAletario().gerarNumeroAleatorio();
                      });
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
