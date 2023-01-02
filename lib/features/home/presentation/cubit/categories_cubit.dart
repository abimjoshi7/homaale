// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/networking/models/response/task_category.dart';
import 'package:cipher/networking/network_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final NetworkHelper networkHelper;
  CategoriesCubit(
    this.networkHelper,
  ) : super(CategoriesInitial());

  Future<void> fetchAllCategories() async {
    try {
      emit(
        CategoriesInitial(),
      );
      final x = await networkHelper.getTaskCategoryList();
      emit(
        CategoriesSuccess(
          taskCategoryList: x,
        ),
      );
    } catch (e) {
      emit(
        CategoriesFailure(),
      );
      rethrow;
    }
  }
}
