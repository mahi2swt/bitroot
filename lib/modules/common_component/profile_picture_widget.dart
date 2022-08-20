import 'package:bitroot_org/constants/colors.dart';
import 'package:flutter/material.dart';

class ProfilePicWidget extends StatelessWidget {
  final String profilePic;
  final double dimension;
  const ProfilePicWidget({
    Key? key,
    required this.profilePic,
    this.dimension = 100.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: dimension,
      width: dimension,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 5,
          color: ColorsBase.white,
        ),
      ),
      child: ClipOval(
        child: Image.network(
          profilePic,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
