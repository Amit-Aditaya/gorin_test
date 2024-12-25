import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gorin_test/core/theme/app_colors.dart';
import 'package:gorin_test/data/data_sources/firebase_data_source.dart';
import 'package:gorin_test/data/repositories/user_repository_impl.dart';
import 'package:gorin_test/domain/use_cases/auth_use_case.dart';
import 'package:gorin_test/firebase_options.dart';
import 'package:gorin_test/presentation/providers/auth_provider.dart';
import 'package:gorin_test/presentation/providers/user_provider.dart';
import 'package:gorin_test/presentation/screens/login/login_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(392, 783),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => AppAuthProvider()),
              ChangeNotifierProvider(
                  create: (context) => UserProvider(
                      authUseCase: AuthUseCase(
                          userRepository: UserRepositoryImpl(
                              firebaseDataSource: FirebaseDataSource()))))
            ],
            child: MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                    seedColor: const Color(AppColors.primaryColor)),
                useMaterial3: true,
              ),
              home: LoginScreen(),
            ),
          );
        });
  }
}
