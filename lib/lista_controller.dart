import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class lista_controller extends ChangeNotifier {
  List<String> ListItens = ["ponto", "dinheiro"];

  late final String? ponto;
  late final Double? dinheiro;

  copyList() {
    Clipboard.setData(ClipboardData(text: createList()));
  }

  createList() {
    return """
          Ponto/nome : $ponto
          dinheiro :  $dinheiro
    """;
  }

  addItem(item, String type) {
    if (type == ListItens[0]) {
      this.ponto = item;
    }
    if (type == ListItens[1]) {
      this.dinheiro = item;
    }
  }
}
