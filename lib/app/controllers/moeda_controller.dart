import 'package:conversor_moedas/app/models/moeda_model.dart';
import 'package:flutter/material.dart';

class MoedaController {
  late List<MoedaModel> moedas;
  late MoedaModel fromMoeda;
  late MoedaModel toMoeda;

  final TextEditingController fromTexto;
  final TextEditingController toTexto;

  MoedaController(this.fromTexto, this.toTexto) {
    moedas = MoedaModel.getMoedas();
    fromMoeda = moedas[0];
    toMoeda = moedas[1];
  }

  selectMoedaFrom(model) {
    fromMoeda = model;
  }

  selectMoedaTo(model) {
    toMoeda = model;
  }

  void converter() {
    String texto = fromTexto.text;
    double value = double.tryParse(texto.replaceAll(',', '.')) ?? 1.0;
    double resultConvert = 0;
    if (toMoeda.nome == 'Real') {
      resultConvert = value * fromMoeda.real;
    } else if (toMoeda.nome == 'Dólar') {
      resultConvert = value * fromMoeda.dolar;
    } else if (toMoeda.nome == 'Euro') {
      resultConvert = value * fromMoeda.euro;
    } else if (toMoeda.nome == 'Bitcoin') {
      resultConvert = value * fromMoeda.bitcoin;
    }

    toTexto.text = resultConvert.toStringAsFixed(2);
  }
}
