import 'constants.dart';

///String extension to avoid null value
extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Constants.empty;
    } else {
      return this!;
    }
  }
}

///int extension to avoid null value
extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return Constants.zero;
    } else {
      return this!;
    }
  }
}

///double extension to avoid null value
extension NonNullDouble on double? {
  double orZeroDouble() {
    if (this == null) {
      return Constants.zeroDouble;
    } else {
      return this!;
    }
  }
}

///bool extension to avoid null value
extension NonNullBool on bool? {
  bool orFalse() {
    if (this == null) {
      return false;
    } else {
      return this!;
    }
  }
}
