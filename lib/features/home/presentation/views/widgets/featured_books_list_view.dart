import 'package:bookly_ebook_app/core/utils/app_router.dart';
import 'package:bookly_ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_ebook_app/features/home/presentation/manager/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_ebook_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late final ScrollController _scrollController;
  int nextPage = 1;
  bool isLoading = false;


  @override
  void initState()
  {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() async
  {
    var currentPosition = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;

    if(currentPosition >= 0.7 * maxScrollLength)
    {
      if(!isLoading)
      {
        isLoading = true;
        await BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks(
          pageNumber: nextPage++,
        );
        isLoading = false;
      }
    }
  }

  @override
  void dispose()
  {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.276,
      child: ListView.builder(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index)
        {
          return Padding(
            padding: const EdgeInsets.only(
              right: 15,
            ),
            child: GestureDetector(
              child: CustomBookItem(
                aspectRatio: 0.69 / 1,
                image: widget.books[index].image ?? 'https://diybookcovers.com/wp-content/uploads/2023/07/scifi4thumb.jpg',
              ),
              onTap: () {
                GoRouter.of(context).push(AppRouter.kBookDetailsView,
                  extra: widget.books[index],
                );
              },
            ),
          );
        },
        itemCount: widget.books.length,
      ),
    );
  }
}
