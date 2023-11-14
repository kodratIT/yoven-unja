import 'dart:ui';

import 'package:yoven/helpers/theme/app_theme.dart';
import 'package:yoven/helpers/theme/theme_type.dart';

@Deprecated('message')
class MaterialTheme {
  static MaterialThemeData materialThemeData =
      AppTheme.themeType == ThemeType.light
          ? MaterialThemeData().light()
          : MaterialThemeData().dark();

  static MaterialThemeData learningLightTheme = MaterialThemeData()
      .light()
      .copyWith(
          primary: const Color(0xff6874E8),
          onPrimary: const Color(0xffffffff),
          primaryContainer: const Color(0xffe9eafd),
          onPrimaryContainer: const Color(0xff2033e7),
          secondary: const Color(0xff548c2f),
          onSecondary: const Color(0xffffffff),
          secondaryContainer: const Color(0xffdef0d1),
          onSecondaryContainer: const Color(0xff131F0a));

  static MaterialThemeData learningDarkTheme = MaterialThemeData()
      .dark()
      .copyWith(
          primary: const Color(0xffcfd2ff),
          onPrimary: const Color(0xff1529e8),
          primaryContainer: const Color(0xff5563e8),
          onPrimaryContainer: const Color(0xffe6e7fd),
          secondary: const Color(0xffd3ebc1),
          onSecondary: const Color(0xff253e14),
          secondaryContainer: const Color(0xff4B7b28),
          onSecondaryContainer: const Color(0xffe9f5e0));

  static MaterialThemeData learningTheme = AppTheme.themeType == ThemeType.light
      ? learningLightTheme
      : learningDarkTheme;

  static MaterialThemeData cookifyLightTheme = MaterialThemeData()
      .light()
      .copyWith(
          primary: const Color(0xffdf7463),
          onPrimary: const Color(0xffffffff),
          primaryContainer: const Color(0xfffdeeea),
          onPrimaryContainer: const Color(0xffe73a1f),
          secondary: const Color(0xff5e3f22),
          onSecondary: const Color(0xffffffff),
          secondaryContainer: const Color(0xffe7bc91),
          onSecondaryContainer: const Color(0xff462601));

  static MaterialThemeData cookifyDarkTheme =
      MaterialThemeData().dark().copyWith(
            primary: const Color(0xfffcccc5),
            onPrimary: const Color(0xffec371a),
            primaryContainer: const Color(0xffec6d5a),
            onPrimaryContainer: const Color(0xffffeeec),
            secondary: const Color(0xfffcc18e),
            onSecondary: const Color(0xff381f01),
            secondaryContainer: const Color(0xff54381e),
            onSecondaryContainer: const Color(0xffe7cbae),
          );

  static MaterialThemeData cookifyTheme = AppTheme.themeType == ThemeType.light
      ? cookifyLightTheme
      : cookifyDarkTheme;

  static MaterialThemeData datingLightTheme = MaterialThemeData()
      .light()
      .copyWith(
          primary: const Color(0xffB428C3),
          onPrimary: const Color(0xffffffff),
          primaryContainer: const Color(0xfffadcfd),
          onPrimaryContainer: const Color(0xff770983),
          secondary: const Color(0xfff15f5f),
          onSecondary: const Color(0xffffffff),
          secondaryContainer: const Color(0xfffcd8d8),
          onSecondaryContainer: const Color(0xffea2929));

  static MaterialThemeData datingDarkTheme =
      MaterialThemeData().dark().copyWith(
            primary: const Color(0xfff1b0f8),
            onPrimary: const Color(0xff9614a4),
            primaryContainer: const Color(0xffde4cef),
            onPrimaryContainer: const Color(0xfff8d8fd),
            secondary: const Color(0xfff88686),
            onSecondary: const Color(0xff8f1313),
            secondaryContainer: const Color(0xffec3535),
            onSecondaryContainer: const Color(0xfff6cdcd),
          );

  static MaterialThemeData datingTheme = AppTheme.themeType == ThemeType.light
      ? datingLightTheme
      : datingDarkTheme;

