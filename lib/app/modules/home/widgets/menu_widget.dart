import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

enum _MenuOptions { feedback, about, privacyPolicy }

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_MenuOptions>(
      onSelected: (value) async {
        switch (value) {
          case _MenuOptions.feedback:
            Modular.to.pushNamed('feedback');
            break;
          case _MenuOptions.about:
            Modular.to.pushNamed('about');
            break;
          case _MenuOptions.privacyPolicy:
            Modular.to.pushNamed('privacy-policy');
            break;
        }
      },
      icon: const Icon(
        Icons.more_vert_rounded,
        color: Colors.black,
      ),
      itemBuilder: (context) => [
        const PopupMenuItem<_MenuOptions>(
          value: _MenuOptions.feedback,
          child: Text('Feedback'),
        ),
        const PopupMenuItem<_MenuOptions>(
          value: _MenuOptions.about,
          child: Text('Sobre'),
        ),
        const PopupMenuItem<_MenuOptions>(
          value: _MenuOptions.privacyPolicy,
          child: Text('Politica de privacidade'),
        ),
      ],
    );
  }
}
