import 'package:equatable/equatable.dart';

import '../../../core/constants/enums.dart';
import '../models/category/category.dart';

class HomeState extends Equatable {
  final DataStatus categoryFetchStatus;
  final List<Category>? categories;
  final String? errorMessage;

  const HomeState({
    this.categoryFetchStatus = DataStatus.idle,
    this.categories,
    this.errorMessage,
  });

  HomeState copyWith({
    DataStatus? categoryFetchStatus,
    List<Category>? categories,
    String? errorMessage,
  }) {
    return HomeState(
      categoryFetchStatus: categoryFetchStatus ?? this.categoryFetchStatus,
      categories: categories ?? this.categories,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [categoryFetchStatus, categories, errorMessage];
}
