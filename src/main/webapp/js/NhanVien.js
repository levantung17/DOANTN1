const $button = document.querySelector("#sidebar-toggle");
const $wrapper = document.querySelector("#wrapper");

$button.addEventListener("click", (e) => {
    e.preventDefault();
    $wrapper.classList.toggle("toggled");
});

var app = angular.module("myApp", []);
app.controller("myCtrl", function ($scope, $interval, $filter) {
    $scope.TimeNow = new Date().toLocaleTimeString();
    $interval(function () {
        $scope.TimeNow = new Date().toLocaleTimeString();
    }, 1000);
});

//Tree view
var toggler = document.getElementsByClassName("caret");
var i;

for (i = 0; i < toggler.length; i++) {
    toggler[i].addEventListener("click", function() {
    this.parentElement.querySelector(".nested").classList.toggle("active");
    this.classList.toggle("caret-down");
    });
}

// L