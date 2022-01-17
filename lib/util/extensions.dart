extension ImageLinkX on String {
  getImageLink([int? width]) => 'https://image.tmdb.org/t/p/${(width != null ? 'w' + width.toString() : 'original')}' + this;
}

extension IntExtension on int {
  getDuration() {
    final int hour = this ~/ 60;
    final int minutes = this % 60;
    return '${hour < 10 ? hour.toString().padLeft(2, '0') : hour.toString()}h ${minutes < 10 ? minutes.toString().padLeft(2, '0') : minutes.toString()}m';
  }
}
