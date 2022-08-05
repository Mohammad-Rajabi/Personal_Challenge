import 'package:flutter/material.dart';

class FailureOrNoInternetWidget extends StatelessWidget {
  VoidCallback voidCallback;
  String? _title;
  String buttonText;
  Widget? _child;
  ThemeData? themeData;

  FailureOrNoInternetWidget(
      {Key? key,
        required this.voidCallback,
        Widget? child,
        String? title,
        required this.themeData,
        required this.buttonText})
      : _child=child,_title=title,super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _child ?? const SizedBox(),
          const SizedBox(
            height: 8,
          ),
          _title != null ? Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              _title!,
              style: themeData!.textTheme.subtitle1,
            ),
          ): const SizedBox(),
          TextButton(
            onPressed: voidCallback,
            child: Text(
              buttonText,
            ),
          ),
        ],
      ),
    );
  }
}
