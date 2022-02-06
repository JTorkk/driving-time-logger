import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String? assetName;
  final double? size;
  final Color? color;
  final bool overrideColor;
  const SvgIcon({
    Key? key,
    required this.assetName,
    this.size,
    this.color,
    this.overrideColor = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context);
    final iconColor = color ?? iconTheme.color;
    return SvgPicture.asset(
      assetName!,
      color: overrideColor ? iconColor : null,
      width: size,
      height: size,
    );
  }
}
