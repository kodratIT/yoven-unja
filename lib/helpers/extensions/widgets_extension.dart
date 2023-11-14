import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

extension IconExtension on Icon {
  Icon autoDirection() {
    if (AppTheme.textDirection == TextDirection.ltr) return this;
    if (icon == LucideIcons.chevronRight) {
      return Icon(
        LucideIcons.chevronLeft,
        color: color,
        textDirection: textDirection,
        size: size,
        key: key,
        semanticLabel: semanticLabel,
      );
    } else if (icon == LucideIcons.chevronLeft) {
      return Icon(
        LucideIcons.chevronRight,
        color: color,
        textDirection: textDirection,
        size: size,
        key: key,
        semanticLabel: semanticLabel,
      );
    } else if (icon == LucideIcons.chevronLeft) {
      return Icon(
        LucideIcons.chevronRight,
        color: color,
        textDirection: textDirection,
        size: size,
        key: key,
        semanticLabel: semanticLabel,
      );
    } else if (icon == LucideIcons.chevronRight) {
      return Icon(
        LucideIcons.chevronLeft,
        color: color,
        textDirection: textDirection,
        size: size,
        key: key,
        semanticLabel: semanticLabel,
      );
    }
    return this;
  }
}
