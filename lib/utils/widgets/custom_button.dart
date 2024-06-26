import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_setup/core/extensions/normal/build_context_extension.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    this.imagePath,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    required this.onPressed,
    this.textStyle,
    this.margin,
    this.splashColor,
    this.icon,
    this.height,
    this.width,
    this.fontSize,
    this.fontWeight,
    this.imageColor,
    this.splashEffect,
    this.mainAxisAlignment,
    this.trailingImage,
    this.boxShadow,
    this.letterSpacing,
  }) : super(key: key);
  final String text;
  final String? imagePath;
  final String? trailingImage;
  final Icon? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final Color? splashColor;
  final double? borderRadius;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? letterSpacing;
  final FontWeight? fontWeight;
  final Color? imageColor;
  final bool? splashEffect;
  final List<BoxShadow>? boxShadow;

  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.fromLTRB(24, 8, 24, 8),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: splashEffect == true ? null : onPressed,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            boxShadow: boxShadow,
          ),
          child: OutlinedButton(
            style: ButtonStyle(
              overlayColor:
                  MaterialStateProperty.all(splashColor ?? context.colorScheme.primary.withOpacity(0.4)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 11),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(backgroundColor ?? context.colorScheme.primary),
              side: MaterialStateProperty.all(
                BorderSide(
                  color: borderColor ?? context.colorScheme.primary,
                  width: 1.2,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            onPressed: splashEffect == true ? onPressed : null,
            child: Row(
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
              children: [
                if (imagePath != null)
                  SizedBox(
                    height: 22,
                    width: 22,
                    child: Image.asset(
                      '$imagePath',
                      color: imageColor,
                    ),
                  ),
                if (icon != null) icon!,
                Text(
                  text,
                  style: textStyle ??
                      TextStyle(
                        color: textColor ?? Colors.white,
                        fontWeight: fontWeight ?? FontWeight.w600,
                        letterSpacing: letterSpacing,
                        fontSize: fontSize ?? 18,
                      ),
                ),
                if (trailingImage != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: SizedBox(
                      height: 22,
                      width: 22,
                      child: Image.asset(
                        '$trailingImage',
                        color: imageColor,
                      ),
                    ),
                  )
                else
                  const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
