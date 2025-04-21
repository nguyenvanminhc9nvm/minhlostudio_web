import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minhlostudio_web/home/engine_list.dart';
import 'package:minhlostudio_web/home/game_list_widget.dart';
import 'package:minhlostudio_web/home/social_media_widget.dart';
import 'package:minhlostudio_web/home/privacy_term_sas/term_of_services.dart';
import 'package:minhlostudio_web/l10n/l10n.dart';
import 'package:minhlostudio_web/repository/app_repository.dart';
import 'package:minhlostudio_web/utils/responsive_widget.dart';
import 'package:minhlostudio_web/utils/themes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final appRepository = AppRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ResponsiveWidget(
          tabletLayout: _buildTabletWidget(context),
          mobileLayout: _buildMobileWidget(context),
        ),
      ),
    );
  }

  Widget _buildTabletWidget(BuildContext context) {
    return Center(
      child: SizedBox(width: 800.w, child: _homePage(context)),
    );
  }

  Widget _buildMobileWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: _homePage(context),
    );
  }

  Widget _homePage(BuildContext context) {
    final language = context.l10n;
    if (language == null) {
      return const SizedBox();
    }
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      children: [
        Text(
          language.minh_lo_studio,
          textAlign: TextAlign.center,
          style: AppTextStyle.t50w400(Colors.white),
        ),
        SizedBox(height: 20.h),
        _sectionHeader(language.about_me),
        Text(language.about_me_desc, style: AppTextStyle.t20w700(Colors.white)),
        _sectionHeader(language.game_list),
        const GameListWidget(),
        _sectionHeader(language.contact),
        const SocialMediaWidget(),
        _sectionHeader(language.tools),
        const EngineListWidget(),
        SizedBox(height: 20.h),
        _buildInfo(),
        SizedBox(height: 100.h),
      ],
    );
  }

  Widget _buildNavButton(BuildContext context, String title, String screen) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(
        context,
        screen,
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
      ),
      child: Text(title, style: AppTextStyle.t15w700(Colors.black)),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Text(
        title,
        style: AppTextStyle.t20w700(Colors.white),
      ),
    );
  }

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Email: nguyenvanminh12081999@gmail.com", style: AppTextStyle.t20w700(Colors.white)),
        Text("Phone: 0977051541", style: AppTextStyle.t16w400(Colors.white)),
        Text("Address: Chuong My - Ha Noi", style: AppTextStyle.t16w400(Colors.white)),
      ],
    );
  }
}

