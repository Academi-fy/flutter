import 'package:flutter/material.dart';
import 'package:rotteck_messenger/di/dependency_injection.dart';
import 'package:rotteck_messenger/domain/entities/user.dart';
import 'package:rotteck_messenger/domain/repositories/user_repository.dart';
import 'package:rotteck_messenger/presentation/screens/chat_list.dart';
import 'package:rotteck_messenger/presentation/screens/main_view.dart';
import 'package:rotteck_messenger/presentation/widgets/app_button.dart';
import 'package:rotteck_messenger/presentation/widgets/app_heading.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key, this.userId = "65595984dd3168b471338c5e"});
  final String userId;

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final userRepository = getIt<UserRepository>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
        future: userRepository.getUserById(widget.userId),
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.primary,
            body: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: AppHeading(
                        text: "Anmeldung\nErfolgreich",
                        caption:
                            "du kannst den Messenger jetzt\nmit deinem WebUntis-Konto\nverwenden.",
                        image: Image.asset("assets/images/party_emoji.png"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Flexible(
                        child: Image.asset(
                            height: 200, "assets/images/example_banner.png")),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Linus Bung",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 35,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "K2A24",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppButton(
                        iconLocation: "assets/icons/AltArrowRight.svg",
                        text: "Weiter",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainView()));
                        })
                  ],
                ),
              ),
            ),
          );
        });
  }
}
