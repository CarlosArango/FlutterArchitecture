import 'package:equatable/equatable.dart';
import 'package:flutter_fetch/models/user.dart';

enum FetchUserStatus { loading, success, failure }

class FetchUsersState extends Equatable {
  final List<User> users;
  final FetchUserStatus status;
  final String message;

  const FetchUsersState({this.users, this.status, this.message});

  @override
  List<Object> get props => [users, status, message];

  FetchUsersState copyWith({
    List<User> users,
    FetchUserStatus status,
    String message,
  }) {
    return FetchUsersState(
      users: users ?? this.users,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
