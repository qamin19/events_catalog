/// Фільтри каталогу подій (повторюють чипи з мобільного застосунку)
enum EventFilter {
  all('Всі'),
  today('Сьогодні'),
  week('Тиждень'),
  free('Безкоштовно');

  final String label;
  const EventFilter(this.label);
}
