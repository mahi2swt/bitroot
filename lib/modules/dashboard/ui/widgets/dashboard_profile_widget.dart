import 'package:bitroot_org/common_provider/app_state.dart';
import 'package:bitroot_org/constants/colors.dart';
import 'package:bitroot_org/constants/string.dart';
import 'package:bitroot_org/modules/common_component/profile_picture_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardProfileWidgte extends StatelessWidget {
  const DashboardProfileWidgte({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context, listen: false);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ProfilePicWidget(
          profilePic: appState.loginUserData.profilePic,
          dimension: 65.0,
        ),
        const SizedBox(width: 10),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Text(
              "Hi, ${appState.loginUserData.name}",
              style: Style.style(
                context,
                textSize: 18,
                fontFamily: Font.black,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Here’s your spending dashboard",
              style: Style.style(
                context,
                textSize: 16,
                color: ColorsBase.black.withOpacity(.9),
                fontFamily: Font.medium,
              ),
            ),
          ],
        ),
        const Spacer(),
        Stack(
          children: <Widget>[
            const Icon(
              Icons.notifications,
              size: 30,
              color: ColorsBase.gray,
            ),
            Positioned(
              top: 0.0,
              right: 0.0,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                constraints: const BoxConstraints(
                  minWidth: 12,
                  minHeight: 12,
                ),
                child: const Text(
                  '2',
                  style: TextStyle(
                    color: ColorsBase.white,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
