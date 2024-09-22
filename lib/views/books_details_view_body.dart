// ignore_for_file: prefer_const_constructors

import 'package:bookly/models/book_model/book_model.dart';
import 'package:bookly/widgets/books_details_appbar.dart';
import 'package:bookly/widgets/books_details_section.dart';
import 'package:bookly/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BooksDetailsViewBody extends StatelessWidget {
  const BooksDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers:  [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  CustomeBookDetailsAppBar(),
                  SizedBox(
                    height: 30,
                  ),
                  BookDetailsSection(
                    bookModel: bookModel,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SimilarBooksSection()
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
