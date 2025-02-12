import 'package:clean/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:clean/features/presentation/cubit/credential/credential_cubit.dart';
import 'package:clean/features/presentation/cubit/user/get_single_user/get_single_user_cubit.dart';
import 'package:clean/features/presentation/cubit/user/user_cubit.dart';
import 'package:clean/features/presentation/screens/cerdential/sign_in_screen.dart';
import 'package:clean/features/presentation/screens/main_screen/main_screen.dart';
import 'package:clean/on_generate_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:clean/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<AuthCubit>()..appStarted(context)),
        BlocProvider(create: (_) => di.sl<CredentialCubit>()),
        BlocProvider(create: (_) => di.sl<UserCubit>()),
        BlocProvider(create: (_) => di.sl<GetSingleUserCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram Clone',
        darkTheme: ThemeData.dark(),
        onGenerateRoute: OnGenerateRoute.route,
        initialRoute: "/",
        routes: {
          "/": (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {

                if(authState is Authenticated) {
                return MainScreen(uid: authState.uid);
                } else {
                  return SignInScreen();
                }
              },
            );
          }
        },
      ),
    );
  }
}
