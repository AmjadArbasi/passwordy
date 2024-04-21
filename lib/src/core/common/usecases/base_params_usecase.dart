import 'package:equatable/equatable.dart';

abstract class BaseParamsUsecase<Type, Request> {
  Type call(Request params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
