ProgressBar = () ->
  return {
    templateUrl: 'directive/ProgressBar.html',
    replace: true,
    restrict: 'E',
    scope : {
      value: '=',
      text: '='
    },
  }

module.exports = ProgressBar;