  static MaterialThemeData estateLightTheme = MaterialThemeData()
      .light()
      .copyWith(
          primary: const Color(0xff1c8c8c),
          onPrimary: const Color(0xffffffff),
          primaryContainer: const Color(0xffdafafa),
          onPrimaryContainer: const Color(0xff025e5e),
          secondary: const Color(0xfff15f5f),
          onSecondary: const Color(0xffffffff),
          secondaryContainer: const Color(0xfff8d6d6),
          onSecondaryContainer: const Color(0xff570202));

  static MaterialThemeData estateDarkTheme = MaterialThemeData()
      .dark()
      .copyWith(
          primary: const Color(0xffcaffff),
          onPrimary: const Color(0xff0b7777),
          primaryContainer: const Color(0xff18a6a6),
          onPrimaryContainer: const Color(0xffe5fdfd),
          secondary: const Color(0xffeea6a6),
          onSecondary: const Color(0xff491818),
          secondaryContainer: const Color(0xff7a2f2f),
          onSecondaryContainer: const Color(0xffefdada));

  static MaterialThemeData estateTheme = AppTheme.themeType == ThemeType.light
      ? estateLightTheme
      : estateDarkTheme;

  static MaterialThemeData shoppingLightTheme = MaterialThemeData()
      .light()
      .copyWith(
          primary: const Color(0xff1c8c8c),
          onPrimary: const Color(0xffffffff),
          primaryContainer: const Color(0xffdafafa),
          onPrimaryContainer: const Color(0xff025e5e),
          secondary: const Color(0xfff15f5f),
          onSecondary: const Color(0xffffffff),
          secondaryContainer: const Color(0xfff8d6d6),
          onSecondaryContainer: const Color(0xff570202));

  static MaterialThemeData shoppingDarkTheme = MaterialThemeData()
      .dark()
      .copyWith(
          primary: const Color(0xffcaffff),
          onPrimary: const Color(0xff0b7777),
          primaryContainer: const Color(0xff18a6a6),
          onPrimaryContainer: const Color(0xffe5fdfd),
          secondary: const Color(0xffeea6a6),
          onSecondary: const Color(0xff491818),
          secondaryContainer: const Color(0xff7a2f2f),
          onSecondaryContainer: const Color(0xffefdada));

  static MaterialThemeData shoppingTheme = AppTheme.themeType == ThemeType.light
      ? shoppingLightTheme
      : shoppingDarkTheme;

  static MaterialThemeData homemadeLightTheme = MaterialThemeData()
      .light()
      .copyWith(
          primary: const Color(0xffc5558e),
          onPrimary: const Color(0xffffffff),
          primaryContainer: const Color(0xfffad2e6),
          onPrimaryContainer: const Color(0xffc21f73),
          secondary: const Color(0xffCC9D60),
          onSecondary: const Color(0xffffffff),
          secondaryContainer: const Color(0xfffce7cf),
          onSecondaryContainer: const Color(0xffc47712));

  static MaterialThemeData homemadeDarkTheme = MaterialThemeData()
      .dark()
      .copyWith(
          primary: const Color(0xfffaafd4),
          onPrimary: const Color(0xffbb2e75),
          primaryContainer: const Color(0xffd95a9b),
          onPrimaryContainer: const Color(0xfffadaea),
          secondary: const Color(0xffecc797),
          onSecondary: const Color(0xff4f3616),
          secondaryContainer: const Color(0xff855b25),
          onSecondaryContainer: const Color(0xfff5e6d6));

  static MaterialThemeData homemadeTheme = AppTheme.themeType == ThemeType.light
      ? homemadeLightTheme
      : homemadeDarkTheme;

  static resetThemeData() {
    materialThemeData = AppTheme.themeType == ThemeType.light
        ? MaterialThemeData().light()
        : MaterialThemeData().dark();

    learningTheme = AppTheme.themeType == ThemeType.light
        ? learningLightTheme
        : learningDarkTheme;

    cookifyTheme = AppTheme.themeType == ThemeType.light
        ? cookifyLightTheme
        : cookifyDarkTheme;

    estateTheme = AppTheme.themeType == ThemeType.light
        ? estateLightTheme
        : estateDarkTheme;

    homemadeTheme = AppTheme.themeType == ThemeType.light
        ? homemadeLightTheme
        : homemadeDarkTheme;

    datingTheme = AppTheme.themeType == ThemeType.light
        ? datingLightTheme
        : datingDarkTheme;
  }
}

