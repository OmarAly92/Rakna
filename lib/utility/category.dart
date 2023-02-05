class Category {
  String parkImage;
  String parkingName;
  String parkingLocation;
  String parkPrice;

  Category({
    required this.parkingName,
    required this.parkingLocation,
    required this.parkImage,
    required this.parkPrice,
  });
}

List<Category> categoryList = [
  Category(
    parkingName: 'Development',
    parkingLocation: '55',
    parkImage: 'assets/icons/laptop.jpg',
    parkPrice: '10/Hours',
  ),
  Category(
    parkingName: 'Accounting',
    parkingLocation: '20',
    parkImage: 'assets/icons/accounting.jpg',
    parkPrice: '10/Hours',
  ),
  Category(
    parkingName: 'Photography',
    parkingLocation: '16',
    parkImage: 'assets/icons/photography.jpg',
    parkPrice: '10/Hours',
  ),
  Category(
    parkingName: 'Product Design',
    parkingLocation: '25',
    parkImage: 'assets/icons/design.jpg',
    parkPrice: '10/Hours',
  ),
];
