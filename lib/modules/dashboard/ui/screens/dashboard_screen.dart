import 'package:bitroot_org/constants/colors.dart';
import 'package:bitroot_org/constants/string.dart';
import 'package:bitroot_org/modules/common_component/sliver_scroll_widget.dart';
import 'package:bitroot_org/modules/dashboard/ui/widgets/dashboard_top_section.dart';
import 'package:bitroot_org/modules/dashboard/ui/widgets/transection_list_widget.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverScrollWidget(
      height: 450 + MediaQuery.of(context).padding.top,
      backgroundWidget: const DashboardTopSection(),
      sliverList: SliverList(
        delegate: SliverChildListDelegate(
          [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    'Your Activity',
                    style: Style.style(
                      context,
                      textSize: 16,
                      fontFamily: Font.black,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.sort,
                      color: ColorsBase.blue,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 25),
            const DashboardTransectionList()
          ],
        ),
      ),
    );
  }
}