class MaterialThemeData {
  late Color primary,
      onPrimary,
      primaryContainer,
      onPrimaryContainer,
      secondary,
      onSecondary,
      secondaryContainer,
      onSecondaryContainer,
      tertiary,
      onTertiary,
      tertiaryContainer,
      onTertiaryContainer,
      error,
      onError,
      errorContainer,
      onErrorContainer,
      background,
      onBackground,
      surface,
      onSurface,
      surfaceVariant,
      onSurfaceVariant,
      outline,
      shimmerBaseColor,
      shimmerHighlightColor,
      card,
      onCard,
      disabled,
      onDisabled,
      border,
      borderDark;

  late MaterialRadius containerRadius, buttonRadius, textFieldRadius;

  MaterialThemeData(
      {this.primary = const Color(0xff6750A4),
      this.onPrimary = const Color(0xffffffff),
      this.primaryContainer = const Color(0xffe8def8),
      this.onPrimaryContainer = const Color(0xff21025E),
      this.secondary = const Color(0xff625b71),
      this.onSecondary = const Color(0xffffffff),
      this.secondaryContainer = const Color(0xffe8def8),
      this.onSecondaryContainer = const Color(0xff000000),
      this.tertiary = const Color(0xff7d5260),
      this.onTertiary = const Color(0xffffffff),
      this.tertiaryContainer = const Color(0xfffbd8e4),
      this.onTertiaryContainer = const Color(0xff370b1e),
      this.error = const Color(0xffb3261e),
      this.onError = const Color(0xffffffff),
      this.errorContainer = const Color(0xfff9dedd),
      this.onErrorContainer = const Color(0xff370b1e),
      this.background = const Color(0xffffffff),
      this.onBackground = const Color(0xff000000),
      this.surface = const Color(0xffffffff),
      this.onSurface = const Color(0xff000000),
      this.surfaceVariant = const Color(0xffe7e0ec),
      this.onSurfaceVariant = const Color(0xff49454e),
      this.outline = const Color(0xff79747f),
      this.shimmerBaseColor = const Color(0xFFF5F5F5),
      this.shimmerHighlightColor = const Color(0xFFE0E0E0),
      this.card = const Color(0xfff0f0f0),
      this.onCard = const Color(0xff495057),
      this.disabled = const Color(0xff495057),
      this.onDisabled = const Color(0xff495057),
      this.border = const Color(0xffeeeeee),
      this.borderDark = const Color(0xffe6e6e6),
      MaterialRadius? containerRadius,
      MaterialRadius? buttonRadius,
      MaterialRadius? textFieldRadius}) {
    this.containerRadius = containerRadius ?? MaterialRadius();
    this.buttonRadius = containerRadius ?? MaterialRadius();
    this.textFieldRadius = containerRadius ?? MaterialRadius();
  }

