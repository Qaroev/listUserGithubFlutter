part of 'main_service.dart';

final $MainService = BindInject(
  (i) => MainService(),
  isSingleton: true,
  isLazy: true,
);
