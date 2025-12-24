class ProductModel {
  final String image;
  final String title;
  final double price;
  final String description;

  ProductModel({
    required this.image,
    required this.title,
    required this.price,
    required this.description,
  });

  static List<ProductModel> products = [
    ProductModel(
      image: "assets/product/product1.png",
      title: "Classic Knit Cardigan",
      price: 1212,
      description: "Soft knit cardigan with a timeless design.",
    ),
    ProductModel(
      image: "assets/product/product2.png",
      title: "Winter Wool Jacket",
      price: 1100,
      description: "Warm wool jacket perfect for cold days.",
    ),
    ProductModel(
      image: "assets/product/product3.png",
      title: "Casual Denim Shirt",
      price: 200,
      description: "Lightweight denim shirt for everyday wear.",
    ),
    ProductModel(
      image: "assets/product/product4.png",
      title: "Elegant Long Coat",
      price: 300,
      description: "Stylish long coat with a modern cut.",
    ),
    ProductModel(
      image: "assets/product/product5.png",
      title: "Summer Cotton Top",
      price: 80,
      description: "Breathable cotton top, comfortable and chic.",
    ),
    ProductModel(
      image: "assets/product/product6.png",
      title: "Minimalist Hoodie",
      price: 90,
      description: "Relaxed hoodie with a clean minimalist look.",
    ),
  ];
}
