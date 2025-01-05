import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  // Private constructor
  DatabaseHelper._();

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
      List<int> bytes = await compute(_loadDatabaseBytes, _databaseName);
      await File(databasePath).writeAsBytes(bytes, flush: true);
      _logger.d("Veritabanı kopyalandı.");
    }
    return openDatabase(databasePath);
  }

  // Compute ile byte okuma işlemi
  static Future<List<int>> _loadDatabaseBytes(String databaseName) async {
    ByteData data = await rootBundle.load("database/$databaseName");
    return data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);
  }
}
