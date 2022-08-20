import 'package:bitroot_org/common_provider/app_state.dart';
import 'package:bitroot_org/constants/colors.dart';
import 'package:bitroot_org/constants/string.dart';
import 'package:bitroot_org/modules/common_component/profile_picture_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingProfileSection extends StatelessWidget {
  const SettingProfileSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context, listen: false);

    return Container(
      color: ColorsBase.bgGray,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 16),
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Log Out',
                style: Style.style(
                  context,
                  textSize: 15,
                  fontFamily: Font.bold,
                  color: ColorsBase.blue,
                ),
              ),
            ),
          ),
          ProfilePicWidget(
            profilePic: appState.loginUserData.profilePic,
          ),
          const SizedBox(height: 15),
          Text(
            appState.loginUserData.name,
            style: Style.style(
              context,
              textSize: 18,
              fontFamily: Font.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            appState.loginUserData.email,
            style: Style.style(
              context,
              textSize: 12,
              fontFamily: Font.medium,
            ),
          ),
          const SizedBox(height: 120),
        ],
      ),
    );
  }
}
