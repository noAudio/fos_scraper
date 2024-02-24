import 'package:flutter/widgets.dart';

class Screen extends StatelessWidget {
  final String heading;
  final Widget child;
  const Screen({super.key, required this.heading, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(heading),
          child,
        ],
      ),
    );
  }
}
