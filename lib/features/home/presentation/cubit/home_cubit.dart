// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'home_state.dart';

// class HomeCubit extends Cubit<HomeState> {
//   final NetworkHelper networkHelper;
//   HomeCubit({
//     required this.networkHelper,
//   }) : super(HomeInitial());

//   Future<void> fetchHeroCategory() async {
//     try {
//       final x = await networkHelper.getTaskHeroCategoryList();
//       emit(
//         CategoriesLoadSuccess(
//           heroCategory: x,
//         ),
//       );
//     } catch (e) {
//       emit(
//         CategoriesLoadFailure(),
//       );
//     }
//   }
// }
