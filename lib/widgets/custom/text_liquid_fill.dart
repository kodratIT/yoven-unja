/*
* File : Text Liquid Fill
* Version : 1.0.0
* */

import 'dart:math';

import 'package:yoven/helpers/widgets/my_text.dart';
import 'package:yoven/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TextLiquidFill extends StatefulWidget {
  final TextStyle? textStyle;
  final Duration? loadDuration;
  final Duration? waveDuration;
  final double? boxHeight;
  final double? boxWidth;
  final String text;
  final Color? boxBackgroundColor;
  final Color? waveColor;

  TextLiquidFill(
      {Key? key,
      required this.text,
      this.textStyle,
      this.loadDuration,
      this.waveDuration,
      this.boxHeight,
      this.boxWidth,
      this.boxBackgroundColor,
      this.waveColor})
      : super(key: key);

  @override
  _TextLiquidFillState createState() => _TextLiquidFillState();
}

class _TextLiquidFillState extends State<TextLiquidFill>
    with TickerProviderStateMixin {
  AnimationController? _waveController, _loadController;
  Duration? _waveDuration, _loadDuration;

  late Animation _loadValue;

  double? _boxHeight, _boxWidth;

  Color? _boxBackgroundColor, _waveColor;

  GlobalKey<State<StatefulWidget>>? _textKey;

  @override
  void initState() {
    super.initState();

    _textKey = GlobalKey();

    _boxHeight = widget.boxHeight ?? 180;

    _boxWidth = widget.boxWidth ?? 400;

    _waveDuration = widget.waveDuration ?? Duration(milliseconds: 1000);

    _loadDuration = widget.loadDuration ?? Duration(milliseconds: 10000);

    _waveController = AnimationController(vsync: this, duration: _waveDuration);

    _loadController = AnimationController(vsync: this, duration: _loadDuration);

    _loadValue =
        Tween<double>(begin: 0.0, end: 100.0).animate(_loadController!);

    _boxBackgroundColor = widget.boxBackgroundColor ?? Colors.black;
    _waveColor = widget.waveColor ?? Colors.blueAccent;

    _waveController!.repeat();
    _loadController!.forward();

    _loadController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _loadController!.repeat();
      }
    });
  }

  @override
  void dispose() {
    _waveController?.dispose();
    _loadController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      tag: 'text_liquid_fill',
      builder: (controller) {
        return Stack(
          children: <Widget>[
            SizedBox(
              height: _boxHeight,
              width: _boxWidth ?? MediaQuery.of(context).size.width,
              child: AnimatedBuilder(
                animation: _waveController!,
                builder: (BuildContext context, Widget? child) {
                  return CustomPaint(
                    painter: WavePainter(
                        waveAnimation: _waveController,
                        percentValue: _loadValue.value,
                        boxHeight: _boxHeight,
                        waveColor: _waveColor,
                        textKey: _textKey),
                  );
                },
              ),
            ),
            SizedBox(
              height: _boxHeight,
              width: _boxWidth ?? MediaQuery.of(context).size.width,
              child: ShaderMask(
                blendMode: BlendMode.srcOut,
                shaderCallback: (bounds) => LinearGradient(
                    colors: [_boxBackgroundColor!],
                    stops: const [0.0]).createShader(bounds),
                child: Container(
                  color: Colors.transparent,
                  child: Center(
                    child: MyText(
                      widget.text,
                      key: _textKey,
                      style: MyTextStyle.bodySmall(
                        fontSize: 84,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class WavePainter extends CustomPainter {
  Animation<double>? waveAnimation;
  double? percentValue;
  double? boxHeight;
  Color? waveColor;
  GlobalKey<State<StatefulWidget>>? textKey;

  WavePainter(
      {this.waveAnimation,
      this.percentValue,
      this.boxHeight,
      this.waveColor,
      this.textKey});

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    Paint wavePaint = Paint()..color = waveColor!;

    RenderBox textBox =
        textKey!.currentContext!.findRenderObject() as RenderBox;

    double textHeight = textBox.size.height;

    double percent = percentValue! / 100.0;
    double baseHeight =
        (boxHeight! / 2) + (textHeight / 2) - (percent * textHeight);

    Path path = Path();
    path.moveTo(0.0, baseHeight);
    for (double i = 0.0; i < width; i++) {
      path.lineTo(
          i,
          baseHeight +
              sin((i / width * 2 * pi) + (waveAnimation!.value * 2 * pi)) * 8);
    }

    path.lineTo(width, height);
    path.lineTo(0.0, height);
    path.close();
    canvas.drawPath(path, wavePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
