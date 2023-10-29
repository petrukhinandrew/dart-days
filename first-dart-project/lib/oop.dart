class ApplierBase<R, T> {
  // generics!
  final R Function(T) func; // это же тип функции!
  const ApplierBase(this.func);

  R apply(T value) => func(value);
}

class Applier<R, T> extends ApplierBase<R, T> {
  const Applier(super.func);

  @override
  R apply(T value) {
    final R res = super.apply(value); // вызвали родительский метод
    print(func(value)); // сделали что-то еще
    //func - это всё ещё родительское поле

    return res; // сохранили сигнатуру функции
  }

  applyOn<AnotherR, AnotherT>(AnotherR Function(AnotherT) f, AnotherT val) =>
      f(val);
}
