part of 'edit_cubit.dart';

@immutable
sealed class EditState {}

final class EditInitial extends EditState {}
final class EditSuccess extends EditState {}
final class EditFauiler extends EditState {
  final String error;
  EditFauiler({required this.error});
}
final class EditLoading extends EditState {}
