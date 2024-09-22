import 'package:bookly/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/models/book_model/book_model.dart';
import 'package:bookly/models/book_model/repos/home_repo_implementation.dart';
import 'package:bookly/models/book_model/search_repo/search_repo_implementation.dart';
import 'package:bookly/service_locator.dart';
import 'package:bookly/views/book_details_view.dart';
import 'package:bookly/views/login_view.dart';
import 'package:bookly/views/search_view.dart';
import 'package:bookly/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: '/loginView',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: '/BookDetailsView',
      builder: (context, state) => BlocProvider(
        create: (context) => SimilarBooksCubit(
          getIt.get<HomeRepoImplementation>(),
        ),
        child:  BookDetailsView(bookModel: state.extra as BookModel,),
      ),
    ),
    GoRoute(
      path: '/SearchView',
       
          builder: (context, state) => BlocProvider(
          create: (context) => SearchBooksCubit(getIt.get<SearchRepoImplementation>()),
          child: const SearchView(),
        ),
      ),
      
    ],
  );
}