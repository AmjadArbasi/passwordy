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

  CategoryModel categoryDbDtoToModel(
      CategoryDbDto categoryDbDto, String key, String iv) {
    final catchwords = categoryDbDto.catchwords
        .map((e) => _converter.convertDbDtoToModel(e, key, iv))
        .toList();

    return CategoryModel(
      id: categoryDbDto.id,
      categoryName: categoryDbDto.categoryName,
      catchwords: (catchwords),
      total: categoryDbDto.total,
    );
  }
}
