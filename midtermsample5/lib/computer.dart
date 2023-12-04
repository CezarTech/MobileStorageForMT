

class Computer {
  String model;
  double price;
  String image;
  bool addcase = false;
  Computer(this.model, this.price, this.image);

  String getTotalPrice() {
    int addCase = addcase ? 20 : 0;

    return (price * 1.05 + addCase).toStringAsFixed(0);
  }

  @override
  String toString() {
    return 'Model:$model';
  }
}

List<Computer> computers = [
  Computer('Computer 1', 40,
      'https://plus.unsplash.com/premium_photo-1670274606895-f2dc713f8a90?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y29tcHV0ZXJ8ZW58MHx8MHx8fDA%3D'),
  Computer('Computer 2', 20,
      'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y29tcHV0ZXJ8ZW58MHx8MHx8fDA%3D'),
  Computer('Computer 3', 10,
      'https://plus.unsplash.com/premium_photo-1670274606895-f2dc713f8a90?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y29tcHV0ZXJ8ZW58MHx8MHx8fDA%3D')
];
