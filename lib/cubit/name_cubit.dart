import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'name_state.dart';

class NameCubit extends Cubit<NameState> {
  NameCubit() : super(NameInitial());

  nameChanged({List? BootCamps}){
    try {
      emit(NameSuccess(BootCamps: []));
    } catch (error) {
      emit(NameFailed(error: error.toString()));
    }
  }
}
