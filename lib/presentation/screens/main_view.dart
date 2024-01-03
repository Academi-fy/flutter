// import 'package:flutter/material.dart';
// import 'package:rotteck_messenger/presentation/screens/chat_view/chat_view.dart';
// import 'package:rotteck_messenger/presentation/widgets/app_navigation_bar.dart';

// class MainView extends StatefulWidget {
//   const MainView({super.key});

//   @override
//   State<MainView> createState() => _MainViewState();
// }

// class _MainViewState extends State<MainView> {
//   List<Widget> pages = [
//     const ChatView(
//       isEmpty: false,
//     ),
//     const Placeholder(),
//     const Placeholder(),
//     const Placeholder()
//   ];
//   int currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     void navItemTapped(int index) {
//       setState(() {
//         currentIndex = index;
//       });
//     }

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Theme.of(context).colorScheme.background,
//       body: pages[currentIndex],
//       bottomNavigationBar: Container(
//         color: Theme.of(context).colorScheme.primary,
//         padding: const EdgeInsets.only(bottom: 32),
//         child: AppNavigationBar(
//           currentIndex: currentIndex,
//           navItemTapped: navItemTapped,
//         ),
//       ),
//     );
//   }
// }
