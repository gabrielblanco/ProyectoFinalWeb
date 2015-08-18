app.controller('TransactionController', ['$scope', 'transactions', '$routeParams', function($scope, transactions, $routeParams) {
  transactions.success(function(data) {
    $scope.transaction = data[$routeParams.id];
  });
}]);