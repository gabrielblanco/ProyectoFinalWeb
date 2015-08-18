var app = angular.module('WEchangeApp', ['ngRoute']);

app.config(function ($routeProvider) { 
  $routeProvider 
    .when('/products/', { 
      controller: 'ProductController', 
      templateUrl: 'views/product.html' 
    })
    .when('/users/', {  // /users/:id
      controller: 'UserController', 
      templateUrl: 'views/user.html'
    })
    .when('/transactions/', { 
      controller: 'TransactionController', 
      templateUrl: 'views/transaction.html'
    })
    .otherwise({ 
      redirectTo: '/' 
    }); 
});