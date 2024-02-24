import 'package:flutter/widgets.dart';

class Section extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const Section({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        ...children,
      ],
    );
  }
}
