import 'package:driving_time_log/resources/colors.dart';
import 'package:driving_time_log/resources/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  final String text;
  final String icon;
  final Color color;
  final Function()? onTap;
  final bool center;
  final bool selected;

  const ButtonWithIcon({
    Key? key,
    required this.text,
    required this.icon,
    required this.color,
    this.onTap,
    this.center = false,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 150.0,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: selected ? color : accent,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: !center ? MainAxisAlignment.start : MainAxisAlignment.center,
            children: [
              SvgIcon(
                assetName: icon,
                size: 40,
                color: !selected ? color : white,
              ),
              const SizedBox(width: 10),
              Text(text, style: theme.bodyText1),
            ],
          ),
        ),
      ),
    );
  }
}
