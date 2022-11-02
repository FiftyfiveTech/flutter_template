import 'package:dartz/dartz.dart';
import 'package:core/error/failure.dart';
import '../../model/movie.dart';

abstract class GetMoviesUseCase {
  Future<Either<Failure, Movie>> getMovies();
}
