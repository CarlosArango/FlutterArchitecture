import 'package:bloc/bloc.dart';
import 'package:flutter_fetch/modules/users/blocs/fetch_users/fetch_users_event.dart';
import 'package:flutter_fetch/modules/users/blocs/fetch_users/fetch_users_state.dart';
import 'package:flutter_fetch/resources/repositories/users_repo.dart';

class FetchUsersBloc extends Bloc<FetchUsersEvent, FetchUsersState> {
  final UsersRepo _usersRepo;

  FetchUsersBloc({usersRepo}) : _usersRepo = usersRepo ?? UsersRepo();

  @override
  FetchUsersState get initialState => FetchUsersState();

  @override
  Stream<FetchUsersState> mapEventToState(FetchUsersEvent event) async* {
    if (event is ButtonPressedFetchUserEvent) {
      try {
        yield FetchUsersState(status: FetchUserStatus.loading);
        print("Mensage antes de peticion ");
        final users = await _usersRepo.getUsers();
        print("Mensage despues de peticion ");

        yield FetchUsersState(status: FetchUserStatus.success, users: users);
      } catch (e) {
        yield state.copyWith(
          status: FetchUserStatus.failure,
          message: e.toString(),
        );
      }
    }
  }
}
