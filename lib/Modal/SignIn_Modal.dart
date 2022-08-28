


class Login{


  //constructor
  Login({
    this.email,
    this.password,
    this.role,


  });

  String? email;
  String? password;
  String? role;


  // factory Register.fromJson(Map<String, dynamic>json) => Register();

  Map<String, dynamic> toJson() => {

    "email": email,
    "password": password,
    "role": role



  };


}


