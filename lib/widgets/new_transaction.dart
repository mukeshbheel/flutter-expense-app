import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction(@required this.addNewTransaction);

  final void Function(String, String) addNewTransaction;

  void submitForm() {
    if (textController.text.isEmpty ||
        double.parse(amoutController.text) <= 0) {
      return;
    }
    addNewTransaction(textController.text, amoutController.text);
  }

  final textController = TextEditingController();
  final amoutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: textController,
              onSubmitted: (_) => submitForm(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amout'),
              controller: amoutController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitForm(),
            ),
            TextButton(
                onPressed: (() {
                  submitForm();
                }),
                child: Text('Add Transaction'))
          ],
        ),
      ),
    );
  }
}
