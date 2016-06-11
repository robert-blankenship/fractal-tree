
drawBranch = (context, levelsRemaining, branchWidth, branchLength, branchOriginX, branchOriginY, branchAngle) ->
    context.beginPath()
    context.moveTo(branchOriginX, branchOriginY)
    branchEndX = branchOriginX + Math.cos(branchAngle) * branchLength
    branchEndY = branchOriginY + Math.sin(branchAngle) * branchLength
    context.lineWidth = branchWidth
    context.lineTo(branchEndX, branchEndY)
    context.stroke()
    
    if levelsRemaining > 0
        drawBranch(context, levelsRemaining - 1, branchWidth * 0.75, branchLength * 0.75, branchEndX, branchEndY, branchAngle + Math.PI / 6)
        drawBranch(context, levelsRemaining - 1, branchWidth * 0.75, branchLength * 0.75, branchEndX, branchEndY, branchAngle - Math.PI / 6)

canvas = document.getElementById 'canvas'
canvas.width = 600
canvas.height = 400
context = canvas.getContext '2d'

FractalController = ($scope) ->
    $scope.fractalOptions = 
        trunkWidth: 10
        trunkLength: 90
        levels: 10
        branchesCount: Math.pow(2, 10)
    
    $scope.drawImage = ->
        $scope.fractalOptions.branchesCount = Math.pow(2, $scope.fractalOptions.levels)

        clearCanvas(canvas, context)
        drawBranch(
            context,
            $scope.fractalOptions.levels,
            $scope.fractalOptions.trunkWidth,
            $scope.fractalOptions.trunkLength,
            canvas.width / 2, canvas.height, - Math.PI/2)
    $scope.drawImage()

clearCanvas = (canvas, context) ->
    context.clearRect(0, 0, canvas.width, canvas.height);

angular.module 'Application', ['ngMaterial']
    .controller 'FractalController', FractalController
