import 'package:flutter/material.dart';

import 'package:bitroot_org/constants/colors.dart';
import 'package:bitroot_org/constants/string.dart';
import 'package:bitroot_org/modules/dashboard/models/user_model.dart';
import 'package:bitroot_org/modules/payments/ui/widgets/circular_sprite_animation.dart';

class PaymentScreen extends StatelessWidget {
  final UserModel profileData;
  const PaymentScreen({Key? key, required this.profileData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsBase.blue,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _ProfileImageWidget(profilePic: profileData.profilePic),
              Text(
                'Paying',
                style: Style.style(
                  context,
                  fontFamily: Font.semiBold,
                  textSize: 16,
                  color: ColorsBase.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                profileData.userName,
                style: Style.style(
                  context,
                  fontFamily: Font.semiBold,
                  textSize: 26,
                  color: ColorsBase.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // <-- Radius
                  ),
                  primary: ColorsBase.white,
                  onPrimary: ColorsBase.black,
                  elevation: 0,
                  padding: const EdgeInsets.all(20),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Canncel Payment',
                  style: Style.style(
                    context,
                    fontFamily: Font.semiBold,
                    textSize: 16,
                    color: ColorsBase.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileImageWidget extends StatefulWidget {
  final String profilePic;

  const _ProfileImageWidget({
    Key? key,
    required this.profilePic,
  }) : super(key: key);
  @override
  _ProfileImageWidgetState createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<_ProfileImageWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
    _startAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller
      ..stop()
      ..reset()
      ..repeat(period: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.scale(
          scale: 1.5,
          child: CustomPaint(
            painter: CircularSpriteAnimation(_controller),
            child: SizedBox(
              width: 500,
              height: 500,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 5,
                      color: ColorsBase.white,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.network(
                      widget.profilePic,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
