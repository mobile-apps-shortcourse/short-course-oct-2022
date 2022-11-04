import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mobile/features/shared/domain/repositories/auth.dart';
import 'package:mobile/features/shared/domain/repositories/user.dart';
import 'package:mobile/protos/auth.pbgrpc.dart';
import 'package:shared_utils/shared_utils.dart';

class UserCubit extends Cubit<BlocState> {
  UserCubit() : super(BlocState.initialState());
  final _authRepo = AuthRepository(), _userRepo = UserRepository();
  StreamSubscription? _currentUserListener, _usersListener;

// check login status of current user
  bool get isLoggedIn => _authRepo.checkLoginStatus();

  Future<void> currentUser() async {
    emit(BlocState.loadingState());
    var stream = await _userRepo.currentUser();
    _currentUserListener = stream.listen((either) {
      either.fold(
        (l) => emit(BlocState<CrowderUser>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });
  }

  Future<void> getUser(String id) async {
    emit(BlocState.loadingState());
    var stream = await _userRepo.getUser(id: id);
    stream.listen((either) {
      either.fold(
        (l) => emit(BlocState<CrowderUser>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });
  }

  Future<void> logout() async {
    emit(BlocState.loadingState());
    await _authRepo.logout();
    emit(BlocState.successState(data: null));
  }

  @override
  Future<void> close() async {
    await _currentUserListener?.cancel();
    await _usersListener?.cancel();
    return super.close();
  }

  Future<void> getUsers(UserType type) async {
    emit(BlocState.loadingState());
    var stream = await _userRepo.getUsers(type);
    _usersListener = stream.listen((either) {
      either.fold(
        (l) => emit(BlocState<List<CrowderUser>>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });
  }
}
