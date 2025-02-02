import 'package:clean/const.dart';
import 'package:clean/features/domain/entities/user/user_entity.dart';
import 'package:clean/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:clean/features/presentation/cubit/credential/credential_cubit.dart';
import 'package:clean/features/presentation/screens/cerdential/sign_in_screen.dart';
import 'package:clean/features/presentation/screens/main_screen/main_screen.dart';
import 'package:clean/features/presentation/widgets/button_container_widget.dart';
import 'package:clean/features/presentation/widgets/from_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _bioController = TextEditingController();

  bool _isSigningIn = false;

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGroundColor,
        body: BlocConsumer<CredentialCubit, CredentialState>(
          listener: (context, credentailState) {
            if(credentailState is CredentialSuccess) {
              BlocProvider.of<AuthCubit>(context).loggedIn();
            }
            if(credentailState is CredentialFailure) {
              toast('Invalid Email and Password');
            }
          },
          builder: (context, credentailState) {
            if(credentailState is CredentialSuccess) {
              return BlocBuilder<AuthCubit, AuthState>(
                builder: (context, authState) {
                  if(authState is Authenticated) {
                    return MainScreen(uid: authState.uid);
                  } else {
                    return _bodyWidget();
                  }
                },
                );
            }
            return _bodyWidget();
          },
        ));
  }

  _bodyWidget() {
    return Padding(
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
          sizeVer(15),
          Center(
            child: Stack(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset('assets/profile_default.png'),
                ),
                Positioned(
                  right: -10,
                  bottom: -15,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_a_photo,
                        color: blueColor,
                      )),
                ),
              ],
            ),
          ),
          sizeVer(30),
          FormContainerWidget(
            controller: _usernameController,
            hintText: 'Username',
          ),
          sizeVer(15),
          FormContainerWidget(
            controller: _emailController,
            hintText: 'Email',
          ),
          sizeVer(15),
          FormContainerWidget(
            controller: _passwordController,
            hintText: 'Password',
            isPasswordField: true,
          ),
          sizeVer(15),
          FormContainerWidget(
            controller: _bioController,
            hintText: 'Bio',
          ),
          sizeVer(15),
          ButtonContainerWidget(
            color: blueColor,
            text: 'Sign Up',
            onTapListener: () {
              _signUpUser();
            },
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
              Text(
                "Already have an account ?",
                style: TextStyle(color: primaryColor),
              ),
              sizeHor(8),
              InkWell(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, ScreenConst.signInScreen, (route) => false);
                  //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx) => SignInScreen()), (route) => false);
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              )
            ],
          ),
          sizeVer(10),
          _isSigningIn == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Please wait',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    sizeHor(10),
                    CircularProgressIndicator(),
                  ],
                )
              : Container(
                  width: 0,
                  height: 0,
                ),
        ],
      ),
    );
  }

  void _signUpUser() {
    setState(() {
      _isSigningIn = true;
    });
    BlocProvider.of<CredentialCubit>(context)
        .signUpUser(
          user: UserEntity(
            uid: '',
            name: '',
            username: _usernameController.text,
            email: _emailController.text,
            password: _passwordController.text,
            bio: _bioController.text,
            totalPosts: 0,
            totalFollowing: 0,
            totalFollowers: 0,
            following: [],
            followers: [],
            profileUrl: '',
            website: '',
          ),
        )
        .then((value) => _clear());
  }

  _clear() {
    setState(() {
      _usernameController.clear();
      _bioController.clear();
      _emailController.clear();
      _passwordController.clear();
      _isSigningIn = false;
    });
  }
}
