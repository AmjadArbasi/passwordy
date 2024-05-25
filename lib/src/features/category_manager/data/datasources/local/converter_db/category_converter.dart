import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';

class CategoryConverterDbDTOModel {
  CategoryConverterDbDTOModel({required CatchwordConverterDbDTOModel converter})
      : _converter = converter;

  final CatchwordConverterDbDTOModel _converter;

  CategoryDbDto categoryModelToDbDto(CategoryModel model) {
    return CategoryDbDto(
      id: model.id,
      categoryName: model.categoryName,
      total: model.total,
    );
  }

  Future<CategoryModel> categoryDbDtoToModel(
      CategoryDbDto categoryDbDto) async {
    final catchwords = <CatchwordModel>[];

    for (var catchword in categoryDbDto.catchwords) {
      catchwords.add(await _converter.convertDbDtoToModel(catchword));
    }

    return CategoryModel(
      id: categoryDbDto.id,
      categoryName: categoryDbDto.categoryName,
      catchwords: catchwords,
      total: categoryDbDto.total,
    );
  }
}
