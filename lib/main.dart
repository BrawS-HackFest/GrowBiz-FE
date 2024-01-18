import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackfest_mobile/bloc/article/article_bloc.dart';
import 'package:hackfest_mobile/bloc/auth/auth_bloc.dart';
import 'package:hackfest_mobile/bloc/course/course_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hackfest_mobile/bloc/payment/payment_bloc.dart';
import 'package:hackfest_mobile/firebase_options.dart';
import 'package:hackfest_mobile/pages/splash_page.dart';
import 'package:hackfest_mobile/repository/article_repository.dart';
import 'package:hackfest_mobile/repository/course_repository.dart';
import 'package:hackfest_mobile/repository/payment_repository.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(),),
        BlocProvider(create: (context) => CourseBloc(courseRepository: CourseRepository())),
        BlocProvider(create: (context) => PaymentBloc(paymentRepository: PaymentRepository())),
        BlocProvider(create: (context) => ArticleBloc(articleRepository: ArticleRepository())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          useMaterial3: true,
          brightness: Brightness.light
        ),
        home: const SplashPage(),
      ),
    );
  }
}

