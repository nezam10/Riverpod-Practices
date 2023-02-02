import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/common_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _BodyWidget(),
    );
  }
}

class _BodyWidget extends ConsumerWidget {
  const _BodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencyList = ref.watch(currencyListProvider);
    return Column(
      children: [],
    );
  }
}







//example code//

// class _BodyWidget extends ConsumerWidget {
//   final ProfileController controller;

//   const _BodyWidget({super.key, required this.controller});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final appCon = Get.find<AppController>();
//     final userProfile =
//         ref.watch(getProfileInfoProvider(appCon.user.userId.toString()));
//     return SizedBox.expand(
//       child: CreateBoxShap(
//           child: userProfile.when(
//         data: (data) {
//           controller.setUserData(data!);
//           return GetBuilder<ProfileController>(
//               // init: MyController(),
//               // initState: (_) {},
//               builder: (kycController) {
//             return SizedBox.expand(
//               child: CreateBoxShap(
//                 child: PageView(
//                   controller: kycController.pageController,
//                   scrollDirection: Axis.horizontal,
//                   physics: const NeverScrollableScrollPhysics(),
//                   pageSnapping: true,
//                   onPageChanged: (index) {
//                     kycController.pageChanged(index);
//                   },
//                   children: [
//                     // first pageView
//                     ProfileInfoPageView(profileCon: kycController),
//                     // secound pageView
//                     ProfilePermanentAddressPageView(profileCon: kycController),
//                     ProfileShippingAddressPageView(profileCon: kycController),
//                     ProfileProofPageView(
//                         profileCon: kycController, profileData: data),

//                     // third pageView
//                   ],
//                 ),
//               ),
//             );
//           });
//         },
//         error: (error, stackTrace) => Text(error.toString()),
//         loading: () => const CustomCircularIndicatorWiedget(),
//       )),
//     );
//   }
// }
