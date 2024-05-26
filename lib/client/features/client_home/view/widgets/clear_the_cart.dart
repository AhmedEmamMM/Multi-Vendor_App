import 'package:flutter/material.dart';

class ClearTheCart extends StatelessWidget {
  final void Function()? yesButtonOnPressed;
  const ClearTheCart({
    super.key,
    this.yesButtonOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Are you sure you want to clear the cart?"),
              actions: [
                //cancel button
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel")),

                // yes button
                TextButton(
                  onPressed: yesButtonOnPressed,
                  child: const Text("Yes"),
                )
              ],
            ),
          );
        },
        icon: Icon(Icons.delete_forever, size: 35, color: Colors.red.shade800));
  }
}
