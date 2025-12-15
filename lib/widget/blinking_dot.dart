import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/app_navigation/navigation.dart';

class BlinkingGreenDot extends StatefulWidget {
  const BlinkingGreenDot({super.key});

  @override
  BlinkingGreenDotState createState() => BlinkingGreenDotState();
}

class BlinkingGreenDotState extends State<BlinkingGreenDot> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 1000), vsync: this)
      ..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.2, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        width: 7,
        height: 7,
        decoration: BoxDecoration(
          color: Color(0xFF16B785),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class CustomCard extends StatefulWidget {
  final Widget? child;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final Gradient? gradient;

  const CustomCard({super.key, this.child, this.color, this.borderRadius, this.gradient});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.color ?? AppColor.newCard,
        borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
        gradient: widget.gradient,
      ),
      child: widget.child,
    );
  }
}

class AppButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String? text;
  final bool? isRoboto;
  final Color? color;
  final Color? textColor;
  final BoxBorder? border;
  final double? width;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  const AppButton({
    super.key,
    this.onTap,
    this.text,
    this.isRoboto = true,
    this.color,
    this.border,
    this.textColor,
    this.width,
    this.padding,
    this.fontSize,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: color, border: border, borderRadius: BorderRadius.circular(8)),
        child:
            child ??
            Padding(
              padding: padding ?? EdgeInsets.symmetric(vertical: 4),
              child: Text(
                text ?? '',
                style: isRoboto == true
                    ? textRoboto(
                        context,
                        color: textColor ?? AppColor.white,
                        fontSize: fontSize ?? 16,
                        fontWeight: FontWeight.bold,
                      )
                    : textMontserrat(
                        context,
                        color: textColor ?? AppColor.white,
                        fontSize: fontSize ?? 16,
                        fontWeight: FontWeight.bold,
                      ),
              ),
            ),
      ),
    );
  }
}

AppBar buildCustomAppBar(
  BuildContext context, {
  String? title,
  double? toolbarHeight,
  List<Widget>? actions,
  VoidCallback? onBack,
  bool showFullAppBar = true,
  bool leadingIcon = true,
  bool isNonBack = false,
  Widget? child,
}) {
  if (!showFullAppBar) {
    return AppBar(backgroundColor: AppColor.newCard, elevation: 0, toolbarHeight: 0);
  }
  return isNonBack
      ? AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          toolbarHeight: toolbarHeight ?? 47,
          centerTitle: true,
          backgroundColor: AppColor.newCard,
          title: Text(
            title ?? "",
            style: textRoboto(context, fontSize: 18, fontWeight: FontWeight.w600, color: AppColor.white),
          ),
          actions: actions,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: child ?? Divider(color: Colors.white, height: 0, thickness: 0.1),
          ),
        )
      : AppBar(
          elevation: 0,
          toolbarHeight: toolbarHeight ?? 47,
          centerTitle: true,
          backgroundColor: AppColor.newCard,
          leading: leadingIcon
              ? IconButton(
                  icon: Icon(FontAwesomeIcons.arrowLeftLong, color: AppColor.white),
                  onPressed: onBack ?? () => Navigation.pop(),
                )
              : SizedBox.shrink(),
          title: Text(
            title ?? "",
            style: textRoboto(context, fontSize: 18, fontWeight: FontWeight.w600, color: AppColor.white),
          ),
          actions: actions,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(color: Colors.white, height: 0, thickness: 0.1),
          ),
        );
}

class EdgeToEdgeWrapper extends StatelessWidget {
  final Widget child;
  final int sdkInt;

  const EdgeToEdgeWrapper({super.key, required this.child, required this.sdkInt});

  @override
  Widget build(BuildContext context) {
    final isAndroid15OrHigher = sdkInt >= 35;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isAndroid15OrHigher
          ? SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarIconBrightness: Brightness.light,
            )
          : SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: Colors.black,
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarIconBrightness: Brightness.light,
            ),
      child: child,
    );
  }
}

class NoData extends StatelessWidget {
  final String? text;
  final double? top;
  final bool? isCenter;

  const NoData({super.key, this.text = '', this.top = 0.0, this.isCenter = false});

  @override
  Widget build(BuildContext context) {
    return isCenter == true
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAsset.history, scale: 7, color: AppColor.subText),
              10.heightBox,
              Text(text ?? "", textAlign: TextAlign.center, style: subTextRoboto(context, fontSize: 13)),
            ],
          ).px(15)
        : Padding(
            padding: EdgeInsets.only(top: top ?? 50),
            child: Column(
              children: [
                Image.asset(AppAsset.history, scale: 8, color: AppColor.subText),
                10.heightBox,
                Text(
                  text ?? "",
                  textAlign: TextAlign.center,
                  style: subTextRoboto(context, fontSize: 13),
                ),
              ],
            ),
          ).px(15);
  }
}
