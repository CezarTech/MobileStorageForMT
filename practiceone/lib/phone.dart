class Phone {
  String model;
  double price;
  String image;
  bool protectionscreen = false;
  int warrenty =1;
  
  Phone(this.model, this.price, this.image);

  @override
  String toString() {
    return 'Model: $model';
  }
}

List<Phone> phones = [
  Phone('Phone 1', 100,
      'https://images.unsplash.com/photo-1671726203454-5d7a5370a9f4?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxzZWFyY2h8MXx8c3R1ZGVudHxlbnwwfHwwfHx8MA%3D%3D'),
  Phone('Phone 2', 200,
      'https://images.unsplash.com/photo-1671726203454-5d7a5370a9f4?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxzZWFyY2h8MXx8c3R1ZGVudHxlbnwwfHwwfHx8MA%3D%3D'),
  Phone('Phone 3', 300,
      'https://images.unsplash.com/photo-1671726203454-5d7a5370a9f4?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxzZWFyY2h8MXx8c3R1ZGVudHxlbnwwfHwwfHx8MA%3D%3D'),
];
