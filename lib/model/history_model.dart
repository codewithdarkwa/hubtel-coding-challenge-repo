class History {
  final String name;
  final String image;
  final String status;

  History({required this.name, required this.image, required this.status});

}

List<History> histories = [
  History(
    name: "Kwabena Uncle Ebo",
    image: "assets/mtn_logo.jpeg",
    status: "Successful",
  ),
  History(
    name: "Kwabena Uncle Ebo",
    image: "assets/absa.jpeg",
    status: "Failed",
  ),
  History(
    name: "Kwabena Uncle Ebo",
    image: "assets/mtn_logo.jpeg",
    status: "Successful",
  )
];