import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mobile/features/shared/domain/repositories/auth.dart';
import 'package:mobile/features/shared/domain/repositories/user.dart';
import 'package:mobile/protos/auth.pbgrpc.dart';
import 'package:shared_utils/shared_utils.dart';

class UserCubit extends Cubit<BlocState> {
  UserCubit() : super(BlocState.initialState());
  final _authRepo = AuthRepository(), _userRepo = UserRepository();
  StreamSubscription? _currentUserListener;

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

  @override
  Future<void> close() async {
    await _currentUserListener?.cancel();
    return super.close();
  }
}
