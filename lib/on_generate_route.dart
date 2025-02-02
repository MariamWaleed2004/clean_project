import 'package:clean/const.dart';
import 'package:clean/features/presentation/screens/cerdential/sign_in_screen.dart';
import 'package:clean/features/presentation/screens/cerdential/sign_up_screen.dart';
import 'package:clean/features/presentation/screens/post/comment/comment_screen.dart';
import 'package:clean/features/presentation/screens/post/update_post_screen.dart';
import 'package:clean/features/presentation/screens/profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;

    switch(settings.name) {
      case ScreenConst.editProfileScreen: {
        return routeBuilder(EditProfileScreen());
      }
      case ScreenConst.updatePostScreen: {
        return routeBuilder(UpdatePostScreen());
      }
      case ScreenConst.commentScreen: {
        return routeBuilder(CommentScreen());
      }
      case ScreenConst.signInScreen: {
        return routeBuilder(SignInScreen());
      }
      case ScreenConst.signUpScreen: {
        return routeBuilder(SignUpScreen());
      }
    
       
      default: NoScreenFound();
    }
  }
}

dynamic routeBuilder(Widget child) {
  return MaterialPageRoute(builder: (ctx) => child);
}


class NoScreenFound extends StatelessWidget {
  const NoScreenFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page not found'),
      ),
      body: Center(
        child: Text('Page not found'),
      ),
    );
  }
}