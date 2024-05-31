import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';

class CategoryConverterDbDTOModel {
  CategoryConverterDbDTOModel({
    required CatchwordConverterDbDTOModel converter,
  }) : _converter = converter;

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
    final catchwords = categoryDbDto.catchwords
        .map((e) async => await _converter.convertDbDtoToModel(e))
        .toList();

    return CategoryModel(
      id: categoryDbDto.id,
      categoryName: categoryDbDto.categoryName,
      catchwords: await Future.wait(catchwords),
      total: categoryDbDto.total,
    );
  }
}
