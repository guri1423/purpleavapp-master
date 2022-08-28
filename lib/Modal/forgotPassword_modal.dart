


class ForgotPasswordService{


  //constructor
  ForgotPasswordService({
    this.email,



  });

  String? email;



  // factory Register.fromJson(Map<String, dynamic>json) => Register();

  Map<String, dynamic> toJson() => {

    "email": email,




  };


}


