import 'package:flutter_application_passmanager/src/core/utils/converter_db/converter.dart';
import 'package:flutter_application_passmanager/src/features/category_manager/category_manager.dart';

class CategoryModelToDbDtoConverter
    implements Converter<CategoryModel, CategoryDbDto> {
  @override
  CategoryDbDto convert(CategoryModel model) {
    return CategoryDbDto(
      id: model.id,
      categoryName: model.categoryName,
      total: model.total,
    );
  }
}

class CategoryDbDtoToModelConverter
    implements Converter<CategoryDbDto, CategoryModel> {
  CategoryDbDtoToModelConverter(this._converter);

  final CatchwordDbDtoToModelConverter _converter;

  @override
  CategoryModel convert(CategoryDbDto model) {
    final catchwords = model.catchwords
        .map(
          (e) => _converter.convert(e),
        )
        .toList();
    return CategoryModel(
      id: model.id,
      categoryName: model.categoryName,
      catchwords: catchwords,
      total: model.total,
    );
  }
}
