import 'package:ProGuidance/utils/common_widget/common_widget.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'hole_painter.dart';
import 'staggered_raindrop_animation.dart';

class AnimatedDropLoadingWidget extends StatefulWidget {
  AnimatedDropLoadingWidget({this.color, this.title, this.isShowAvatar});

  final Color color;
  final String title;
  final bool isShowAvatar;

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<AnimatedDropLoadingWidget>
    with SingleTickerProviderStateMixin {
  Size size = Size.zero;
  AnimationController _controller;
  StaggeredRaindropAnimation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    _animation = StaggeredRaindropAnimation(_controller);
    _controller.forward();

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    setState(() {
      size = MediaQuery.of(context).size;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: HolePainter(
            color: widget.color,
            holeSize: _animation.holeSize.value * size.width,
          ),
        ),
      ),
      Positioned(
        top: _animation.dropPosition.value * size.height,
        left: size.width / 2 - _animation.dropSize.value / 2,
        child: SizedBox(
          width: _animation.dropSize.value,
          height: _animation.dropSize.value,
          child: CustomPaint(
            painter: DropPainter(
              visible: _animation.dropVisible.value,
            ),
          ),
        ),
      ),
      showHideAvatar(widget.isShowAvatar),
      Padding(
        padding: EdgeInsets.only(
            bottom: ((MediaQuery.of(context).size.height) / 3.5)),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Opacity(
            opacity: _animation.textOpacity.value,
            child: RichText(
              text: TextSpan(
                text: 'BATTLEGROUNDS',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.white,
                ),
                children: [
                  // TextSpan(
                  //   text: 'UB',
                  //   style: TextStyle(color: Colors.black, fontSize: 18),
                  // ),
                  // TextSpan(
                  //   text: 'G',
                  //   style: TextStyle(color: AppTheme.white, fontSize: 18),
                  // ),
                  TextSpan(
                    text: ' MOBILE Guidance',
                    style: TextStyle(color: AppTheme.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding:
            EdgeInsets.only(bottom: ((MediaQuery.of(context).size.height) / 4)),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Opacity(
            opacity: _animation.textOpacity.value,
            child: RichText(
              text: TextSpan(
                text: 'Developed By :',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.white,
                ),
                children: [
                  TextSpan(
                    text: ' n',
                    style: TextStyle(color: AppTheme.white, fontSize: 12),
                  ),
                  TextSpan(
                    text: 'ir',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  TextSpan(
                    text: 'alaN',
                    style: TextStyle(color: AppTheme.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    ]);
  }

  Widget showHideAvatar(isLoadingAvatar) {
    if (isLoadingAvatar) {
      return Positioned(
        bottom: (MediaQuery.of(context).size.height) / 2.7,
        right: (MediaQuery.of(context).size.width) / 3,
        child: Opacity(
          opacity: _animation.textOpacity.value,
          child: CommonWidget.buildAvatar(
            radius: (MediaQuery.of(context).size.width) / 5,
          ),
        ),
      );
    } else {
      return Padding(padding: EdgeInsets.only(bottom: 0));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class DropPainter extends CustomPainter {
  DropPainter({this.visible = true});

  bool visible;

  @override
  void paint(Canvas canvas, Size size) {
    if (!visible) {
      return;
    }

    Path path = new Path();
    path.moveTo(size.width / 2, 0);
    path.quadraticBezierTo(0, size.height * 0.8, size.width / 2, size.height);
    path.quadraticBezierTo(size.width, size.height * 0.8, size.width / 2, 0);
    canvas.drawPath(path, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
