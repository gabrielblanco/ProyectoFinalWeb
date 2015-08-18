app.controller('UserController', ['$scope', 'users', '$routeParams', function($scope, users, $routeParams) {
  users.success(function(data) {
    $scope.user = data[$routeParams.id];
  });
}]);