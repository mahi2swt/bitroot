import 'package:bitroot_org/constants/colors.dart';
import 'package:bitroot_org/constants/string.dart';
import 'package:flutter/material.dart';

class DashboardBalanceWidget extends StatelessWidget {
  const DashboardBalanceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorsBase.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: const [
                _BigText(text: "\$204.05"),
                SizedBox(height: 10),
                _SmallText(text: "Your Balance"),
              ],
            ),
          ),
          Container(
            height: 60,
            width: 1,
            color: ColorsBase.gray,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: const [
                    _BigText(text: "30", textColor: ColorsBase.blue),
                    SizedBox(height: 10),
                    _SmallText(text: "Last Days"),
                  ],
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: ColorsBase.blue,
                  size: 35,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _BigText extends StatelessWidget {
  final String text;
  final Color textColor;
  const _BigText({
    Key? key,
    required this.text,
    this.textColor = ColorsBase.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Style.style(
        context,
        textSize: 35,
        color: textColor,
        fontFamily: Font.bold,
      ),
    );
  }
}

class _SmallText extends StatelessWidget {
  final String text;
  const _SmallText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Style.style(
        context,
        textSize: 14,
        color: ColorsBase.grayText,
        fontFamily: Font.medium,
      ),
    );
  }
}
