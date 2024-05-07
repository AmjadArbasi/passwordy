import 'package:equatable/equatable.dart';

class LogActivityEntity extends Equatable {
  const LogActivityEntity({
    required this.id,
    required this.name,
    required this.operation,
    required this.pathImage,
    required this.dateTime,
  });

  final int id;
  final String name;
  final String operation;
  final String pathImage;
  final String dateTime;

  @override
  String toString() {
    return 'LogActivityEntity(id: $id, name: $name, operation: $operation, pathImage: $pathImage, dateTime: $dateTime)';
  }

  LogActivityEntity copyWith({
    int? id,
    String? name,
    String? operation,
    String? pathImage,
    String? dateTime,
  }) {
    return LogActivityEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      operation: operation ?? this.operation,
      pathImage: pathImage ?? this.pathImage,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  @override
  List<Object?> get props => [id, name, operation, pathImage, dateTime];
}
