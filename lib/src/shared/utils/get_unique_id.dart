import 'package:uuid/uuid.dart';

String getUniqueId() {
  final uniqueId = Uuid().v6();
  return uniqueId;
}
