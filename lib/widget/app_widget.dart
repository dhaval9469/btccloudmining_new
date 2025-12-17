import 'package:btccloudmining/theme/colors.dart';
import 'package:btccloudmining/theme/textstyles.dart';
import 'package:btccloudmining/utils/app_navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

Widget cardLayout({required Widget child}) {
  return Container(
    decoration: BoxDecoration(
      color: Color(0xff242C3B),
      border: const Border(top: BorderSide(color: Color(0xff37B6E9), width: 2)),
      borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      child: child,
    ),
  );
}

Widget customHeader(BuildContext context, String text, {GestureTapCallback? onBack}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(
        onTap: onBack ?? () => Navigation.pop(),
        child: FaIcon(FontAwesomeIcons.arrowLeftLong, color: AppColor.text),
      ),
      Text(text, style: textMontserrat(context, fontSize: 17, fontWeight: FontWeight.w600)),
      FaIcon(FontAwesomeIcons.arrowLeftLong, color: Colors.transparent),
    ],
  ).p(15);
}

class SlideFadeTransition extends StatelessWidget {
  final Widget child;
  final int index;

  const SlideFadeTransition({super.key, required this.child, required this.index});

  @override
  Widget build(BuildContext context) {
    final int delay = index * 100;

    return FutureBuilder(
      future: Future.delayed(Duration(milliseconds: delay)),
      builder: (context, snapshot) {
        return TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: snapshot.connectionState == ConnectionState.done ? 1.0 : 0.0),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutQuart,
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(offset: Offset(0, 20 * (1 - value)), child: child),
            );
          },
          child: child,
        );
      },
    );
  }
}

/*class SlideFadeTransition extends StatelessWidget {
  final Widget child;

  const SlideFadeTransition({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutQuart,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(offset: Offset(0, 20 * (1 - value)), child: child),
        );
      },
      child: child,
    );
  }
}*/
