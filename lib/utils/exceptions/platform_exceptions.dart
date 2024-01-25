class HPlatformExceptions implements Exception{
  final String code;

  HPlatformExceptions(this.code);

  String get message{
    switch(code){
      case "":
        return"";
      default:
        return "something went wrong with firebase";
    }
  }
}