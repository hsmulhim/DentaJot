part of 'name_cubit.dart';

@immutable
sealed class NameState {}

final class NameInitial extends NameState {}


final class NameSuccess extends NameState {
final List BootCamps;
NameSuccess({required this.BootCamps});

}

final class NameFailed extends NameState {
 final String error;
 NameFailed({required this.error});

}