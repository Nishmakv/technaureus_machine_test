class Result<T> {
  final String? error;
  final T? data;
  final bool? success;

  const Result.success(this.data)
      : success = true,
        error = null;
  const Result.failure(this.error)
      : success = false,
        data = null;
}
