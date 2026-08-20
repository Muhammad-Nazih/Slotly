import 'package:flutter/material.dart';
import 'package:new47version/core/consts.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final Color? borderColor;
  final IconData? icon;
  final String label;
  final FontWeight? fontWeight;
  final double? fontSize;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.label,
    required this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.borderColor,
    this.icon,
    this.fontWeight,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor ?? Colors.black),
          ),
          height: 60,
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, color: iconColor, size: 22),
                const SizedBox(width: 6),
              ],
              Text(
                label,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize ?? 20,
                  fontWeight: fontWeight ?? FontWeight.w700,
                  fontFamily: arabicFontFamily,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
