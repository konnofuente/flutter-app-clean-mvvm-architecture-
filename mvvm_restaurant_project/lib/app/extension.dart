// extension on string

extension NonNullString on String {
  String orEmpty() {
    // ignore: unnecessary_null_comparison
    if (this == null) {
      return " ";
    }
    return this;
  }
}

extension NonNullInteger on int {
  int orZero() {
    if (this == null) {
      return 0;
    }
    return this;
  }
}



