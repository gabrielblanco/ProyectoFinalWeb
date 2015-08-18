app.controller('SessionController', ['$scope', 'session', '$routeParams', function($scope, session, $routeParams) {
  session.success(function(data) {
    $scope.session = data;
  });
}]);