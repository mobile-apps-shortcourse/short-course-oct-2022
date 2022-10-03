import 'package:bloc/bloc.dart';
import 'package:mobile/features/shared/domain/repositories/auth.dart';
import 'package:mobile/protos/auth.pb.dart';
import 'package:shared_utils/shared_utils.dart';

class OnboardingCubit extends Cubit<BlocState> {
  OnboardingCubit() : super(BlocState.initialState());
  final _authRepo = AuthRepository();

  String? kUsername, kDisplayName, kPassword, kBio, kAvatar;
  UserType kUserType = UserType.voter;

  Future<void> updateUserProfile() async {
    emit(BlocState.loadingState());
    // todo
  }

  Future<void> createAccount() async {
    emit(BlocState.loadingState());
    // perform validation
    if (kUsername.isNullOrEmpty() ||
        kDisplayName.isNullOrEmpty() ||
        kPassword.isNullOrEmpty()) {
      emit(BlocState<String>.errorState(
          failure: 'Please complete your personal details to proceed'));
    } else if (kAvatar.isNullOrEmpty()) {
      emit(BlocState<String>.errorState(
          failure: 'A selfie is required to get started'));
    } else {
      var either = await _authRepo.createUser(
          displayName: kDisplayName ??= '',
          username: kUsername ??= '',
          password: kPassword ??= '',
          avatar: kAvatar ??= '',
          bio: kBio ??= '',
          type: kUserType);
      either.fold(
        (l) => emit(BlocState<CrowderUser>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    }
  }

  Future<void> login() async {
    emit(BlocState.loadingState());
    // todo
  }

  Future<void> logout() async {
    emit(BlocState.loadingState());
    await _authRepo.logout();
    emit(BlocState<String?>.successState(data: null));
  }

  Future<void> deleteAccount() async {
    emit(BlocState.loadingState());
    // todo
  }
}
