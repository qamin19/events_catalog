/// Сутність "Подія". Містить бізнес-правила:
/// заголовок не порожній, ціна й кількість місць не від'ємні,
/// квитків можна купити не менше одного і не більше, ніж є місць.
class Event {
  final String id;
  final String title;
  final String place;
  final DateTime startsAt;
  final double price; // 0 означає безкоштовно
  final int seatsLeft;

  Event({
    required this.id,
    required this.title,
    required this.place,
    required this.startsAt,
    required this.price,
    required this.seatsLeft,
  }) {
    if (title.trim().isEmpty) {
      throw ArgumentError('Назва події не може бути порожньою');
    }
    if (price < 0) {
      throw ArgumentError('Ціна не може бути від\'ємною');
    }
    if (seatsLeft < 0) {
      throw ArgumentError('Кількість місць не може бути від\'ємною');
    }
  }

  bool get isFree => price == 0;

  /// Повертає копію події після резервування квитків
  Event reserve(int count) {
    if (count < 1) {
      throw ArgumentError('Кількість квитків має бути не меншою за 1');
    }
    if (count > seatsLeft) {
      throw StateError('Недостатньо місць, залишилось: $seatsLeft');
    }
    return Event(
      id: id,
      title: title,
      place: place,
      startsAt: startsAt,
      price: price,
      seatsLeft: seatsLeft - count,
    );
  }
}
