// ignore_for_file: unnecessary_this

extension PriceExtension on String {
  String toMoneyFormat() {
    final (head, tail) = this.contains('.')
        ? (this.split('.').first, this.split('.').last)
        : (this, null);
    return '\$${addCommas(head)}${getTail(tail)}';
  }
}

String addCommas(String str) {
  final res = str.length > 3
      ? '${str.substring(0, 3)},${addCommas(
          str.substring(0, 3),
        )}'
      : str;
  return res;
}

String getTail(String? tail) {
  if (tail == null) {
    return '';
  } else {
    return tail.length > 2 ? '.${tail.substring(0, 2)}' : '.$tail';
  }
}
