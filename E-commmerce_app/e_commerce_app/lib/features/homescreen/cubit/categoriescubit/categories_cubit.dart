import 'package:dartz/dartz.dart';

import 'package:e_commerce_app/features/homescreen/cubit/categoriescubit/categories_states.dart';

import 'package:e_commerce_app/features/homescreen/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit(this.homeRepo) : super((CategoryInitialState()));

  final HomeRepo homeRepo;

  Future<void> fetchcategories() async {
    emit(CategoryLoadingState());

    final Either<String, List<String>> res = await homeRepo.getCategories();
    res.fold(
      (left) {
        emit(CategoryErrorState(left));
      },
      (right) {
        emit(CategoryLoadedState(right));
      },
    );
  }
}
