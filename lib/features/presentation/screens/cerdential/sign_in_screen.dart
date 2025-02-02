import 'package:clean/const.dart';
import 'package:clean/features/presentation/screens/cerdential/sign_up_screen.dart';
import 'package:clean/features/presentation/widgets/button_container_widget.dart';
import 'package:clean/features/presentation/widgets/from_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Container(),
              flex: 2,
              ),
            Center(
              child: SvgPicture.asset(
                'assets/ic_instagram.svg',
                colorFilter: primaryColorFilter,
                ),
            ),
            sizeVer(30),
            FormContainerWidget(
              hintText: 'Email',
            ),
            sizeVer(15),
            FormContainerWidget(
              hintText: 'Password',
              isPasswordField: true,
            ),
            sizeVer(15),
            ButtonContainerWidget(
              color: blueColor,
              text: 'Sign In',
              onTapListener: () {},
            ),
            Flexible(
              child: Container(),
              flex: 2,
              ),
              Divider(
                color: secondaryColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account ?", 
                  style: TextStyle(
                    color: primaryColor
                  ),
                ),
                sizeHor(8),
                InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(context, ScreenConst.signUpScreen, (route) => false);
                    //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx) => SignUpScreen()),(route) => false,);
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                )
                ],
              ),
          ],
        ),
      ),
    );
  }
}