import 'package:core/error/failure.dart';
import 'package:domain/model/movie.dart';
import 'package:domain/usecases/movie/get_movies_usecase.dart';
import 'package:domain/usecases/movie/get_movies_usecase_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dartz/dartz.dart';

final moviesProvider = FutureProvider<Either<Failure, Movie>>((ref) async {
  final movies = ref.watch(getMoviesUseCaseProvider);

  //List<Movie> list = [];
  var movie = movies.getMovies();

  return movie;
});

final moviesViewModelProvider =
    Provider((ref) => MoviesViemodel(ref.watch(getMoviesUseCaseProvider)));

class MoviesViemodel extends ChangeNotifier {
  final GetMoviesUseCase usecase;

  MoviesViemodel(this.usecase);

  // Result use case No.1
  late Movie _movie;

  Movie get movies => _movie;

  Future<void> fetchNews() {
    print('in fetchNews');
    return usecase.getMovies().then((value) {
      value.fold(
          (l) => print('Error in Viewmodel received'), (r) => _movie = r);
    }).whenComplete(() => (notifyListeners));

    // return usecase
    //     .getMovies()
    //     .then((value) {
    //       if(value.isRight( _movie = value)})
    //     })
    //     .whenComplete(notifyListeners);
  }
}
