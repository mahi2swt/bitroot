import 'package:bitroot_org/constants/colors.dart';
import 'package:bitroot_org/constants/string.dart';
import 'package:flutter/material.dart';

class SettingOptionWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onClick;
  const SettingOptionWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        color: Colors.transparent,
        child: Row(
          children: [
            Icon(
              icon,
              color: ColorsBase.gray,
              size: 22,
            ),
            const SizedBox(width: 15),
            Text(
              text,
              style: Style.style(
                context,
                fontFamily: Font.semiBold,
                textSize: 16,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: ColorsBase.blue,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
