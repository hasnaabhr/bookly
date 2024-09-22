import 'package:bookly/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/widgets/custome_bestseller_listview_item.dart';
import 'package:bookly/widgets/custome_error_widget.dart';
import 'package:bookly/widgets/custome_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestListView extends StatelessWidget {
  const NewestListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(
                  bookModel: state.books[index],
                ),
              );
            },
          );
        } else if (state is NewestBooksFailure) {
          return CustomeErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomeLoadingIndcator();
        }
      },
    );
  }
}
