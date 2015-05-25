Hexagon = () ->
  templateUrl: 'directive/Hexagon.html'
  replace: true
  restrict: 'E'
  scope:
    image: '='
    imageWidth: '='

module.exports = Hexagon;
