import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/svg.dart';

class LoaderDialog extends StatefulWidget {
  final dynamic request;

  const LoaderDialog({Key? key, this.request}) : super(key: key);

  @override
  _LoaderDialogState createState() => _LoaderDialogState();
}

class _LoaderDialogState extends State<LoaderDialog> with SingleTickerProviderStateMixin  {
  late Animation<double> animation;
  late Animation<double> rAnimation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 1500), vsync: this);
    final CurvedAnimation curve = CurvedAnimation(parent: controller, curve: Curves.ease);
    animation = Tween(begin: 1.0, end: 0.5).animate(curve);
    animation.addStatusListener((status) {
      if(status == AnimationStatus.completed)
        controller.reverse();
      else if(status == AnimationStatus.dismissed) controller.forward();
    });
    rAnimation = Tween(begin: 0.0, end: 1.0).animate(curve);
    rAnimation.addStatusListener((status) {
      if(status == AnimationStatus.completed)
        controller.repeat();
      else if(status == AnimationStatus.dismissed) controller.forward();
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const String logoAsetName = 'assets/images/jekawin_logo.svg';

    final Widget logoSvg = SvgPicture.asset(
      logoAsetName,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.150,
    );
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                child: FadeTransition(
                  opacity: animation,
                  child: RotationTransition(
                      turns: rAnimation,
                      child: logoSvg
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const  Text(
                "widget.request.title",
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  // fontFamily: 'Roboto'
                ),
              )
              // : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}