import 'package:bookly/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/widgets/custome_book_image.dart';
import 'package:bookly/widgets/custome_error_widget.dart';
import 'package:bookly/widgets/custome_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
      if (state is FeaturedBooksSuccess) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.books.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              
              // ignore: prefer_const_constructors
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child:  GestureDetector
                (
                  onTap: (){
                     GoRouter.of(context).push(
          '/BookDetailsView',
          extra: state.books[index],
        );
                  },
                  child: CustomeBookImage( 
                    imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail??'',
                  ),
                ),
              );
            },
          ),
        );
      } else if (state is FeaturedBooksFailure) {
        return CustomeErrorWidget(errMessage: state.errMessage);
      }
      else{
        return const CustomeLoadingIndcator();

      }
    });
  }
}

