void main() {
    var errorTypes = <String>[];

    errorTypes.add("Wrong Password");
    errorTypes.add("There is no username");
    errorTypes.add("Internet Connection is failed");

    for (String error in errorTypes){
      print(error);
    }
}