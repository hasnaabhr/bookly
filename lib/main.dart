import 'package:bookly/constants.dart';
import 'package:bookly/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/models/book_model/repos/home_repo_implementation.dart';
import 'package:bookly/service_locator.dart';
import 'package:bookly/widgets/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBlC1WJpYo1nALs02-lVRyZV170ZZqo5QI",
            authDomain: "bookly-31472.firebaseapp.com",
            projectId: "bookly-31472",
            storageBucket: "bookly-31472.appspot.com",
            messagingSenderId: "1045583776896",
            appId: "1:1045583776896:web:3bac8fb42160e91094ea65"));
  } else {
    await Firebase.initializeApp();
  }
 setup();
  runApp(const BookVoyage());
}

class BookVoyage extends StatelessWidget {
  const BookVoyage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
     providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImplementation>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getIt.get<HomeRepoImplementation>(),
          )..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}


