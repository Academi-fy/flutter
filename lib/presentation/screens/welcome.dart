// import 'package:flutter/material.dart';
// import 'package:rotteck_messenger/data/models/user_model.dart';
// import 'package:rotteck_messenger/data/repositories/user_repository.dart';
// import 'package:rotteck_messenger/di/dependency_injection.dart';
// import 'package:rotteck_messenger/presentation/screens/main_view.dart';
// import 'package:rotteck_messenger/presentation/widgets/app_button.dart';
// import 'package:rotteck_messenger/presentation/widgets/app_heading.dart';

// class Welcome extends StatefulWidget {
//   const Welcome({super.key});

//   @override
//   State<Welcome> createState() => _WelcomeState();
// }

// class _WelcomeState extends State<Welcome> {
//   final userRepository = getIt<UserRepository>();
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<UserModel>(
//         future: userRepository.getUserById("1"),
//         builder: (context, snapshot) {
//           return Scaffold(
//             backgroundColor: Theme.of(context).colorScheme.background,
//             body: Center(
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.8,
//                 height: MediaQuery.of(context).size.height * 0.6,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Container(
//                       alignment: Alignment.topLeft,
//                       child: AppHeading(
//                         text: "Anmeldung Erfolgreich",
//                         caption:
//                             "du kannst den Messenger jetzt mit deinem WebUntis-Konto verwenden.",
//                         image: Image.asset("assets/images/party_emoji.png"),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Flexible(
//                         child: Image.asset(
//                             height: 200, "assets/images/example_banner.png")),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Text(
//                       "Linus Bung",
//                       style: TextStyle(
//                           color: Theme.of(context).colorScheme.inversePrimary,
//                           fontSize: 35,
//                           fontWeight: FontWeight.w600),
//                     ),
//                     const SizedBox(
//                       height: 3,
//                     ),
//                     Text(
//                       "K2A24",
//                       style: TextStyle(
//                           color: Theme.of(context).colorScheme.onBackground,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     AppButton.highlightButton(context, "Weiter", () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const MainView()));
//                     }, "assets/icons/AltArrowRight.svg"),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }
// }
