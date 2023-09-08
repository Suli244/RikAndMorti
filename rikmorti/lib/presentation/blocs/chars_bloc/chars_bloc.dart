import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rikmorti/data/models/character_Model.dart';
import 'package:rikmorti/data/repositories/get_chars_repo.dart';

part 'chars_event.dart';
part 'chars_state.dart';

class CharsBloc extends Bloc<CharsEvent, CharsState> {
  CharsBloc({required this.repo }) : super(CharsInitial()) {
    on<GetCharsList>((event, emit) async {
     try{
      final  model = await repo.getData(name: event.name);
      emit (
        CharsSuccess(model: model),
      );
     } catch (e) {
      emit(
CharsError(),
      );
     }
    });
  }
  final GetCharsRepo repo; 
}
