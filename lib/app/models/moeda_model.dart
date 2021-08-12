class MoedaModel {
  late String nome;
  late double real;
  late double dolar;
  late double euro;
  late double bitcoin;

  MoedaModel(
      {required this.nome,
      required this.real,
      required this.dolar,
      required this.euro,
      required this.bitcoin});

  static List<MoedaModel> getMoedas() {
    return <MoedaModel>[
      MoedaModel(
          nome: 'Real', real: 1.0, dolar: 0.18, euro: 0.15, bitcoin: 0.000016),
      MoedaModel(
          nome: 'Dólar', real: 5.63, dolar: 1.0, euro: 0.85, bitcoin: 0.000088),
      MoedaModel(
          nome: 'Euro', real: 6.62, dolar: 1.17, euro: 1.0, bitcoin: 0.00010),
      MoedaModel(
          nome: 'Bitcoin',
          real: 64116.51,
          dolar: 11351.30,
          euro: 9689.34,
          bitcoin: 1.0),
    ];
  }
}
