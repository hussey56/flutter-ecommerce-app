class HFirebaseExceptions implements Exception{
  final String code;

  HFirebaseExceptions(this.code);

  String get message{
    switch(code){
      case "":
        return"";
      default:
        return " firebase exception something went wrong with firebase";
    }
  }
}