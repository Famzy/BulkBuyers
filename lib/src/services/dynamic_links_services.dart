import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class DynamicLinksService {
  Future handleDynamicLinks() async {
    //STARTUP FROM DYNAMIC LINKS LOGIC
    // Get initial dynamic link if app is started using link
    final PendingDynamicLinkData data =
    await FirebaseDynamicLinks.instance.getInitialLink();
    _handleDeepLink(data);

    // INTO FOREGROUND FROM  DYNAMIC LINK
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicData) async {
          _handleDeepLink(dynamicData);
        }, onError: (OnLinkErrorException error) async {
      print("Dynamic Links Failed: ${error.message}");
    });
  }

  void _handleDeepLink(PendingDynamicLinkData data) {
    final Uri deeplink = data?.link;
    if (deeplink != null) {
      print("_handleDeepLink | deeplink $deeplink");
      var isResetPassword = deeplink.pathSegments.contains('reset-passwor');
      if(isResetPassword){

      }
    }
  }
}
