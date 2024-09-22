import 'package:bookly/errors/failures.dart';
import 'package:bookly/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> fetchSearchedbooks(
      {required String searchText});
}