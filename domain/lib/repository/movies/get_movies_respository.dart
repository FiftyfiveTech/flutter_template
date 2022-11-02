import 'package:dartz/dartz.dart';
import 'package:core/error/failure.dart';
import '../../model/movie.dart';

abstract class GetMoviesRepository {
  Future<Either<Failure, Movie>> getMovies();
}
