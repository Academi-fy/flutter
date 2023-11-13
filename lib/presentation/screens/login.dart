import 'package:flutter/material.dart';
import 'package:rotteck_messenger/presentation/screens/welcome.dart';
import 'package:rotteck_messenger/presentation/widgets/app_button.dart';
import 'package:rotteck_messenger/presentation/widgets/app_plain_button.dart';
import 'package:rotteck_messenger/presentation/widgets/app_textfield.dart';
import 'package:rotteck_messenger/presentation/widgets/app_heading.dart';

class Login extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final Function() _logIn = () {
    print("Log in pending...");
  };
  final Function() _forgotPass = () {
    print("Forgot passwort pending...");
  };
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Flexible(
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    AppHeading(
                      text: "Willkommen",
                      caption: "bitte melde dich mit deinen\nNutzerdaten an",
                      image: Image.asset("assets/images/handwave_emoji.png"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Flexible(
                  child: AppTextField(
                      text: "Benutzername", controller: _usernameController)),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                  child: AppTextField(
                text: "Passwort",
                controller: _passController,
                obscureText: true,
              )),
              const SizedBox(
                height: 30,
              ),
              Flexible(
                  child: AppButton(
                text: "Anmelden",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Welcome()));
                  _logIn;
                },
                iconLocation: "assets/icons/AltArrowRight.svg",
              )),
              const SizedBox(
                height: 20,
              ),
              AppPlainButton(label: "Passwort vergessen?", onTap: _forgotPass)
            ],
          ),
        ),
      ),
    );
  }
}
