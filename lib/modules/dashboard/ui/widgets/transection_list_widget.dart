import 'package:bitroot_org/constants/colors.dart';
import 'package:bitroot_org/constants/string.dart';
import 'package:bitroot_org/modules/dashboard/models/user_transection_model.dart';
import 'package:bitroot_org/modules/dashboard/providers/dashboard_providers.dart';
import 'package:bitroot_org/modules/dashboard/ui/skeletons/transection_list_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardTransectionList extends StatefulWidget {
  const DashboardTransectionList({Key? key}) : super(key: key);

  @override
  State<DashboardTransectionList> createState() =>
      _DashboardTransectionListState();
}

class _DashboardTransectionListState extends State<DashboardTransectionList> {
  late DashboardProvider dashboardProvider;
  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);

  @override
  void initState() {
    dashboardProvider = Provider.of<DashboardProvider>(context, listen: false);
    getData();
    super.initState();
  }

  Future<void> getData() async {
    _isLoading.value = true;
    await Future.delayed(const Duration(seconds: 5));
    await dashboardProvider.getTransectionData();
    _isLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isLoading,
      builder: (context, value, child) {
        if (value) {
          return const TransectionListSkeleton();
        } else {
          return Selector<DashboardProvider, List<UserTransectionModel>>(
            selector: (_, provider) => provider.transectionData,
            builder: (context, data, child) {
              return ListView.separated(
                itemCount: data.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                separatorBuilder: (BuildContext context, int index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      color: ColorsBase.gray,
                    ),
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return _TransectionWidget(
                    data: data[index],
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}

class _TransectionWidget extends StatelessWidget {
  final UserTransectionModel data;
  const _TransectionWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _TextWidget(
              text: data.itemName,
              fontFamily: Font.semiBold,
            ),
            const Spacer(),
            _TextWidget(
              text: "\$${data.price}",
              fontFamily: Font.semiBold,
            ),
          ],
        ),
        const SizedBox(height: 10),
        _TextWidget(
          text: data.brandName,
          fontFamily: Font.bold,
        ),
        const SizedBox(height: 10),
        _TextWidget(
          text: "Return Time Remaining ${data.returnDate}",
          color: ColorsBase.grayText,
        ),
        const SizedBox(height: 12),
        _TextWidget(
          text: data.address,
          color: ColorsBase.grayText,
        ),
      ],
    );
  }
}

class _TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final String fontFamily;
  const _TextWidget({
    Key? key,
    required this.text,
    this.color = ColorsBase.black,
    this.fontFamily = Font.regular,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Style.style(
        context,
        textSize: 16,
        color: color,
        fontFamily: fontFamily,
      ),
    );
  }
}
