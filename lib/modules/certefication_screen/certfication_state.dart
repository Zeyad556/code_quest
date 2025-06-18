part of 'certfication_cubit.dart';

@immutable
sealed class CertficationState {}

final class CerteficationInitial extends CertficationState {}

final class CerteficationLoading extends CertficationState {}

final class CerteficationLoaded extends CertficationState {
  final List<CerteficationModel> Certefication;
  CerteficationLoaded(this.Certefication);
}

final class CerteficationFailure extends CertficationState {
  final String error;
  CerteficationFailure({required this.error});
}
