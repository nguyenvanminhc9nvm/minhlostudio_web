import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minhlostudio_web/l10n/l10n.dart';
import 'package:minhlostudio_web/utils/themes.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});
  static const String routeName = '/privacy-policy';


  @override
  Widget build(BuildContext context) {
    final language = context.l10n;
    if (language == null) {
      return const SizedBox();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy", style: AppTextStyle.t20w700(Colors.white)),
        backgroundColor: Colors.black.withOpacity(0.5),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: SingleChildScrollView(
          child: Text(
            language.policy,
            style: AppTextStyle.t20w700(Colors.black),
          ),
        ),
      ),
    );
  }
}

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});
  static const String routeName = '/terms-of-service';


  @override
  Widget build(BuildContext context) {
    final language = context.l10n;
    if (language == null) {
      return const SizedBox();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms of Service", style: AppTextStyle.t20w700(Colors.white)),
        backgroundColor: Colors.black.withOpacity(0.5),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: SingleChildScrollView(
          child: Text(
            language.term_of_services,
            style: AppTextStyle.t20w700(Colors.black),
          ),
        ),
      ),
    );
  }
}