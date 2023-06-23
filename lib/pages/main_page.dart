import 'package:flutter/material.dart';
import 'package:flutterapp/pages/dados_cadastrais.dart';
import 'package:flutterapp/pages/pagina1.dart';
import 'package:flutterapp/pages/pagina2.dart';
import 'package:flutterapp/pages/pagina3.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int posicaoPagina = 0;
  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Tela inicial")),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      child: const Text("Dados cadastrais")),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DadosCadastrais(
                                  text: "Meus dados",
                                  dados: ["Guilherme", "Moraes", "Furtado"],
                                )));
                  },
                ),
                const Divider(),
                const SizedBox(
                  height: 1,
                ),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      child: const Text("Termos de uso e privacidade")),
                  onTap: () {},
                ),
                const Divider(),
                const SizedBox(
                  height: 1,
                ),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      child: const Text("Configurações")),
                  onTap: () {},
                ),
                const Divider(),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                //COMANDO PARA MUDAR DE PÁGINA AO ARASTAR A TELA PARA A ESQUERDA OU DIREITA
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                children: const [Pagina1(), Pagina2(), Pagina3()],
              ),
            ),
            BottomNavigationBar(
                //COMANDO PARA MUDAR DE PÁGINA AO CLICAR NO ICONE DO NAVIGATIONBAR
                onTap: (value) {
                  controller.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                      label: "Mesas", icon: Icon(Icons.tab)),
                  BottomNavigationBarItem(
                      label: "Vendas avulso",
                      icon: Icon(Icons.production_quantity_limits_rounded)),
                  BottomNavigationBarItem(
                      label: "Configuração", icon: Icon(Icons.settings))
                ])
          ],
        ),
      ),
    );
  }
}
