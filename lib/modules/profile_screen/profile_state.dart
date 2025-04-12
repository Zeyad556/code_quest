part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final List<ProfileModel> profileData;
  ProfileLoaded({required this.profileData});
}

final class ProfileFailure extends ProfileState {
  final String error;
  ProfileFailure({required this.error});
}
