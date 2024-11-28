import 'package:bookly_ebook_app/constants.dart';
import 'package:bookly_ebook_app/core/utils/app_router.dart';
import 'package:bookly_ebook_app/core/utils/service_locator.dart';
import 'package:bookly_ebook_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_ebook_app/features/home/presentation/manager/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_ebook_app/core/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/utils/hive_inititialization.dart';
import 'features/home/data/repos/home_repo_implementation.dart';
import 'features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'features/home/presentation/manager/cubits/newest_books_cubit/newest_books_cubit.dart';

void main() {

  setupHiveInitialization();
  setupServiceLocator();
  Bloc.observer = SimpleBlocObserver();

  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            FetchFeaturedBooksUseCase(getIt.get<HomeRepoImplementation>()),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            FetchNewestBooksUseCase(getIt.get<HomeRepoImplementation>()),
          )..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
