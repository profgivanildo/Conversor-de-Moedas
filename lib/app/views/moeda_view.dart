import 'package:conversor_moedas/app/components/moeda_box.dart';
import 'package:conversor_moedas/app/controllers/moeda_controller.dart';
import 'package:conversor_moedas/app/models/moeda_model.dart';
import 'package:flutter/material.dart';

class MoedaView extends StatefulWidget {
  @override
  _MoedaViewState createState() => _MoedaViewState();
}

class _MoedaViewState extends State<MoedaView> {
  final TextEditingController toTexto = TextEditingController();
  final TextEditingController fromTexto = TextEditingController();
  late MoedaController viewMoedaController;

  @override
  void initState() {
    super.initState();
    viewMoedaController = MoedaController(fromTexto, toTexto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 50, right: 30, bottom: 20, left: 30),
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/logo_conversor.png',
                    width: 180,
                    height: 180,
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  MoedaBox(
                    selectedItem: viewMoedaController.fromMoeda,
                    controller: fromTexto,
                    items: viewMoedaController.moedas,
                    onChanged: (model) {
                      setState(() {
                        viewMoedaController.selectMoedaFrom(model);
                      });
                    },
                    enabledTF: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MoedaBox(
                    selectedItem: viewMoedaController.toMoeda,
                    controller: toTexto,
                    items: viewMoedaController.moedas,
                    onChanged: (model) {
                      setState(() {
                        viewMoedaController.selectMoedaTo(model);
                        viewMoedaController.converter();
                      });
                    },
                    enabledTF: false,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        viewMoedaController.converter();
                      });
                    },
                    child: Text('CONVERTER'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
