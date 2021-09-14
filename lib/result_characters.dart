/// id : 1
/// name : "Rick Sanchez"
/// status : "Alive"
/// species : "Human"
/// type : ""
/// gender : "Male"
/// origin : {"name":"Earth","url":"https://rickandmortyapi.com/api/location/1"}
/// location : {"name":"Earth","url":"https://rickandmortyapi.com/api/location/20"}
/// image : "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
/// episode : ["https://rickandmortyapi.com/api/episode/1","https://rickandmortyapi.com/api/episode/2",null]
/// url : "https://rickandmortyapi.com/api/character/1"
/// created : "2017-11-04T18:48:46.250Z"

class Result_characters {
  int? _id;
  String? _name;
  String? _status;
  String? _species;
  String? _type;
  String? _gender;
  Origin? _origin;
  Location? _location;
  String? _image;
  List<String>? _episode;
  String? _url;
  String? _created;

  int? get id => _id;
  String? get name => _name;
  String? get status => _status;
  String? get species => _species;
  String? get type => _type;
  String? get gender => _gender;
  Origin? get origin => _origin;
  Location? get location => _location;
  String? get image => _image;
  List<String>? get episode => _episode;
  String? get url => _url;
  String? get created => _created;

  Result_characters({
      int? id, 
      String? name, 
      String? status, 
      String? species, 
      String? type, 
      String? gender, 
      Origin? origin, 
      Location? location, 
      String? image, 
      List<String>? episode, 
      String? url, 
      String? created}){
    _id = id;
    _name = name;
    _status = status;
    _species = species;
    _type = type;
    _gender = gender;
    _origin = origin;
    _location = location;
    _image = image;
    _episode = episode;
    _url = url;
    _created = created;
}

  Result_characters.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _status = json['status'];
    _species = json['species'];
    _type = json['type'];
    _gender = json['gender'];
    _origin = json['origin'] != null ? Origin.fromJson(json['origin']) : null;
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _image = json['image'];
    _episode = json['episode'] != null ? json['episode'].cast<String>() : [];
    _url = json['url'];
    _created = json['created'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['status'] = _status;
    map['species'] = _species;
    map['type'] = _type;
    map['gender'] = _gender;
    if (_origin != null) {
      map['origin'] = _origin?.toJson();
    }
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['image'] = _image;
    map['episode'] = _episode;
    map['url'] = _url;
    map['created'] = _created;
    return map;
  }

}

/// name : "Earth"
/// url : "https://rickandmortyapi.com/api/location/20"

class Location {
  String? _name;
  String? _url;

  String? get name => _name;
  String? get url => _url;

  Location({
      String? name, 
      String? url}){
    _name = name;
    _url = url;
}

  Location.fromJson(dynamic json) {
    _name = json['name'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }

}

/// name : "Earth"
/// url : "https://rickandmortyapi.com/api/location/1"

class Origin {
  String? _name;
  String? _url;

  String? get name => _name;
  String? get url => _url;

  Origin({
      String? name, 
      String? url}){
    _name = name;
    _url = url;
}

  Origin.fromJson(dynamic json) {
    _name = json['name'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }

}