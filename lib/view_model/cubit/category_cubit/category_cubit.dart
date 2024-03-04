import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksb/data/model/category_model/category_model.dart';
import 'package:ksb/data/repository/category_repo/category_repo.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState>
{
  CategoryCubit(this.categoryRepo) : super(CategoryInitial());
  static CategoryCubit get(context) => BlocProvider.of(context);
  CategoryModel ? categoryModel;
  CategoryRepo categoryRepo;
  Future<void> getCategory()
  async
  {
    categoryModel = null;
    emit(CategoryLoading());
    final response = await categoryRepo.getCategories();
    response.fold((l) {
      print(l.message);
      emit(CategoryError(l.toString()));
    }, (r) {
      categoryModel = r;
      emit(CategorySuccess());
    });
  }
}
