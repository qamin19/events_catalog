import 'package:events_catalog/src/domain/entities/event.dart';

abstract interface class EventRepository {
  Future<List<Event>> getAll();
  Future<Event?> getById(String id);
  Future<void> save(Event event);
}
