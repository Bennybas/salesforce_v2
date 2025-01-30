import 'package:flutter/material.dart';
import 'package:sales_force_app/common/colo_extension.dart';
import 'package:sales_force_app/common_widget/tab_button.dart';
import 'package:sales_force_app/view/main_tab/select_view.dart';
import 'package:sales_force_app/view/home/home_view.dart';
import 'package:sales_force_app/view/photo_progress/photo_progress_view.dart';
import 'package:sales_force_app/view/profile/profile_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> with SingleTickerProviderStateMixin {
  int selectTab = 0;
  final PageStorageBucket pageBucket = PageStorageBucket();
  Widget currentTab = const HomeView();
  late AnimationController _fabAnimationController;

  @override
  void initState() {
    super.initState();
    _fabAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _fabAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: PageStorage(
            bucket: pageBucket,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: currentTab,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ScaleTransition(
        scale: Tween<double>(begin: 0.8, end: 1.0).animate(
          CurvedAnimation(
            parent: _fabAnimationController,
            curve: Curves.easeInOut,
          ),
        ),
        child: SizedBox(
          width: 75,
          height: 75,
          child: InkWell(
            onTap: () {
              _fabAnimationController.forward(from: 0);
              // Add your mic button functionality here
            },
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: TColor.primaryG,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                Icons.mic,
                color: TColor.white,
                size: 35,
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: TColor.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomAppBar(
          elevation: 0,
          color: Colors.transparent,
          child: SizedBox(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTabButton(
                    icon: "assets/img/pre_call_tab.png",
                    selectIcon: "assets/img/pre_call_select.png",
                    index: 0,
                    view: const HomeView(),
                  ),
                  const SizedBox(width: 5,),
                  _buildTabButton(
                    icon: "assets/img/phone.png",
                    selectIcon: "assets/img/phone_select.png",
                    index: 1,
                    view: const ProfileView(),
                  ),
                  const SizedBox(width: 5,),
                  const SizedBox(width: 60),
                  _buildTabButton(
                    icon: "assets/img/post_call_tab.png",
                    selectIcon: "assets/img/post_call_select.png",
                    index: 2,
                    view: const PhotoProgressView(),
                  ),
                  const SizedBox(width: 5,),
                  _buildTabButton(
                    icon: "assets/img/coaching_tab.png",
                    selectIcon: "assets/img/coaching_select.png",
                    index: 3,
                    view: const SelectView(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabButton({
    required String icon,
    required String selectIcon,
    required int index,
    required Widget view,
  }) {
    return Expanded(
      child: TabButton(
        icon: icon,
        selectIcon: selectIcon,
        isActive: selectTab == index,
        onTap: () {
          setState(() {
            selectTab = index;
            currentTab = view;
          });
        },
      ),
    );
  }
}