import 'package:flutter/material.dart';

class SpinningLoading extends StatelessWidget {
  const SpinningLoading({
    super.key,
    this.opacity = 0.5,
    this.dismissibles = false,
    this.color = Colors.black,
  });

  final double opacity;
  final bool dismissibles;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: opacity,
          child: const ModalBarrier(dismissible: false, color: Colors.black),
        ),
        Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 10),
              child: const CircularProgressIndicator(),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
                "Loading...",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        )),
      ],
    );
  }
}
