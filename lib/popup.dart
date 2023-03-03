import 'package:flutter/material.dart';

class PopUpSuccess extends StatefulWidget {
  const PopUpSuccess({Key? key}) : super(key: key);

  @override
  State<PopUpSuccess> createState() => _PopUpSuccessState();
}

class _PopUpSuccessState extends State<PopUpSuccess> {
  ValueNotifier<dynamic> result = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return success();
  }

  Widget success() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        SizedBox(
          height: 10,
        ),
        Text(
          "Vous pouvez récupérer votre article !",
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
