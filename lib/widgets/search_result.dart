import 'package:bookly/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly/widgets/custome_bestseller_listview_item.dart';
import 'package:bookly/widgets/custome_error_widget.dart';
import 'package:bookly/widgets/search_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return Column(
            children: [
              Expanded(  // Add Expanded or Flexible here
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: state.books.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: BookListViewItem(
                        bookModel: state.books[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is SearchBooksFailure) {
          return CustomeErrorWidget(errMessage: state.errMessage);
        } else {
          return const SearchImage();
        }
      },
    );
  }
}
