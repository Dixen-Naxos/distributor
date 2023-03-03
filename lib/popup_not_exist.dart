import 'package:flutter/material.dart';

class PopUpNotExist extends StatefulWidget {
  const PopUpNotExist({Key? key}) : super(key: key);

  @override
  State<PopUpNotExist> createState() => _PopUpNotExistState();
}

class _PopUpNotExistState extends State<PopUpNotExist> {
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
          "L'article selectionné n'existe pas",
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
