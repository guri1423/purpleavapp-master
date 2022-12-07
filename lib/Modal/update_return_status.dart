


class UpdateStatus{


  //constructor
  UpdateStatus({
    this.status,
    this.returnDate,



  });

  String? status;
  dynamic? returnDate;



  // factory Register.fromJson(Map<String, dynamic>json) => Register();

  Map<String, dynamic> toJson() => {

    "status": status,
    "return_date": returnDate
    ,




  };


}


