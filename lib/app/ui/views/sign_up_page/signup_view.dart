import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yemek_soyle_app/app/core/constants/app_pading.dart';
import 'package:yemek_soyle_app/app/core/constants/color.dart';
import 'package:yemek_soyle_app/app/core/utils/project_utility.dart';
import 'package:yemek_soyle_app/app/ui/views/main_tab_page/main_tab_view.dart';
import 'package:yemek_soyle_app/app/ui/views/sign_up_page/sign_up_mixin.dart';

class SignupView extends StatefulWidget {
  SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> with SignUpPageMixin {
  final String _hintTitle = 'hsaforwork@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: _signinText(context),
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: _arrowBackButton(),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
              clipBehavior: Clip.none, // Taşan widget'ların görünmesini sağlar
              children: [
                Column(
                  children: [
                    _primaryColorContainer(context),
                    _whiteColorContainer(context),
                  ],
                ),
                Positioned(
                  top: MediaQuery.sizeOf(context).height * 0.05,
                  left: 0, // Sol hizalama ekleyelim
                  right: 0,
                  child: Padding(
                    padding: AppPadding.horizontalMedium,
                    child: Container(
                      decoration: ProjectUtility.signUpBoxDecoration,
                      height: MediaQuery.sizeOf(context).height * 0.73,
                      child: SafeArea(
                        child: SingleChildScrollView(
                          padding: AppPadding.allxLarge,
                          child: Column(
                            children: [
                              _nameSurnameField(context),
                              const SizedBox(height: 20),
                              _emailAddressField(context),
                              const SizedBox(height: 20),
                              _passwordField(context),
                              const SizedBox(height: 50),
                              _signupButton(context),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
        ));
  }

  Container _arrowBackButton() {
    return Container(
      margin: AppPadding.leftSmall,
      child: Center(
        child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColor.whiteColor),
      ),
    );
  }

  Container _whiteColorContainer(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.4,
      decoration: BoxDecoration(color: AppColor.whiteColor),
    );
  }

  Container _primaryColorContainer(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.4,
      decoration: BoxDecoration(color: AppColor.primaryColor),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 150),
          child: Text(
            AppLocalizations.of(context)!.appName,
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: AppColor.whiteColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _nameSurnameField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Name Surname",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16),
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              filled: true,
              hintText: "Hüseyin Sefa",
              hintStyle: TextStyle(
                  color: AppColor.lightgreyColor, fontWeight: FontWeight.normal, fontSize: 14),
              fillColor: const Color(0xffF7F7F9),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none, borderRadius: BorderRadius.circular(14))),
        )
      ],
    );
  }

  Widget _emailAddressField(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.emailTitle,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16),
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              filled: true,
              hintText: _hintTitle,
              hintStyle: TextStyle(
                  color: AppColor.lightgreyColor, fontWeight: FontWeight.normal, fontSize: 14),
              fillColor: const Color(0xffF7F7F9),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none, borderRadius: BorderRadius.circular(14))),
        )
      ],
    );
  }

  Widget _passwordField(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.passwordTitle,
          style: TextStyle(color: AppColor.blackColor, fontWeight: FontWeight.normal, fontSize: 16),
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffF7F7F9),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none, borderRadius: BorderRadius.circular(14))),
        )
      ],
    );
  }

  Widget _signupButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        minimumSize: const Size(double.infinity, 60),
        elevation: 0,
      ),
      onPressed: () async {
        if (emailController.text != "" && passwordController.text != "") {
          await signUp()
              ? Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<MainPage>(
                    builder: (context) => MainPage(),
                  ))
              : null;
        }
      },
      child: Text(
        AppLocalizations.of(context)!.signUpTitle,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColor.whiteColor,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return Padding(
      padding: AppPadding.bottomMedium,
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
              text: AppLocalizations.of(context)!.haveAccountTitle,
              style: TextStyle(
                  color: AppColor.blackColor, fontWeight: FontWeight.normal, fontSize: 16),
            ),
            TextSpan(
                text: AppLocalizations.of(context)!.loginTitle,
                style: TextStyle(
                    color: AppColor.primaryColor, fontWeight: FontWeight.bold, fontSize: 16),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pop(context);
                  }),
          ])),
    );
  }
}
