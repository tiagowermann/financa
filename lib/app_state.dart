import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _allExpenses = prefs
              .getStringList('ff_allExpenses')
              ?.map((x) {
                try {
                  return ExpenseStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _allExpenses;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _month = 0;
  int get month => _month;
  set month(int _value) {
    _month = _value;
  }

  int _year = 0;
  int get year => _year;
  set year(int _value) {
    _year = _value;
  }

  List<int> _queryTimestamps = [];
  List<int> get queryTimestamps => _queryTimestamps;
  set queryTimestamps(List<int> _value) {
    _queryTimestamps = _value;
  }

  void addToQueryTimestamps(int _value) {
    _queryTimestamps.add(_value);
  }

  void removeFromQueryTimestamps(int _value) {
    _queryTimestamps.remove(_value);
  }

  void removeAtIndexFromQueryTimestamps(int _index) {
    _queryTimestamps.removeAt(_index);
  }

  void updateQueryTimestampsAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _queryTimestamps[_index] = updateFn(_queryTimestamps[_index]);
  }

  void insertAtIndexInQueryTimestamps(int _index, int _value) {
    _queryTimestamps.insert(_index, _value);
  }

  List<ExpenseStruct> _allExpenses = [];
  List<ExpenseStruct> get allExpenses => _allExpenses;
  set allExpenses(List<ExpenseStruct> _value) {
    _allExpenses = _value;
    prefs.setStringList(
        'ff_allExpenses', _value.map((x) => x.serialize()).toList());
  }

  void addToAllExpenses(ExpenseStruct _value) {
    _allExpenses.add(_value);
    prefs.setStringList(
        'ff_allExpenses', _allExpenses.map((x) => x.serialize()).toList());
  }

  void removeFromAllExpenses(ExpenseStruct _value) {
    _allExpenses.remove(_value);
    prefs.setStringList(
        'ff_allExpenses', _allExpenses.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromAllExpenses(int _index) {
    _allExpenses.removeAt(_index);
    prefs.setStringList(
        'ff_allExpenses', _allExpenses.map((x) => x.serialize()).toList());
  }

  void updateAllExpensesAtIndex(
    int _index,
    ExpenseStruct Function(ExpenseStruct) updateFn,
  ) {
    _allExpenses[_index] = updateFn(_allExpenses[_index]);
    prefs.setStringList(
        'ff_allExpenses', _allExpenses.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInAllExpenses(int _index, ExpenseStruct _value) {
    _allExpenses.insert(_index, _value);
    prefs.setStringList(
        'ff_allExpenses', _allExpenses.map((x) => x.serialize()).toList());
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

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
