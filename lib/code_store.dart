//  void _launchDeleteAccountURL(String id) async {
//     final deleteAccountUrl =
//         BloommUrls.getUrl(AppConfig.instance.flavor, BloommUrl.DeleteAccount);

//     final url = '$deleteAccountUrl$id';

//     print('thiis is the url == for delete == $url');
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }






//      onTap: () async {
//                               final tokenRepository =
//                                   TokenRepository.getInstance();
//                               CustomerStorage _customerStorage =
//                                   CustomerStorage.getInstance();
//                               final kyc = UserPersistenceProvider();
//                               // await tokenRepository.deleteToken();
//                               kyc.reSetSeenKyc();
//                               Provider.of<NavBarController>(context,
//                                       listen: false)
//                                   .setIndex(0);
//                               final newRoute = MaterialPageRoute(
//                                   builder: (context) => VerifyPhoneNoPage());
//                               Navigator.pushAndRemoveUntil(
//                                   context, newRoute, (route) => false);

//                               var id = _customerModel?.userId;
//                               _launchDeleteAccountURL(id!);
//                             },




//                               BloommUrl.DeleteAccount: 'https://5554.bankly.ng/delete-account/',
//   BloommUrl.DeleteAccount: 'https://bankly.ng/delete-account/',


//   divider(),
//                   SizedBox(
//                     height: 30,
//                   ),