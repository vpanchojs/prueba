class Person{
  String idUser;
  String idTipoPerfil;
  String id_usuario;
  String id;
  String nombre_contacto;
  String nombre;
  String info;
  String colaborador;
  String telefono;
  String email;
  String direccion;
  String postal_code;
  String pais;

  Person.profile(Map data){
    idUser=data["idUser"];
    nombre_contacto=data["nombre_contacto"];
    nombre=data["nombre"];
    email=data["email"];
    direccion=data["direccion"];

  }
}