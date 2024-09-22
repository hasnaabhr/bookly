import 'package:bookly/widgets/bestseller_listview.dart';
import 'package:bookly/widgets/featured_books_listview.dart';
import 'package:bookly/widgets/styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              // CustomeSearchTextField(),
              // SizedBox(height: 20),
              FeaturedBooksListView(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text('Newest Books',
                    // textAlign: TextAlign.start,
                    style: Styles.textStyle18),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: NewestListView(),
          ),
        )
      ],
    );
  }
}
