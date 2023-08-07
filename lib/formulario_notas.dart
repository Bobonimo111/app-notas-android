import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'copy_button.dart';
import 'lista_controller.dart';

class formulario_notas extends StatelessWidget {
  const formulario_notas({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => lista_controller(),
      child: Scaffold(
          appBar: AppBar(),
          floatingActionButton: copy_Button(),
          body: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 30.00, vertical: 30.00),
            child: Expanded(
                child: ListView(
              children: const [
                campo(
                  name: "ponto/nome",
                  type: TextInputType.text,
                ),
                campo(
                  name: "dinheiro",
                  type: TextInputType.number,
                ),
              ],
            )),
          )),
    );
  }
}

class campo extends StatefulWidget {
  final String? name;
  final TextInputType type;
  const campo({super.key, this.name, required this.type});

  @override
  State<campo> createState() => _campoState();
}

class _campoState extends State<campo> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final String text = _controller.text;
      _controller.value = _controller.value.copyWith(
          text: text,
          composing: TextRange.empty,
          selection: TextSelection(
              baseOffset: text.length, extentOffset: text.length));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: TextField(
          keyboardType: widget.type,
          controller: _controller,
          onChanged: (value) => {},
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: widget.name,
              suffix: IconButton(
                  onPressed: () {
                    _controller.text = "";
                  },
                  icon: const Icon(Icons.clear_sharp)))),
    );
  }
}
