import 'package:equatable/equatable.dart';
import 'package:flutter_fetch/models/user.dart';

enum FetchUserStatus { loading, success, failure }

class FetcUsersState extends Equatable {
  final List<User> users;
  final FetchUserStatus status;
  final String message;

  const FetcUsersState({this.users, this.status, this.message});

  @override
  List<Object> get props => [users, status, message];
}
