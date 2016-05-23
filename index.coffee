
drawBranch = (context, branchWidth, branchLength, branchOriginX, branchOriginY, branchAngle) ->
    context.beginPath()
    context.moveTo(branchOriginX, branchOriginY)
    branchEndX = branchOriginX + Math.cos(branchAngle) * branchLength
    branchEndY = branchOriginY + Math.sin(branchAngle) * branchLength
    context.lineWidth = branchWidth
    context.lineTo(branchEndX, branchEndY)
    context.stroke()
    
    if branchWidth >= 0.5
        childBranchWidth = branchWidth * 0.75
        childBranchLength = branchLength * 0.75

        drawBranch(context, childBranchWidth, childBranchLength, branchEndX, branchEndY, branchAngle + Math.PI / 6)
        drawBranch(context, childBranchWidth, childBranchLength, branchEndX, branchEndY, branchAngle - Math.PI / 6)

canvas = document.getElementById 'canvas'
canvas.width = 600
canvas.height = 400
context = canvas.getContext '2d'

FractalController = ($scope) ->
    $scope.fractalOptions = {}
    $scope.fractalOptions.trunkWidth = 10
    $scope.fractalOptions.trunkLength = 90

    $scope.drawImage = ->
        clearCanvas(canvas, context)
        drawBranch(
            context,
            $scope.fractalOptions.trunkWidth,
            $scope.fractalOptions.trunkLength,
            canvas.width / 2, canvas.height,
            - Math.PI/2)
        console.log "Drawing finished"

    $scope.drawImage()

clearCanvas = (canvas, context) ->
    context.clearRect(0, 0, canvas.width, canvas.height);

angular.module 'Application', ['ngMaterial']
    .controller 'FractalController', FractalController
