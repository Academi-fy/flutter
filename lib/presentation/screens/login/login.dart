// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:rotteck_messenger/presentation/screens/login/bloc/login_bloc.dart';
// import 'package:rotteck_messenger/presentation/screens/welcome.dart';
// import 'package:rotteck_messenger/presentation/widgets/app_button.dart';
// import 'package:rotteck_messenger/presentation/widgets/app_plain_button.dart';
// import 'package:rotteck_messenger/presentation/widgets/app_popup_message.dart';
// import 'package:rotteck_messenger/presentation/widgets/app_textfield.dart';
// import 'package:rotteck_messenger/presentation/widgets/app_heading.dart';
// import 'package:rotteck_messenger/presentation/widgets/entries/timed_message_popup_entry.dart';

// class Login extends StatelessWidget {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passController = TextEditingController();
//   final LoginBloc loginBloc = LoginBloc();

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<LoginBloc, LoginState>(
//       bloc: loginBloc,
//       listenWhen: (previous, current) => current is LoginActionState,
//       buildWhen: (previous, current) => current is! LoginActionState,
//       listener: (context, state) {
//         if (state is LoginNavigateToChatPageActionState) {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => const Welcome()));
//         }
//       },
//       builder: (context, state) {
//         return Scaffold(
//           resizeToAvoidBottomInset: false,
//           backgroundColor: Theme.of(context).colorScheme.background,
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   alignment: Alignment.center,
//                   height: MediaQuery.of(context).size.height * 0.9,
//                   width: MediaQuery.of(context).size.width * 0.8,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const Spacer(),
//                       AppHeading(
//                         text: "Willkommen",
//                         caption: "bitte melde dich mit deinen Nutzerdaten an",
//                         image: Image.asset("assets/images/handwave_emoji.png"),
//                       ),
//                       const Spacer(),
//                       AppTextField(
//                           text: "Benutzername",
//                           controller: _usernameController),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       AppTextField(
//                         text: "Passwort",
//                         controller: _passController,
//                         obscureText: true,
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       AppButton.highlightButton(context, "Anmelden", () {
//                         loginBloc.add(LoginButtonPressedEvent(
//                             username: _usernameController.text,
//                             password: _passController.text));
//                       }, "assets/icons/AltArrowRight.svg"),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       AppPlainButton(
//                         label: "Passwort vergessen?",
//                         onTap: () {
//                           loginBloc.add(ForgotButtonPressedEvent());
//                           TimedMessagePopupEntry.showCustomPopup(
//                             context,
//                             AppPopupMessage.generateError(
//                                 "Hoppla, da ist etwas schiefgelaufen...",
//                                 "...bitte überprüfe Benutzernamen und Passwort!"),
//                           );
//                         },
//                       ),
//                       const Spacer(),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   alignment: Alignment.bottomCenter,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Developed with",
//                         style: TextStyle(
//                             fontSize: 10,
//                             color: Theme.of(context).colorScheme.onBackground,
//                             fontWeight: FontWeight.w600),
//                       ),
//                       const SizedBox(5
//                         width: 2,
//                       ),
//                       Image.asset("assets/images/heart_emoji.png",
//                           height: 10, width: 10),
//                       const SizedBox(
//                         width: 2,
//                       ),
//                       Text(
//                         "by Daniel and Linus",
//                         style: TextStyle(
//                             fontSize: 10,
//                             color: Theme.of(context).colorScheme.onBackground,
//                             fontWeight: FontWeight.w600),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
