
import 'package:code_quest/modules/prepare_screen/prepare_cubit.dart';
import 'package:code_quest/modules/prepare_screen/prepare_model.dart';

sealed class PrepareState {}

final class PrepareInitial extends PrepareState {}

final class PrepareLoading extends PrepareState {}

final class PrepareLoaded extends PrepareState {
  final List<PrepareModel> coursePrepare;
  PrepareLoaded({required this.coursePrepare});
}

final class PrepareFailuer extends PrepareState {
  final String error;
  PrepareFailuer({required this.error});
}
