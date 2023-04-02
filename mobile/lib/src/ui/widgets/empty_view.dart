import 'package:djepe/src/ui/theme/color.dart';
import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          child: Image.asset("assets/images/empty.png"),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Aucun résultat pour votre recherche',
          style: TextStyle(color: primary),
        ),
      ],
    );
  }
}