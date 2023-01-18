// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/account_settings/presentation/pages/help_legal_page/models/support_help_req.dart';
import 'package:cipher/features/account_settings/presentation/pages/help_legal_page/models/support_help_res.dart';
import 'package:cipher/features/account_settings/presentation/pages/help_legal_page/models/support_help_topics.dart';
import 'package:cipher/features/account_settings/presentation/pages/help_legal_page/repositories/support_help_repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'support_help_event.dart';
part 'support_help_state.dart';

class SupportHelpBloc extends Bloc<SupportHelpEvent, SupportHelpState> {
  final SupportHelpRepositories supportHelpRepositories;
  SupportHelpBloc(
    this.supportHelpRepositories,
  ) : super(SupportHelpInitial()) {
    on<SupportHelpInitiated>(
      (event, emit) async {
        try {
          emit(
            SupportHelpInitial(),
          );
          await supportHelpRepositories
              .addSupportHelp(event.supportHelpReq)
              .then(
            (value) {
              emit(
                SupportHelpSuccess(
                  supportHelpRes: value,
                ),
              );
            },
          );
        } catch (e) {
          emit(
            SupportHelpFailure(),
          );
        }
      },
    );
  }
}
