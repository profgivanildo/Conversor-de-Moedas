import 'package:conversor_moedas/app/models/moeda_model.dart';
import 'package:flutter/material.dart';

class MoedaBox extends StatelessWidget {
  final bool enabledTF;
  final List<MoedaModel> items;
  final MoedaModel? selectedItem;
  final TextEditingController controller;
  final void Function(MoedaModel?) onChanged;

  const MoedaBox(
      {required this.items,
      required this.controller,
      required this.onChanged,
      this.selectedItem,
      required this.enabledTF});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: SizedBox(
              height: 56,
              child: DropdownButton<MoedaModel>(
                value: selectedItem,
                iconEnabledColor: Colors.indigo,
                iconDisabledColor: Colors.indigo,
                iconSize: 30,
                style: TextStyle(fontSize: 20),
                isExpanded: true,
                underline: Container(
                  height: 1,
                  color: Colors.indigo,
                ),
                items: items
                    .map<DropdownMenuItem<MoedaModel>>(
                        (e) => DropdownMenuItem(value: e, child: Text(e.nome)))
                    .toList(),
                onChanged: onChanged,
              ),
            )),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: TextField(
              enabled: enabledTF,
              style: TextStyle(fontSize: 20),
              controller: controller,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo)),
              )),
        ),
      ],
    );
  }
}
