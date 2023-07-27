import 'package:domain/model/movie.dart';
import 'package:dartz/dartz.dart';
import 'package:core/error/failure.dart';
import 'package:domain/repository/movies/get_movies_respository.dart';
import 'package:riverpod/riverpod.dart';
import '../../network/network_service.dart';

final getMoviesRepositoryProvider =
    Provider<GetMoviesRepository>((_) => GetMoviesRepositoryImpl());

class GetMoviesRepositoryImpl extends GetMoviesRepository {
  @override
  Future<Either<Failure, Movie>> getMovies() async {
    var response = await Api().apiCall('/fact', null, null, RequestType.GET);
    //await Api().apiCall('movie/latest', null, null, RequestType.GET);

    print(response);

    //return Left("sd");
    //return Movie.fromJson(response);
    late Movie movie;
    bool isData = false;
    response?.when(success: (data) {
      print('Message Success ' + data.toString());
      //return Right(Movie.fromJson(data));
      movie = Movie.fromJson(data);
      isData = true;
    }, error: (message) {
      print('Message ERROR ' + message);
      // return Left(message);
    }, loading: (message) {
      //return Left(message);
    });

    if (isData) {
      return Right(movie);
    } else {
      return Left(ServerFailure("Failure", 101));
    }
  }
}
