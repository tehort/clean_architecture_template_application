import 'package:flutter/material.dart';

class ProgressHud extends StatelessWidget {
  const ProgressHud({super.key, this.isTransparent = false});

  final bool isTransparent;

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());

    return Stack(
      children: <Widget>[
        Opacity(
          opacity: isTransparent == true ? 0 : 0.4,
          child: const ModalBarrier(
            dismissible: false,
            color: Colors.black,
          ),
        ),
        const Center(
          child: SizedBox(
            width: 70,
            height: 70,
            child: CircularProgressIndicator(
              strokeWidth: 6.5,
            ),
          ),
        ),
      ],
    );
  }
}
