import 'package:bitroot_org/constants/colors.dart';
import 'package:bitroot_org/constants/string.dart';
import 'package:bitroot_org/modules/common_component/profile_picture_widget.dart';
import 'package:bitroot_org/modules/dashboard/models/user_model.dart';
import 'package:bitroot_org/modules/dashboard/providers/dashboard_providers.dart';
import 'package:bitroot_org/modules/dashboard/ui/skeletons/user_list_skeleton.dart';
import 'package:bitroot_org/modules/payments/ui/screen/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardUserList extends StatefulWidget {
  const DashboardUserList({Key? key}) : super(key: key);

  @override
  State<DashboardUserList> createState() => _DashboardUserListState();
}

class _DashboardUserListState extends State<DashboardUserList> {
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
    await Future.delayed(const Duration(seconds: 3));
    await dashboardProvider.getRecentData();
    _isLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ValueListenableBuilder<bool>(
        valueListenable: _isLoading,
        builder: (context, value, child) {
          if (value) {
            return const UserListSkeleton();
          } else {
            return Selector<DashboardProvider, List<UserModel>>(
              selector: (_, provider) => provider.recentUsers,
              builder: (context, data, child) {
                return ListView.separated(
                  itemCount: data.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) {
                              return PaymentScreen(
                                profileData: data[index],
                              );
                            }),
                          ),
                        );
                      },
                      child: _UserWidget(
                        data: data[index],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 10);
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

class _UserWidget extends StatelessWidget {
  final UserModel data;
  const _UserWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ProfilePicWidget(
          profilePic: data.profilePic,
          dimension: 65,
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 70,
          child: Text(
            data.userName,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: Style.style(
              context,
              textSize: 12,
              color: ColorsBase.grayText,
              fontFamily: Font.semiBold,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}
