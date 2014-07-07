var model = {
	user: "Adam",	
};
var sampleApp = angular.module('sampleApp', []);
sampleApp.run(function ($http) {
	$http.get("items").success(function (data) {
		model.items = data;
	});
});
sampleApp.filter("checkedItems", function () {
	return function (items, showComplete) {
		var resultArr = [];
		angular.forEach(items, function (item) {
			if (item.done == false || showComplete == true) {
			resultArr.push(item);
		}
		});
	return resultArr;
	}
});
sampleApp.controller("ToDoCtrl", function ($scope, $http) {
	$scope.todo = model;
	$scope.incompleteCount = function () {
		var count = 0;
		angular.forEach($scope.todo.items, function (item) {
			if (!item.done) { count++ }
		});
		return count;
	}
	$scope.warningLevel = function () {
		return $scope.incompleteCount() < 3 ? "label-success" : "label-warning";
	}
	$scope.addNewItem = function (actionText) {
		var new_item = { action: actionText, done: false };
		$http.post('/items', {item: new_item}).success(function(data){
			$scope.todo.items.push(data.item);
		});
	}
});