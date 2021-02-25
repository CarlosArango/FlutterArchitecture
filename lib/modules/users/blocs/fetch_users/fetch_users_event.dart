import 'package:equatable/equatable.dart';

abstract class FetchUsersEvent extends Equatable {}

class ButtonPressedFetchUserEvent extends FetchUsersEvent {
  @override
  List<Object> get props => null;
}

class LoadedUsersFetchUserEvent extends FetchUsersEvent {
  final message;
  LoadedUsersFetchUserEvent({this.message});
  @override
  List<Object> get props => [message];
}
