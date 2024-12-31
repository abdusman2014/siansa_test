// /lib/data/product_data.dart
class Product {
  final String title;
  final String id;
  final double price;
  final String description;
  final String currencyCode;

  Product({
    required this.title,
    required this.id,
    required this.price,
    required this.description,
    this.currencyCode = 'USD',
  });
}

class ProductData {
  static List<Product> getProducts() {
    return [
      Product(
        title: 'iPhone 13 Pro Max',
        id: '6463463536',
        price: 999.99,
        description:
            'Latest iPhone with A15 Bionic chip and Pro camera system.',
        currencyCode: 'USD',
      ),
      Product(
        title: 'Samsung Galaxy S21',
        id: '4363467547',
        price: 799.99,
        description:
            'Samsung flagship phone with Exynos 2100 and dynamic AMOLED screen.',
        currencyCode: 'USD',
      ),
      Product(
        title: 'Google Pixel 6',
        id: '5373464533',
        price: 599.99,
        description:
            'Google’s latest Pixel phone with Google Tensor processor.',
        currencyCode: 'USD',
      ),
      // Add more products as needed
    ];
  }
}
