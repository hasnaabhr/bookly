import 'package:bookly/function/launch_url.dart';
import 'package:bookly/models/book_model/book_model.dart';
import 'package:bookly/widgets/custome_button.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: CustomeButton(
            textColor: Colors.black,
            backgroundcolor: Color(0xffFFD5AC),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            text: 'free',
          ),
        ),
        Expanded(
          child: CustomeButton(
            onPressed: ()  {
              launchCustomUrl(context, bookModel.volumeInfo.previewLink!);
            },
            textColor: const Color(0xffFFD5AC),
            backgroundcolor: Colors.black,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            text: getText(bookModel),
          ),
        ),
      ],
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
