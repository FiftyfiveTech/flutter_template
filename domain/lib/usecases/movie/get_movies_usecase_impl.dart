import 'package:dartz/dartz.dart';
import 'package:core/error/failure.dart';
import 'package:data/repository/movies/get_movies_respository_impl.dart';
import 'package:domain/model/movie.dart';
import 'package:domain/repository/movies/get_movies_respository.dart';
import 'package:domain/usecases/movie/get_movies_usecase.dart';
import 'package:riverpod/riverpod.dart';

final moviesReporsitoryProvider = FutureProvider((ref) {
  final moviesRepository = ref.watch(getMoviesRepositoryProvider);
  return moviesRepository.getMovies();
});

final getMoviesUseCaseProvider = Provider<GetMoviesUseCase>((ref) =>
    GetMoviesUseCaseImpl(repository: ref.watch(getMoviesRepositoryProvider)));

class GetMoviesUseCaseImpl extends GetMoviesUseCase {
  final GetMoviesRepository repository;
  GetMoviesUseCaseImpl({required this.repository});

  @override
  Future<Either<Failure, Movie>> getMovies() {
    return repository.getMovies();
  }
}
