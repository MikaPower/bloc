import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<ItemModel>();



  //Stream com todos os filmes
  Observable<ItemModel> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {

      //vai buscar filmes todos os filmes
    ItemModel itemModel = await _repository.fetchAllMovies();


    //Adiciona filmes ao stream
    _moviesFetcher.sink.add(itemModel);
  }


  //fecha stream
  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();