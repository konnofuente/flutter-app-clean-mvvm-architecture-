// extension on string

extension NonNullString on String {
  String orEmpty() {
    if (this == null) {
      return " ";
    }
    return this;
  }
}

extension NonNullInteger on int {
  int orZero() {
    if (this == Null) {
      return 0;
    }
    return this;
  }
}
