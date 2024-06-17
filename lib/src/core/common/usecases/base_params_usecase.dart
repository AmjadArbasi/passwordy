abstract class BaseParamsUsecase<Type, Request> {
  Type call(Request params);
}
