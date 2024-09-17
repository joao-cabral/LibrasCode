import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Sobre",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "O que é o LibrasCode?",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text:
                          "A inclusão de deficientes auditivos em espaços culturais é um tema cada vez mais relevante. Muitas instituições comprometidas com a acessibilidade contam com intérpretes para atender pessoas com deficiência auditiva. No entanto, nem sempre é possível garantir a presença constante desses profissionais, o que pode reduzir a autonomia dos visitantes.",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "\n\n",
                      style: GoogleFonts.spaceMono(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    const TextSpan(
                      text:
                          "O LIBRAS CODE foi desenvolvido para resolver essa questão, proporcionando uma solução prática e eficiente. Este aplicativo permite que visitantes surdos apreciem as obras em exposição de forma independente. Ao escanear um QR Code, o usuário pode assistir a vídeos de intérpretes traduzindo as informações das obras para a Língua Brasileira de Sinais (Libras). O LIBRAS CODE, busca oferecer uma experiência inclusiva e autônoma para todos os visitantes.",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
