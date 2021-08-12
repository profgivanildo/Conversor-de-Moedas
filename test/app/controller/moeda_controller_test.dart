import 'package:conversor_moedas/app/controllers/moeda_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final TextEditingController fromTexto = TextEditingController();
  final TextEditingController toTexto = TextEditingController();
  final moedaController = MoedaController(fromTexto, toTexto);

  test('Deve converter moedas de real para dólar', () {
    fromTexto.text = '1';
    moedaController.converter();
    expect(toTexto.text, '0.18');
  });

  test('Deve converter moedas de real para dólar com virgula', () {
    fromTexto.text = '1,5';
    moedaController.converter();
    expect(toTexto.text, '0.27');
  });
}
