app.directive('transactions', function(){
	return{
    restrict: 'E';
    scope: {
  		info: '='
  	},
    templateUrl: 'views/transaction.html'
  };
});