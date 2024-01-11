import 'package:flutter/material.dart';

class BottomAppBarComponent extends StatelessWidget {
  const BottomAppBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.blueAccent[200],
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            const Spacer(),
            IconButton(
              onPressed: () => {},
              icon: const Icon(
                Icons.history,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () => {},
              icon: const Icon(
                Icons.settings,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
