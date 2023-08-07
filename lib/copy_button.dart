import 'package:flutter/material.dart';
import 'lista_controller.dart';

class copy_Button extends StatefulWidget {
  const copy_Button({super.key});

  @override
  State<copy_Button> createState() => _copy_ButtonState();
}

class _copy_ButtonState extends State<copy_Button> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.copy),
    );
  }
}
