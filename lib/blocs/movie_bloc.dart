import 'package:bloc_pattern_sample/models/item_model.dart';
import 'package:bloc_pattern_sample/repositories/repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc {
  final Repository _repository = Repository();
  final _moviesFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose(){
    _moviesFetcher.close();
  }

}

final bloc = MovieBloc();