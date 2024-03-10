import 'package:flutter/material.dart';
import 'package:todo_list/util/button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSaved;
  final VoidCallback onCancel;

  const DialogBox(
      {super.key,
      required this.controller,
      required this.onSaved,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      shadowColor: Colors.black45,
      backgroundColor: Colors.yellow[600],
      content: Container(
        padding: const EdgeInsets.all(8),
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide:
                  BorderSide(color: Colors.black, width: 1),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                filled: true,
                fillColor: Colors.yellow[200],
                hintText: "Input task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(text: "Cancel", onPressed: onCancel, btnColor: Colors.black26,),
                const SizedBox(
                  width: 16,
                ),
                Button(text: "Save", onPressed: onSaved, btnColor: Colors.blue,),
              ],
            )
          ],
        ),
      ),

    );
  }
}
