import 'package:flutter/material.dart';

class ProgressHud extends StatelessWidget {
  const ProgressHud({
    super.key,
    bool isTransparent = false,
    Color? color,
  })  : _isTransparent = isTransparent,
        _color = color;

  final bool _isTransparent;
  final Color? _color;

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());

    return Stack(
      children: <Widget>[
        Opacity(
          opacity: _isTransparent == true ? 0 : 0.4,
          child: const ModalBarrier(
            dismissible: false,
            color: Colors.black,
          ),
        ),
        Center(
          child: SizedBox(
            width: 70,
            height: 70,
            child: CircularProgressIndicator(
              strokeWidth: 6.5,
              color: _color,
            ),
          ),
        ),
      ],
    );
  }
}
