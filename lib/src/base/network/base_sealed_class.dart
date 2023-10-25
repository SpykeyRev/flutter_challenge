//Generalized sealed classes for requests handling

sealed class Result<S, E extends Exception> {
  const Result();
}

final class Loading<S, E extends Exception> extends Result<S, E> {
  const Loading();
}

final class Success<S, E extends Exception> extends Result<S, E> {
  const Success(this.value);

  final S value;
}

final class Failure<S, E extends Exception> extends Result<S, E> {
  const Failure(this.value, this.exception);

  final S? value;
  final E exception;
}
