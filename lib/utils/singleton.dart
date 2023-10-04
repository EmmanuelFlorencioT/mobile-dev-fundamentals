class Singleton {
  static Singleton?
      _instance; //The '?' allows null values for the Singleton variable

  Singleton._internal() {
    _instance = this;
  }

  //If the Singleton has something in the cache, return that, if not add soemthing to the cache
  factory Singleton() => _instance ?? Singleton._internal();

  double latitude = 0.0;
  double longitude = 0.0;

  //Examples of variables that MUST be Initialized
  String foo = '';
  String bar = "";
  int foobar = 0;
  List bars = [];
}