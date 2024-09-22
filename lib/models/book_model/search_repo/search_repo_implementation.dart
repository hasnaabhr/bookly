import 'package:bookly/errors/failures.dart';
import 'package:bookly/models/book_model/book_model.dart';
import 'package:bookly/models/book_model/search_repo/search_repo.dart';
import 'package:bookly/services/api_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplementation extends SearchRepo {
  ApiServices apiServices;

  SearchRepoImplementation(this.apiServices);

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedbooks(
      {required String searchText}) async {
    try {
      var data = await apiServices.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject:$searchText');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}