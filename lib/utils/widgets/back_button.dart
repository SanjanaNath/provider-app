import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constant/gradients.dart';
import '../../core/constant/shadows.dart';
import 'gradient_button.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.icon,
    this.radius,
    this.iconColor,
    this.margin,
    this.iconShadows,
    this.onTap,
    this.showShadow,
    this.iconSize, this.backgroundGradient,
  });

  final IconData? icon;
  final double? radius;
  final double? iconSize;

  final Color? iconColor;
  final bool? showShadow;

  final EdgeInsets? margin;
  final List<BoxShadow>? iconShadows;
  final GestureTapCallback? onTap;
  final Gradient? backgroundGradient;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              if (showShadow == true)
                Container(
                  height: radius ?? 32,
                  width: radius ?? 32,
                  margin: margin ?? EdgeInsets.zero,
                  decoration: BoxDecoration(
                    boxShadow: primaryBoxShadow(),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              GradientButton(
                borderWidth: 1.2,
                height: radius ?? 35,
                width: radius ?? 35,
                borderRadius: radius ?? 35,
                backgroundGradient: backgroundGradient ?? primaryGradient,
                gradient: greyGradient,
                onTap: onTap ??
                    () {
                      context.pop();
                    },
                child: Center(
                    child: Icon(
                  icon ?? Icons.arrow_back_ios_rounded,
                  color: iconColor ?? Colors.white,
                  size: iconSize ?? 18,
                  shadows: iconShadows ?? [],
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
