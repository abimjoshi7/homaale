import 'package:dependencies/dependencies.dart';

import '../../../../../core/constants/enums.dart';
import '../../data/model/post_support_ticket.dart';

class PostSupportTicketState extends Equatable {
  final TheStates? theState;
  final PostSupportTicket? postSupportTicket;

  const PostSupportTicketState({
    this.theState,
    this.postSupportTicket,
  });
  PostSupportTicketState copyWith({
    TheStates? theState,
    PostSupportTicket? postSupportTicket,
  }) {
    return PostSupportTicketState(
      theState: theState ?? this.theState,
      postSupportTicket: postSupportTicket ?? this.postSupportTicket,
    );
  }

  @override
  List<Object?> get props {
    return [
      theState,
      postSupportTicket,
    ];
  }
}
