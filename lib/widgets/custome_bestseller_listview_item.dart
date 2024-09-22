import 'package:bookly/constants.dart';
import 'package:bookly/models/book_model/book_model.dart';
import 'package:bookly/widgets/custome_book_image.dart';
import 'package:bookly/widgets/rating_widget.dart';
import 'package:bookly/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          '/BookDetailsView',
          extra: bookModel,
        );
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomeBookImage(
                imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? ''),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Using Flexible to prevent overflow
                  Flexible(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        bookModel.volumeInfo.title!,
                        style: Styles.textStyle20
                            .copyWith(fontFamily: kGtSectraFine),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    bookModel.volumeInfo.authors != null
                        ? bookModel.volumeInfo.authors![0]
                        : 'Unknown Author',
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'free',
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      RatingWidget(
                        rating: bookModel.volumeInfo.averageRating ?? 0,
                        maxRating: bookModel.volumeInfo.ratingsCount ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
