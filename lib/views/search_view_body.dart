import 'package:bookly/widgets/custome_search_textfield.dart';
import 'package:bookly/widgets/search_result.dart';
import 'package:bookly/widgets/styles.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          CustomeSearchTextField(),
          SizedBox(
            height: 50,
          ),
          Text(
            'Results',
            style: Styles.textStyle18,
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(child: SearchResult())
        ],
      ),
    );
  }
}