  MaterialThemeData copyWith(
      {Color? primary,
      Color? onPrimary,
      Color? primaryContainer,
      Color? onPrimaryContainer,
      Color? secondary,
      Color? onSecondary,
      Color? secondaryContainer,
      Color? onSecondaryContainer,
      Color? tertiary,
      Color? onTertiary,
      Color? tertiaryContainer,
      Color? onTertiaryContainer,
      Color? error,
      Color? onError,
      Color? errorContainer,
      Color? onErrorContainer,
      Color? background,
      Color? onBackground,
      Color? surface,
      Color? onSurface,
      Color? surfaceVariant,
      Color? onSurfaceVariant,
      Color? outline,
      Color? shimmerBaseColor,
      Color? shimmerHighlightColor,
      Color? card,
      Color? onCard,
      Color? disabled,
      Color? onDisabled,
      Color? border,
      Color? borderDark,
      MaterialRadius? containerRadius,
      MaterialRadius? buttonRadius,
      MaterialRadius? textFieldRadius}) {
    this.primary = primary ?? this.primary;
    this.onPrimary = onPrimary ?? this.onPrimary;
    this.primaryContainer = primaryContainer ?? this.primaryContainer;
    this.onPrimaryContainer = onPrimaryContainer ?? this.onPrimaryContainer;
    this.secondary = secondary ?? this.secondary;
    this.onSecondary = onSecondary ?? this.onSecondary;
    this.secondaryContainer = secondaryContainer ?? this.secondaryContainer;
    this.onSecondaryContainer =
        onSecondaryContainer ?? this.onSecondaryContainer;
    this.tertiary = tertiary ?? this.tertiary;
    this.onTertiary = onTertiary ?? this.onTertiary;
    this.tertiaryContainer = tertiaryContainer ?? this.tertiaryContainer;
    this.onTertiaryContainer = onTertiaryContainer ?? this.onTertiaryContainer;
    this.error = error ?? this.error;
    this.onError = onError ?? this.onError;
    this.errorContainer = errorContainer ?? this.errorContainer;
    this.onErrorContainer = onErrorContainer ?? this.onErrorContainer;
    this.background = background ?? this.background;
    this.onBackground = onBackground ?? this.onBackground;
    this.surface = surface ?? this.surface;
    this.onSurface = onSurface ?? this.onSurface;
    this.surfaceVariant = surfaceVariant ?? this.surfaceVariant;
    this.onSurfaceVariant = onSurfaceVariant ?? this.onSurfaceVariant;
    this.outline = outline ?? this.outline;
    this.shimmerBaseColor = shimmerBaseColor ?? this.shimmerBaseColor;
    this.shimmerHighlightColor =
        shimmerHighlightColor ?? this.shimmerHighlightColor;
    this.card = card ?? this.card;
    this.onCard = onCard ?? this.onCard;
    this.disabled = disabled ?? this.disabled;
    this.onDisabled = onDisabled ?? this.onDisabled;
    this.containerRadius = containerRadius ?? MaterialRadius();
    this.buttonRadius = containerRadius ?? MaterialRadius();
    this.textFieldRadius = containerRadius ?? MaterialRadius();
    return this;
  }

  MaterialThemeData light() {
    return copyWith();
  }

  MaterialThemeData dark() {
    return copyWith(
        primary: const Color(0xffd0bcff),
        onPrimary: const Color(0xff381e73),
        primaryContainer: const Color(0xff4f378b),
        onPrimaryContainer: const Color(0xffeaddff),
        secondary: const Color(0xffcbc2cb),
        onSecondary: const Color(0xff332d41),
        secondaryContainer: const Color(0xff4a4458),
        onSecondaryContainer: const Color(0xffe8def8),
        tertiary: const Color(0xffefb8c8),
        onTertiary: const Color(0xff4a2532),
        tertiaryContainer: const Color(0xff633b48),
        onTertiaryContainer: const Color(0xfffbd8e4),
        error: const Color(0xfff2b8b5),
        onError: const Color(0xff601411),
        errorContainer: const Color(0xff8c1d19),
        onErrorContainer: const Color(0xfff9dedd),
        background: const Color(0xff000000),
        onBackground: const Color(0xffe6e1e5),
        surface: const Color(0xff000000),
        onSurface: const Color(0xffe6e1e5),
        surfaceVariant: const Color(0xff494550),
        onSurfaceVariant: const Color(0xffcac4d0),
        outline: const Color(0xff948f9a),
        shimmerBaseColor: const Color(0xFF1a1a1a),
        shimmerHighlightColor: const Color(0xFF454545),
        card: const Color(0xff222327),
        onCard: const Color(0xfff3f3f3),
        disabled: const Color(0xff636363),
        onDisabled: const Color(0xffffffff),
        border: const Color(0xff303030),
        borderDark: const Color(0xff363636));
  }
}

class MaterialRadius {
  late double small, medium, large;

  MaterialRadius({this.small = 8, this.medium = 16, this.large = 24});
}
