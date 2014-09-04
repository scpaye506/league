angular.module('leagueapp', ['ui.bootstrap']).controller('typeaheadController', function($scope, $http){
	$scope.selectedPlayer = {name:'', id:0};
	$scope.input = 0;

	$scope.addAlert = function(message, title, type) {
		new PNotify({
				title: title || 'Notice',
				text: message,
				type: type || '',
				animation: 'show'
			});
	};

	$scope.getPlayers = function(val) {
		return $http.get('/api/players/search.json', {
			params: {name: val}
		}).then(function(res){ console.log(res);
			return res.data.players; 
		});
	};

	$scope.createScore = function(){
		$http({
			method: 'post', 
			url: '/api/scores/create',
			data: {playerId: $scope.selectedPlayer.id, gameId: gameId, input: $scope.input}
		}).success(function(res){
			$scope.addAlert(res.message);
			$scope.selectedPlayer = {name:'', id:0};
			$scope.input = 0;
		})
	};

});