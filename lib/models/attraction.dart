class Attraction {
  final int id;
  final String title;
  final String location;
  final String description;
  final String image;
  final String price;

  Attraction({
    required this.id,
    required this.title,
    required this.location,
    required this.description,
    required this.image,
    this.price = r"$25",
  });
}
