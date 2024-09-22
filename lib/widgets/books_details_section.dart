import 'package:bookly/models/book_model/book_model.dart';
import 'package:bookly/widgets/books_action.dart';
import 'package:bookly/widgets/custome_book_image.dart';
import 'package:bookly/widgets/rating_widget.dart';
import 'package:bookly/widgets/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child:  CustomeBookImage(
            imageUrl:
               bookModel.volumeInfo.imageLinks?.thumbnail??'',
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Text(
         bookModel.volumeInfo.title!,
          style: Styles.textStyle30.copyWith(fontStyle: FontStyle.italic),
       textAlign: TextAlign.center,
       
        ),
        const SizedBox(
          height: 10,
        ),
        Opacity(
          opacity: .8,
          child: Text(
            bookModel.volumeInfo.authors?[0]??'',
            style: Styles.textStyle18.copyWith(
                color: const Color(0xffFFD5AC), fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
         RatingWidget(
          rating:bookModel.volumeInfo.averageRating ?? 0,
          maxRating: bookModel.volumeInfo.ratingsCount ?? 0,
        ),
        const SizedBox(
          height: 20,
        ),
         BooksAction(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
