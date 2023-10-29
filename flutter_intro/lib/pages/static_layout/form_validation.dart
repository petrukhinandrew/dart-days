import 'package:flutter/material.dart';

class FormValidation extends StatefulWidget {
  const FormValidation({super.key});

  @override
  State<FormValidation> createState() => _FormValidationState();
}

class Order {
  String item;
  int qty;
  Order(this.item, this.qty);
  Order.empty()
      : item = "",
        qty = 0;
}

class _FormValidationState extends State<FormValidation> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  final Order _order = Order.empty();

  String? _validateItemRequired(String item) =>
      item.isEmpty ? "Item required" : null;

  String? _validateItemQty(String qty) {
    final int? _nonEmpty = qty.isEmpty ? null : int.tryParse(qty);
    return (_nonEmpty == null || _nonEmpty < 0) ? "Qty must be > 0" : null;
  }

  void _submitOrder() {
    print(_formStateKey.currentState!.validate());
    if (_formStateKey.currentState != null &&
        _formStateKey.currentState!.validate()) {
      _formStateKey.currentState!.save();
      print("Item: ${_order.item}");
      print("Qty: ${_order.qty}");
    }
  }

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Form(
              key: _formStateKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Espresso", labelText: "Item"),
                      validator: (value) => _validateItemRequired(value ?? ""),
                      onSaved: (value) {
                        _order.item = value ?? "";
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "100500", labelText: "Qty"),
                      validator: (value) => _validateItemQty(value ?? ""),
                      onSaved: (value) {
                        _order.qty = int.tryParse(value ?? "") ?? 0;
                        print("new qty is ${_order.qty}");
                      },
                    ),
                    const Divider(),
                    ElevatedButton(
                      onPressed: () {
                        _submitOrder();
                        print("Pressed");
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.hovered))
                            return Colors.lightBlue.shade100;
                          if (states.contains(MaterialState.focused))
                            return Colors.lightGreen.shade200;
                          return Colors.amber.shade300;
                        }),
                      ),
                      child: const Text("Save"),
                    ),
                  ],
                ),
              ))
        ],
      );
}
