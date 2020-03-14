class InputValidates {

  static String validInput(String data, [int size=3, int limit=20]) {
    if (data.trim().isEmpty) {
      return "El campo es requerido";
    } else {
      if (data.length < size) {
        return 'Debe contener mas de $size caracteres';
      } else if (data.length > limit){
        return 'Debe ser inferior a $limit caracteres';
      }else{
        return null;
      }
    }
  }

}