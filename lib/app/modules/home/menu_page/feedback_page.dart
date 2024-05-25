import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({Key? key}) : super(key: key);
  static const iconInstagram = "assets/images/instagram.png";

  Future launchURL(Uri url) async {
    try {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    } catch (error) {
      print(error);
    }
  }

  Future<void> sendEmail(BuildContext context) async {
    final Email email = Email(
      body: '(Escreva aqui)',
      subject: '[LibrasCode]',
      recipients: ['joaocabral1232@gmail.com'],
      isHTML: false,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'Obrigado por nos ajudar!';
    } catch (error) {
      platformResponse = error.toString();
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Feedback",
          style: GoogleFonts.spaceMono(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 14.0, right: 50, top: 14.0),
            child: Text(
              "Adoraria saber como deixar o LibrasCode melhor. Por favor, deixe um comentário na Google Play ou envie um email - Isso vai ser sensacional!",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          const ListTile(
            leading: Icon(Icons.star, color: Colors.black),
            title: Text(
              "Escreva um comentário e deixa sua avaliação",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 18,
            ),
            // onTap: () => LaunchReview.launch(
            //     androidAppId: 'br.com.wtn_project.adenilso'),
          ),
          ListTile(
            leading: const Icon(Icons.email, color: Colors.black),
            title: const Text(
              "Me contate por email",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 18,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const SizedBox(
              height: 30,
              width: 30,
              child: Image(
                image: AssetImage(iconInstagram),
              ),
            ),
            title: const Text(
              "Siga o LibrasCode",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 18,
            ),
            onTap: () =>
                launchURL(Uri.parse("https://instagram.com/juao.cabral")),
          ),
        ],
      ),
    );
  }
}
