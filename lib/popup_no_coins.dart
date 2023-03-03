import 'package:flutter/material.dart';

class PopUpNoCoins extends StatefulWidget {
  const PopUpNoCoins({Key? key}) : super(key: key);

  @override
  State<PopUpNoCoins> createState() => _PopUpNoCoinsState();
}

class _PopUpNoCoinsState extends State<PopUpNoCoins> {
  ValueNotifier<dynamic> result = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return popup();
  }

  Widget popup() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        SizedBox(
          height: 10,
        ),
        Text(
          "Vous n'avez pas assez de coins",
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
