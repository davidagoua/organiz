

class Authentifier{

  static Authentifier _instance = null;
  static int userId = null;

  factory Authentifier(){
    if(_instance == null){
      _instance = Authentifier();
    }
    return _instance;
  }

  static bool isAuthenticated(){
    return userId != null;
  }

  static void login(id){
    userId = id;
  }
}