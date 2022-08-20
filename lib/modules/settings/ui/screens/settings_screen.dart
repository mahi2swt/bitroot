import 'package:bitroot_org/constants/colors.dart';
import 'package:bitroot_org/modules/common_component/sliver_scroll_widget.dart';
import 'package:bitroot_org/modules/settings/ui/widgets/setting_options_widget.dart';
import 'package:bitroot_org/modules/settings/ui/widgets/setting_profile_section.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverScrollWidget(
      backgroundWidget: const SettingProfileSection(),
      sliverList: SliverList(
        delegate: SliverChildListDelegate(
          [
            SettingOptionWidget(
              onClick: () {},
              icon: Icons.person,
              text: 'Personal Info',
            ),
            divider(),
            SettingOptionWidget(
              onClick: () {},
              icon: Icons.qr_code,
              text: 'My QR Code',
            ),
            divider(),
            SettingOptionWidget(
              onClick: () {},
              icon: Icons.location_city,
              text: 'Bank and Cards',
            ),
            divider(),
            SettingOptionWidget(
              onClick: () {},
              icon: Icons.payment,
              text: 'Payment Preferences',
            ),
            divider(),
            SettingOptionWidget(
              onClick: () {},
              icon: Icons.refresh,
              text: 'Automatic Payments',
            ),
            divider(),
            SettingOptionWidget(
              onClick: () {},
              icon: Icons.login,
              text: 'Login and Security',
            ),
            divider(),
            SettingOptionWidget(
              onClick: () {},
              icon: Icons.notifications,
              text: 'Notifications',
            ),
            divider(),
            SettingOptionWidget(
              onClick: () {},
              icon: Icons.notifications,
              text: 'Notifications',
            ),
            divider(),
            SettingOptionWidget(
              onClick: () {},
              icon: Icons.notifications,
              text: 'Notifications',
            ),
            divider(),
            SettingOptionWidget(
              onClick: () {},
              icon: Icons.notifications,
              text: 'Notifications',
            ),
            divider(),
            SettingOptionWidget(
              onClick: () {},
              icon: Icons.notifications,
              text: 'Notifications',
            ),
            divider(),
            SettingOptionWidget(
              onClick: () {},
              icon: Icons.notifications,
              text: 'Notifications',
            ),
          ],
        ),
      ),
    );
  }

  Widget divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Divider(
        color: ColorsBase.grayText,
      ),
    );
  }
}
