import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    _profiledpc =
        (await secureStorage.getString('ff_profiledpc'))?.ref ?? _profiledpc;
    _promptdoc =
        (await secureStorage.getString('ff_promptdoc'))?.ref ?? _promptdoc;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  DocumentReference? _profiledpc;
  DocumentReference? get profiledpc => _profiledpc;
  set profiledpc(DocumentReference? _value) {
    _profiledpc = _value;
    _value != null
        ? secureStorage.setString('ff_profiledpc', _value.path)
        : secureStorage.remove('ff_profiledpc');
  }

  void deleteProfiledpc() {
    secureStorage.delete(key: 'ff_profiledpc');
  }

  DocumentReference? _promptdoc =
      FirebaseFirestore.instance.doc('/prompt/9TGHKfRg67ZObI2zKMLU');
  DocumentReference? get promptdoc => _promptdoc;
  set promptdoc(DocumentReference? _value) {
    _promptdoc = _value;
    _value != null
        ? secureStorage.setString('ff_promptdoc', _value.path)
        : secureStorage.remove('ff_promptdoc');
  }

  void deletePromptdoc() {
    secureStorage.delete(key: 'ff_promptdoc');
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await write(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await write(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await write(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await write(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await write(key: key, value: ListToCsvConverter().convert([value]));
}
