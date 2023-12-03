class Car {
  String model;
  int year;
  double rentPerday;
  String image;

  Car(this.model, this.year, this.rentPerday, this.image);

  @override
  String toString() {
    return '$model-$year';
  }
}

List<Car> cars = [
  Car('BMW', 2015, 20,
      'https://images.unsplash.com/photo-1605034647753-3c296f848a2d?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Ym13JTIwMjAxNXxlbnwwfHwwfHx8MA%3D%3D'),
  Car('Mercedes', 2016, 40,
      'https://images.unsplash.com/photo-1553440569-bcc63803a83d?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8bWVyY2VkZXN8ZW58MHx8MHx8fDA%3D'),
  Car('Volvo', 2017, 20,
      'https://images.unsplash.com/photo-1629897048514-3dd7414fe72a?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8dm9sdm98ZW58MHx8MHx8fDA%3D'),
  Car('Toyota', 2022, 50,
      'https://images.unsplash.com/flagged/photo-1564153296137-400b51e1ff6d?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHRveW90YXxlbnwwfHwwfHx8MA%3D%3D'),
];
