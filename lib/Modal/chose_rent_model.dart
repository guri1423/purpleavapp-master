
class RentOptionsModel{
 final String title;
 const RentOptionsModel(this.title);


 static const List<RentOptionsModel>list=[
   RentOptionsModel("Three day Rental Price"),
   RentOptionsModel("Weekend Special"),
   RentOptionsModel("One day Price"),
   RentOptionsModel("Two day Rental Price"),
   RentOptionsModel("Three day Rental Price"),
   RentOptionsModel("Three day Rental Price"),

 ];
}


class RentPackageModel{
final String title;
const RentPackageModel(this.title);

static const List<RentPackageModel>list =[
  RentPackageModel("Package1"),
  RentPackageModel("Package2"),
];
}



class RentDeliveryModel{
  final String title;
  const RentDeliveryModel(this.title);

  static const List<RentDeliveryModel>list =[
    RentDeliveryModel("Pick Up"),
    RentDeliveryModel("Shipping"),
  ];
}

