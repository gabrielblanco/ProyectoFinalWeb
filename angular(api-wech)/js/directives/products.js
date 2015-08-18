app.directive('products', function(){
	return{
    restrict: 'E';
    scope: {
  		info: '='
  	},
    templateUrl: 'views/product.html'
  };
});