import 'package:flutter/material.dart';

enum ResultType {
  SUCCESS,
  ERROR,
}

@immutable
class ApiResult<T, E> {
  ResultType resultType;
  T? data;
  E? error;

  ApiResult.success({required data})
      : data = data,
        error = null,
        resultType = ResultType.SUCCESS;

  ApiResult.error({required errorMessage})
      : error = errorMessage,
        data = null,
        resultType = ResultType.ERROR;

  T get requiredData => data!;
  E get requiredError => error!;
}
