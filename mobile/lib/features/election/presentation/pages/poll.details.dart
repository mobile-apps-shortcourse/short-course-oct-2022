import 'package:flutter/material.dart';
import 'package:mobile/features/shared/presentation/manager/poll_cubit.dart';
import 'package:mobile/protos/voting.pb.dart';
import 'package:mobile/utils/constants.dart';
import 'package:shared_utils/shared_utils.dart';

// details page for [Poll]s
class PollDetailsPage extends StatefulWidget {
  final Poll poll;
  const PollDetailsPage({super.key, required this.poll});

  @override
  State<PollDetailsPage> createState() => _PollDetailsPageState();
}

class _PollDetailsPageState extends State<PollDetailsPage> {
  final _pollCubit = PollCubit();
  var _loading = false;

  @override
  void initState() {
    super.initState();
    doAfterDelay(() => _pollCubit.getPoll(id: widget.poll.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingIndicator(
        lottieAnimResource: kLoadingAnimUrl,
        isLoading: _loading,
        child: EmptyContentPlaceholder(
            title: widget.poll.title, subtitle: widget.poll.description),
      ),
    );
  }
}
