import 'package:flutter/material.dart';

class LoadingStateView extends StatelessWidget {
  const LoadingStateView({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 4,
        ),
        LinearProgressIndicator(
          backgroundColor: themeData.colorScheme.onPrimary,
          valueColor: AlwaysStoppedAnimation(themeData.colorScheme.primary),
          minHeight: 2,
        )
      ],
    );
  }
}
