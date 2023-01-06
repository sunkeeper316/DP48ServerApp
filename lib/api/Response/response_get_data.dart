import 'dart:convert';
class ResponseGetData {
  int? _error;
  List<Data>? _data;

  ResponseGetData({int? error, List<Data>? data}) {
    if (error != null) {
      this._error = error;
    }
    if (data != null) {
      this._data = data;
    }
  }

  int? get error => _error;
  set error(int? error) => _error = error;
  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;

  ResponseGetData.fromJson(Map<String, dynamic> json) {
    _error = json['error'];
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this._error;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? _packetId;
  String? _index;
  String? _id;
  String? _nid;
  String? _tareWeight;
  String? _netWeight;
  String? _height;
  String? _bmi;
  String? _time;

  Data(
      {int? packetId,
        String? index,
        String? id,
        String? nid,
        String? tareWeight,
        String? netWeight,
        String? height,
        String? bmi,
        String? time}) {
    if (packetId != null) {
      this._packetId = packetId;
    }
    if (index != null) {
      this._index = index;
    }
    if (id != null) {
      this._id = id;
    }
    if (nid != null) {
      this._nid = nid;
    }
    if (tareWeight != null) {
      this._tareWeight = tareWeight;
    }
    if (netWeight != null) {
      this._netWeight = netWeight;
    }
    if (height != null) {
      this._height = height;
    }
    if (bmi != null) {
      this._bmi = bmi;
    }
    if (time != null) {
      this._time = time;
    }
  }

  int? get packetId => _packetId;
  set packetId(int? packetId) => _packetId = packetId;
  String? get index => _index;
  set index(String? index) => _index = index;
  String? get id => _id;
  set id(String? id) => _id = id;
  String? get nid => _nid;
  set nid(String? nid) => _nid = nid;
  String? get tareWeight => _tareWeight;
  set tareWeight(String? tareWeight) => _tareWeight = tareWeight;
  String? get netWeight => _netWeight;
  set netWeight(String? netWeight) => _netWeight = netWeight;
  String? get height => _height;
  set height(String? height) => _height = height;
  String? get bmi => _bmi;
  set bmi(String? bmi) => _bmi = bmi;
  String? get time => _time;
  set time(String? time) => _time = time;

  Data.fromJson(Map<String, dynamic> json) {
    _packetId = json['packet_id'];
    _index = json['index'];
    _id = json['id'];
    _nid = json['nid'];
    _tareWeight = json['tare_weight'];
    _netWeight = json['net_weight'];
    _height = json['height'];
    _bmi = json['bmi'];
    _time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['packet_id'] = this._packetId;
    data['index'] = this._index;
    data['id'] = this._id;
    data['nid'] = this._nid;
    data['tare_weight'] = this._tareWeight;
    data['net_weight'] = this._netWeight;
    data['height'] = this._height;
    data['bmi'] = this._bmi;
    data['time'] = this._time;
    return data;
  }
}