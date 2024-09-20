import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  // Estilos de texto para reutilização
  TextStyle get titleStyle => const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      );

  TextStyle get sectionTitleStyle => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      );

  TextStyle get contentStyle => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      );

  TextStyle get listItemStyle => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Política de Privacidade",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Política de Privacidade", style: titleStyle),
            const SizedBox(height: 20),
            Text(
              "A sua privacidade é importante para nós. Esta Política de Privacidade descreve como o aplicativo LibrasCode coleta, usa e protege as informações dos usuários. Ao utilizar o aplicativo, você concorda com os termos desta política.",
              style: contentStyle,
            ),
            const SizedBox(height: 20),
            _buildSectionTitle("1. Coleta de Informações"),
            _buildSubSectionTitle("1.1 Informações Pessoais"),
            Text(
              "O LibrasCode não coleta informações pessoais identificáveis dos usuários, como nome, endereço de e-mail ou número de telefone.",
              style: contentStyle,
            ),
            _buildSubSectionTitle("1.2 Informações Não Pessoais"),
            Text(
              "Podemos coletar informações não pessoais sobre o uso do aplicativo para melhorar a experiência do usuário, tais como dados estatísticos anônimos.",
              style: contentStyle,
            ),
            _buildSectionTitle("2. Uso da Câmera"),
            Text(
              "O aplicativo solicita acesso à câmera do dispositivo para permitir a leitura de códigos QR associados às obras em exposição. A câmera é utilizada exclusivamente para essa finalidade.",
              style: contentStyle,
            ),
            const SizedBox(height: 10),
            _buildBulletPoint(
                "Nenhuma imagem ou vídeo é armazenado ou transmitido pelo aplicativo."),
            _buildBulletPoint(
                "O acesso à câmera pode ser desativado a qualquer momento nas configurações do dispositivo, mas isso pode limitar a funcionalidade do aplicativo."),
            _buildSectionTitle("3. Compartilhamento de Informações"),
            Text(
              "O LibrasCode não compartilha quaisquer informações dos usuários com terceiros. Como não coletamos informações pessoais, não há dados a serem divulgados ou vendidos.",
              style: contentStyle,
            ),
            _buildSectionTitle("4. Segurança"),
            Text(
              "Empregamos medidas de segurança adequadas para proteger o aplicativo contra acessos não autorizados ou alterações que possam comprometer a integridade dos dados.",
              style: contentStyle,
            ),
            _buildSectionTitle("5. Links para Sites de Terceiros"),
            Text(
              "O aplicativo pode conter links para sites externos que não são operados por nós. Recomendamos que você revise a política de privacidade de cada site que visitar, pois não temos controle sobre o conteúdo e práticas de sites de terceiros.",
              style: contentStyle,
            ),
            _buildSectionTitle("6. Privacidade de Crianças"),
            Text(
              "O LibrasCode não se destina a menores de 13 anos. Não coletamos intencionalmente informações pessoais de crianças. Se você é pai ou responsável e acredita que seu filho nos forneceu informações pessoais, entre em contato conosco.",
              style: contentStyle,
            ),
            _buildSectionTitle("7. Alterações nesta Política"),
            Text(
              "Podemos atualizar nossa Política de Privacidade periodicamente. Notificaremos você sobre quaisquer alterações publicando a nova política nesta página. Recomenda-se que você reveja esta política regularmente para se manter informado.",
              style: contentStyle,
            ),
            _buildSectionTitle("8. Consentimento"),
            Text(
              "Ao utilizar o LibrasCode, você concorda com a nossa Política de Privacidade e seus termos.",
              style: contentStyle,
            ),
            _buildSectionTitle("9. Contato"),
            Text(
              "Se você tiver alguma dúvida ou sugestão sobre nossa Política de Privacidade, não hesite em nos contatar:",
              style: contentStyle,
            ),
            const SizedBox(height: 10),
            _buildBulletPoint("E-mail: contato@librascode.com"),
            _buildBulletPoint("Site: www.librascode.com"),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Data de vigência: 17 de setembro de 2024",
                style: contentStyle.copyWith(fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 10),
      child: Text(
        title,
        style: sectionTitleStyle,
      ),
    );
  }

  Widget _buildSubSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 5),
      child: Text(
        title,
        style: contentStyle.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "• ",
            style: TextStyle(fontSize: 18),
          ),
          Expanded(
            child: Text(
              text,
              style: listItemStyle,
            ),
          ),
        ],
      ),
    );
  }
}
