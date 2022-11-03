import 'package:bloc/bloc.dart';
import 'package:mobile/features/shared/domain/repositories/poll.dart';
import 'package:mobile/protos/voting.pb.dart';
import 'package:shared_utils/shared_utils.dart';

class PollCubit extends Cubit<BlocState> {
  PollCubit() : super(BlocState.initialState());
  final _pollRepo = PollRepository();

  Future<void> getPoll({required String id}) async {
    emit(BlocState.loadingState());
    var stream = await _pollRepo.getPoll(id: id);
    stream.listen((either) {
      either.fold(
        (l) => emit(BlocState<Poll>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });
  }

  Future<void> updatePoll({required Poll poll}) async {
    emit(BlocState.loadingState());
    var either = await _pollRepo.updatePoll(poll: poll);
    either.fold(
      (l) => emit(BlocState<Poll>.successState(data: l)),
      (r) => emit(BlocState<String>.errorState(failure: r)),
    );
  }

  Future<void> deletePoll({required String id}) async {
    emit(BlocState.loadingState());
    var either = await _pollRepo.deletePoll(id: id);
    either.fold(
      (l) => emit(BlocState<String>.successState(data: l)),
      (r) => emit(BlocState<String>.errorState(failure: r)),
    );
  }

  Future<void> getPolls([PollStatus status = PollStatus.unknown]) async {
    emit(BlocState.loadingState());
    var stream = await _pollRepo.getPolls(status: status);
    stream.listen((either) {
      either.fold(
        (l) => emit(BlocState<List<Poll>>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });
  }

  Future<void> getPollsForUser() async {
    emit(BlocState.loadingState());
    var stream = await _pollRepo.getPollsForUser();
    stream.listen((either) {
      either.fold(
        (l) => emit(BlocState<List<Poll>>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });
  }

  Future<void> getCategory({required String id}) async {
    emit(BlocState.loadingState());
    var either = await _pollRepo.getCategory(id: id);
    either.fold(
      (l) => emit(BlocState<PollCategory>.successState(data: l)),
      (r) => emit(BlocState<String>.errorState(failure: r)),
    );
  }

  Future<void> getCategoriesForPoll({required String poll}) async {
    emit(BlocState.loadingState());
    var stream = await _pollRepo.getCategoriesForPoll(poll: poll);
    stream.listen((either) {
      either.fold(
        (l) => emit(BlocState<List<PollCategory>>.successState(data: l)),
        (r) => emit(BlocState<String>.errorState(failure: r)),
      );
    });
  }

  Future<void> createPoll(Poll poll) async {
    emit(BlocState.loadingState());
    var either = await _pollRepo.createPoll(poll);
    either.fold(
      (l) => emit(BlocState<Poll>.successState(data: l)),
      (r) => emit(BlocState<String>.errorState(failure: r)),
    );
  }

  Future<void> createCategory(PollCategory category) async {
    emit(BlocState.loadingState());
    var either = await _pollRepo.createCategory(category);
    either.fold(
      (l) => emit(BlocState<PollCategory>.successState(data: l)),
      (r) => emit(BlocState<String>.errorState(failure: r)),
    );
  }

  Future<void> deleteCategory(String id) async {
    emit(BlocState.loadingState());
    var either = await _pollRepo.deleteCategory(id);
    either.fold(
      (l) => emit(BlocState<String>.successState(data: l)),
      (r) => emit(BlocState<String>.errorState(failure: r)),
    );
  }
}
