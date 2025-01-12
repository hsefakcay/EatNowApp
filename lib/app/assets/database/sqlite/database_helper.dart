import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  // Private constructor
  DatabaseHelper();

  // Private database name
  static final String _databaseName = "yemek_soyle.sqlite";

  // Logger instance
  static final Logger _logger = Logger();

  // Access database with compute for async byte reading
  static Future<Database> accesToDatabase() async {
    String databasePath = join(await getDatabasesPath(), _databaseName);

    if (await databaseExists(databasePath)) {
      _logger.d("Veritabanı var. Kopyalamaya gerek yok.");
    } else {
      // `rootBundle.load` çağrısı ana iş parçacığında yapılır
      ByteData data = await rootBundle.load("database/$_databaseName");
      List<int> bytes = data.buffer.asUint8List(); // Convert ByteData to List<int> (on main thread)

      // Isolated iş parçacığında işlemler için compute kullanılır
      bytes = await compute(_writeDatabaseBytes, bytes);

      await File(databasePath).writeAsBytes(bytes, flush: true);
      _logger.d("Veritabanı kopyalandı.");
    }
    return openDatabase(databasePath);
  }

// Compute ile bağımsız işlemleri çalıştıran yöntem
  static Future<List<int>> _writeDatabaseBytes(List<int> bytes) async {
    // Özel bir işlem yapılmıyorsa, bu işlev gerekmez
    return bytes; // Burada, sadece bağımsız bir işlem döndürülür
  }
}
