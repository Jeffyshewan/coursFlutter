/// count : 671
/// pages : 34
/// next : "https://rickandmortyapi.com/api/character/?page=2"
/// prev : null

class Info_characters {
  int? _count;
  int? _pages;
  String? _next;
  dynamic? _prev;

  int? get count => _count;
  int? get pages => _pages;
  String? get next => _next;
  dynamic? get prev => _prev;

  Info_characters({
      int? count, 
      int? pages, 
      String? next, 
      dynamic? prev}){
    _count = count;
    _pages = pages;
    _next = next;
    _prev = prev;
}

  Info_characters.fromJson(dynamic json) {
    _count = json['count'];
    _pages = json['pages'];
    _next = json['next'];
    _prev = json['prev'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['count'] = _count;
    map['pages'] = _pages;
    map['next'] = _next;
    map['prev'] = _prev;
    return map;
  }

}