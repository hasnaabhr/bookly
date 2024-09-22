import 'package:bookly/widgets/similar_books_list_view.dart';
import 'package:bookly/widgets/styles.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column( 
      children: [ 
        Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'You Can Also Read',
                      style: Styles.textStyle18.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SimilarBooksListView()
      ],
    );
  }
}