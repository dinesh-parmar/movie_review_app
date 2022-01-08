extension IntDuration on int {
  Duration get seconds => Duration(seconds: this);
  Duration get milliseconds => Duration(milliseconds: this);
  Duration get hours => Duration(hours: this);
  Duration get days => Duration(hours: this);
}

extension ImageLinkX on String {
  getImageLink([int? width]) => 'https://image.tmdb.org/t/p/${(width != null ? 'w' + width.toString() : 'original')}' + this;
}
