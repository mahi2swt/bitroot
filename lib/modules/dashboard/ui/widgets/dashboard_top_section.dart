import 'package:bitroot_org/constants/string.dart';
import 'package:bitroot_org/modules/dashboard/ui/widgets/dashboard_balance_widget.dart';
import 'package:bitroot_org/modules/dashboard/ui/widgets/dashboard_profile_widget.dart';
import 'package:bitroot_org/modules/dashboard/ui/widgets/dashboard_user_list.dart';
import 'package:flutter/material.dart';

class DashboardTopSection extends StatelessWidget {
  const DashboardTopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top + 10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: DashboardProfileWidgte(),
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: DashboardBalanceWidget(),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Send Again',
            style: Style.style(
              context,
              textSize: 16,
              fontFamily: Font.black,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const DashboardUserList()
      ],
    );
  }
}
