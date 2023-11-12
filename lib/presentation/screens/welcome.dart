import 'package:flutter/material.dart';
import 'package:rotteck_messenger/presentation/screens/chat_list.dart';
import 'package:rotteck_messenger/presentation/widgets/app_button.dart';
import 'package:rotteck_messenger/presentation/widgets/app_colors.dart';
import 'package:rotteck_messenger/presentation/widgets/app_heading.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackPrimary,
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
                      "du kannst den Messenger jetzt\nmit deinem WebUntis-Konto\nverwenden",
                  image: Image.asset("assets/images/party_emoji.png"),
                  offset: [130, -30],
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
              const Text(
                "Linus Bung",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                "K2A24",
                style: TextStyle(
                    color: AppColors.blackText,
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
                            builder: (context) => const ChatList()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
