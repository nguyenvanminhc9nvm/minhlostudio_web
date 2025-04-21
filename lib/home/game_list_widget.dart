import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minhlostudio_web/l10n/l10n.dart';
import 'package:minhlostudio_web/model/app_model.dart';
import 'package:minhlostudio_web/repository/app_repository.dart';
import 'package:minhlostudio_web/utils/images.dart';
import 'package:minhlostudio_web/utils/themes.dart';
import 'package:url_launcher/url_launcher.dart';

class GameListWidget extends StatefulWidget {
  const GameListWidget({super.key});

  @override
  State<GameListWidget> createState() => _GameListWidgetState();
}

class _GameListWidgetState extends State<GameListWidget> {
  final listApp = AppRepository().getListApp();

  @override
  Widget build(BuildContext context) {
    return _buildMobileWidget();
  }

  Widget _buildMobileWidget() {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 10.sp),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 20.sp),
          child: _buildItemGameMobile(
            listApp[index],
            150.sp,
            listApp[index].linkTerm,
            listApp[index].linkPrivacy,
          ),
        );
      },
      itemCount: listApp.length,
    );
  }

  Widget _buildItemGameMobile(
    AppModel appModel,
    double height,
    String pathTermName,
    String pathPolicyName,
  ) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(5.sp),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(
              appModel.image,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            appModel.name,
            style: AppTextStyle.t20w700(),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () async {
                            Navigator.of(context).pushNamed(pathTermName);
                          },
                          child: Text(
                            context.l10n?.term_of_service ?? '',
                            style: AppTextStyle.t20w700(Colors.cyan),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () async {
                            Navigator.of(context).pushNamed(pathPolicyName);
                          },
                          child: Text(
                            context.l10n?.privacy_policy ?? "",
                            style: AppTextStyle.t20w700(Colors.cyan),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton.icon(
                          icon: Image.asset(
                            AppImages.icPlayStore,
                            width: 50.sp,
                            height: 50.sp,
                          ),
                          onPressed: () async {
                            if (appModel.linkPlayStore.isEmpty) {
                              return;
                            }
                            if (await canLaunchUrl(
                                Uri.parse(appModel.linkPlayStore))) {
                              await launchUrl(Uri.parse(appModel.linkPlayStore));
                            }
                          },
                          label: Text(
                            context.l10n?.get ?? "",
                            style: AppTextStyle.t20w700(),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton.icon(
                          icon: Image.asset(
                            AppImages.icAppStore,
                            width: 50.sp,
                            height: 50.sp,
                          ),
                          onPressed: () async {
                            if (appModel.linkAppStore.isEmpty) {
                              return;
                            }
                            if (await canLaunchUrl(
                                Uri.parse(appModel.linkAppStore))) {
                              await launchUrl(Uri.parse(appModel.linkAppStore));
                            }
                          },
                          label: Text(
                            context.l10n?.get ?? "",
                            style: AppTextStyle.t20w700(),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
