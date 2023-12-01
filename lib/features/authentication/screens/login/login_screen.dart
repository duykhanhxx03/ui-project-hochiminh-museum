import 'package:ui_project_hochiminh_museum/common/styles/spacing_styles.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/login_signup/form_divider.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/login_signup/social_button.dart';
import 'package:ui_project_hochiminh_museum/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ui_project_hochiminh_museum/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //Logo, title and sub-titlte
              const TLoginHeader(),

              //Form
              const TLoginForm(),

              //Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              //Footer
              TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
