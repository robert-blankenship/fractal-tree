// Generated by CoffeeScript 1.10.0
(function() {
  var FractalController, canvas, clearCanvas, context, drawBranch;

  drawBranch = function(context, levelsRemaining, branchWidth, branchLength, branchOriginX, branchOriginY, branchAngle) {
    var branchEndX, branchEndY;
    context.beginPath();
    context.moveTo(branchOriginX, branchOriginY);
    branchEndX = branchOriginX + Math.cos(branchAngle) * branchLength;
    branchEndY = branchOriginY + Math.sin(branchAngle) * branchLength;
    context.lineWidth = branchWidth;
    context.lineTo(branchEndX, branchEndY);
    context.stroke();
    if (levelsRemaining > 0) {
      drawBranch(context, levelsRemaining - 1, branchWidth * 0.75, branchLength * 0.75, branchEndX, branchEndY, branchAngle + Math.PI / 6);
      return drawBranch(context, levelsRemaining - 1, branchWidth * 0.75, branchLength * 0.75, branchEndX, branchEndY, branchAngle - Math.PI / 6);
    }
  };

  canvas = document.getElementById('canvas');

  canvas.width = 600;

  canvas.height = 400;

  context = canvas.getContext('2d');

  FractalController = function($scope) {
    $scope.fractalOptions = {
      trunkWidth: 10,
      trunkLength: 90,
      levels: 10
    };
    $scope.drawImage = function() {
      clearCanvas(canvas, context);
      return drawBranch(context, $scope.fractalOptions.levels, $scope.fractalOptions.trunkWidth, $scope.fractalOptions.trunkLength, canvas.width / 2, canvas.height, -Math.PI / 2);
    };
    return $scope.drawImage();
  };

  clearCanvas = function(canvas, context) {
    return context.clearRect(0, 0, canvas.width, canvas.height);
  };

  angular.module('Application', ['ngMaterial']).controller('FractalController', FractalController);

}).call(this);
