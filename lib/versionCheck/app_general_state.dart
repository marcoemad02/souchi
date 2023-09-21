import 'package:get/get.dart';
import 'package:souchi/versionCheck/version_state.dart';

import '../authentication/Core/if_logged_in.dart';
import '../authentication/Screens/login_screen.dart';
import '../views/pages/BranchPage/branch_view.dart';
import 'internet_state.dart';

Future<void> appGeneralState() async {
  bool isOnline = await checkNetworkConnectivity();
  bool isStateOne = await AppDataController().VersionState();

  if (isOnline) {
    if (isStateOne) {
      Get.to(() => LoginCheck(
          loggedInWidget: const BranchScreen(), loggedOutWidget: LoginPage()));
    }
  }
}
