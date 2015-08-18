app.controller('ProductController', ['$scope', 'product', '$routeParams', function($scope, product, $routeParams) {
  product.success(function(data) {
    $scope.product = data[$routeParams.id];
  });
}]);