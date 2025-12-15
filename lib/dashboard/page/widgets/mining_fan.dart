import 'package:btccloudmining/theme/asset.dart';
import 'package:btccloudmining/theme/colors.dart';
import 'package:flutter/material.dart';

class MiningFan extends StatefulWidget {
  final bool isMining;

  const MiningFan({super.key, required this.isMining});

  @override
  MiningFanState createState() => MiningFanState();
}

class MiningFanState extends State<MiningFan> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    if (widget.isMining) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(MiningFan oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isMining) {
      _controller.repeat();
    } else {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppAsset.fanBody, width: 70, height: 70),
        RotationTransition(
          turns: Tween<double>(begin: 0, end: 1).animate(_controller),
          child: Image.asset(AppAsset.fan, width: 70, height: 70, color: AppColor.white),
        ),
      ],
    );
  }
}
