var leaugeApp = angular.module('leagueapp', ['ui.bootstrap']);
leaugeApp.controller('typeaheadController', function($scope, $http){
	$scope.selectedPlayer = {name: '', id: 0};
	$scope.input = '';
	$scope.ctrl = '';

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
		}).then(function(res){
			return res.data.players; 
		});
	};

	$scope.create = function(){
		$http({
			method: 'post', 
			url: '/api/' + $scope.ctrl + '/create.json',
			data: {playerId: $scope.selectedPlayer.id, gameId: gameId, input: $scope.input}
		}).success(function(res){
			$scope.addAlert(res.message);
			$scope.selectedPlayer = {name: '', id: 0};
			$scope.input = '';
		})
	};

	$scope.init = function(ctrl) {
		$scope.ctrl = ctrl;
	};

});