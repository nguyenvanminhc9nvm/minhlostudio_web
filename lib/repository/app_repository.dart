

import 'package:minhlostudio_web/model/app_model.dart';
import 'package:minhlostudio_web/utils/images.dart';

class AppRepository {
  List<AppModel> getListApp() {
    return [
      AppModel(
        name: "Battleship Multiplayer (MLS)",
        image: AppImages.icLogoBattleShip,
        linkPlayStore: "https://play.google.com/store/apps/details?id=com.minhnv.game_battleship&pli=1",
        linkAppStore: "https://apps.apple.com/us/app/battleship-multiplayer-mls/id6736590861",
        downloadCount: 0,
      ),
      AppModel(
        name: "Sword And Shield (MLS)",
        image: AppImages.icSas,
        linkPlayStore: "https://play.google.com/store/apps/details?id=com.mls.sas",
        linkAppStore: "https://apps.apple.com/us/app/sword-and-shield-mls/id6738675435",
        downloadCount: 0,
      ),
    ];
  }

  List<SocialModel> getListSocial() {
    return [
      SocialModel(
        name: "(Tiktok) Minh Lo Studio",
        link: "http://tiktok.com/@minhlo_studio_game",
        image: AppImages.icLogoMLS,
        count: 0,
        iconSocial: AppImages.icTiktok,
      ),
      SocialModel(
        name: "(MLS) Group trao đổi, phản hồi ý kiến về Game",
        link: "https://www.facebook.com/groups/minhlostudogroups",
        image: AppImages.icLogoMLS,
        count: 0,
        iconSocial: AppImages.icFbGroup,
      ),
      SocialModel(
        name: "Fanpage Minh Lo Studio",
        link: "https://www.facebook.com/minhlostudio/",
        image: AppImages.icLogoMLS,
        count: 0,
        iconSocial: AppImages.icFbFanPage,
      ),
      SocialModel(
        name: "My facebook",
        link: "https://www.facebook.com/nguyenvanminh12081999/",
        image: AppImages.icLogoMLS,
        count: 0,
        iconSocial: AppImages.icFb,
      ),
    ];
  }
}
