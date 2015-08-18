app.directive('users', function(){
	return{
    restrict: 'E';
    scope: {
  		info: '='
  	},
    templateUrl: 'views/user.html'
  };
});