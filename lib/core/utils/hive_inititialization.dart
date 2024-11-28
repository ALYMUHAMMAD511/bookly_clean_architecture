import 'package:hive_flutter/hive_flutter.dart';
import '../../constants.dart';
import '../../features/home/domain/entities/book_entity.dart';

Future<void> setupHiveInitialization() async
{
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
}