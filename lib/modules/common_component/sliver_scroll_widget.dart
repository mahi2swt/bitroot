import 'package:bitroot_org/constants/colors.dart';
import 'package:bitroot_org/constants/string.dart';
import 'package:bitroot_org/modules/common_component/custom_search.dart';
import 'package:flutter/material.dart';

class SliverScrollWidget extends StatelessWidget {
  final Widget backgroundWidget;
  final double height;
  final SliverList sliverList;
  const SliverScrollWidget({
    Key? key,
    required this.backgroundWidget,
    this.height = 330.0,
    required this.sliverList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: ColorsBase.bgGray,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.zero,
            expandedTitleScale: 1,
            title: Container(
              color: ColorsBase.white,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top - 15,
                bottom: 10,
                left: 16,
                right: 16,
              ),
              child: GestureDetector(
                onTap: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorsBase.bgGray,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        color: ColorsBase.blue,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Search Settings',
                        style: Style.style(
                          context,
                          textSize: 15,
                          fontFamily: Font.semiBold,
                          color: ColorsBase.grayText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            background: backgroundWidget,
          ),
          pinned: true,
          expandedHeight: height,
        ),
        sliverList,
      ],
    );
  }
}
