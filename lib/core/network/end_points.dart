class ApiEndpoints {
  static String baseUrl = 'https://api.escuelajs.co';
  static String signInEndPoint = '/api/v1/auth/login';
  static String signUpEndPoint = '/api/v1/users/';
  static String getCategoriesEndPoint = '/api/v1/categories/';
  static String getProductsEndPoint = '/api/v1/products/';
  static String getCategoryProductsEndPoint() {
    return '/api/v1/products/';
  }
}

class ApiKeys {
  static String status = 'statusCode';
  static String errMessage = 'ErrorMessage';
  static String email = 'email';
  static String name = 'name';
  static String phone = 'phone';
  static String password = 'password';
  static String confirmPassword = 'confirmPassword';
  static String location = 'location';
  static String profilePic = 'avatar';
  static String token = 'access_token';
  static String refreshToken = 'refresh_token';
  static String id = 'id';
  static String message = 'message';
}
