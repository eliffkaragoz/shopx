class ApiConfig {
  static final ApiConfig _instance = ApiConfig._init();
  static ApiConfig get instance => _instance;
  ApiConfig._init();

  String categoriesUrl = "https://api.storerestapi.com/categories";
  String productUrl = "https://api.storerestapi.com/products";
}
