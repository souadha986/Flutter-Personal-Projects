abstract class CategoriesStates {}

class CategoryInitialState extends CategoriesStates {}

class CategoryLoadingState extends CategoriesStates {}

class CategoryLoadedState extends CategoriesStates {
  final List<String> categories;
  CategoryLoadedState(this.categories);
}

class CategoryErrorState extends CategoriesStates {
  final String error;
  CategoryErrorState(this.error);
}
