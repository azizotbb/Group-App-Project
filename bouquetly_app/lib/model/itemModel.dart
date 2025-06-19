class Itemmodel {
  final String image;
  final String name;
  final int price;

  Itemmodel({required this.image, required this.name, required this.price});
}

List<Itemmodel> itemdata = [
  Itemmodel(image: "assets/images/flower.png", name: "Lily Charm", price: 50),
  Itemmodel(image: "assets/images/exbo.png", name: "Pink Tulip", price: 50),
  Itemmodel(image: "assets/images/boqetex.png", name: "Blush Lily", price: 55),
  Itemmodel(image: "assets/images/boqet3.png", name: "Rose Charm", price: 40),
];
