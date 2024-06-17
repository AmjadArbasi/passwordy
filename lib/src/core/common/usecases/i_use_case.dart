abstract class IUseCase<Type, Input> {
  Type call(Input params);
}
