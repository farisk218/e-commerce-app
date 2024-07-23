import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/utils/api_client.dart';
import '../../../core/constants/enums.dart';
import '../models/category/category.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.apiClient) : super(const HomeState());

  final ApiClient apiClient;

  Future<void> fetchCategories() async {
    emit(state.copyWith(categoryFetchStatus: DataStatus.loading));
    try {
      final response = await apiClient.apiCall(
        method: ApiMethod.get,
        endpoint: '/categories',
      );

      final categories = (response.data as List)
          .map((json) => Category.fromJson(json))
          .toList();

      emit(state.copyWith(
          categoryFetchStatus: DataStatus.success, categories: categories));
    } catch (e) {
      emit(state.copyWith(
          categoryFetchStatus: DataStatus.failed, errorMessage: e.toString()));
    }
  }
}
