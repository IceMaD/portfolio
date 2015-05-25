Experience = ($scope) ->

  $scope.activeDate = 2009

  $scope.dates = [
    id: 2009
    title: 'october 2009 – august 2013'
    description: """
      I was in sandwich training at CFA'com for two degrees: CAP and BAC pro.
      Graphist for a company called Egeme two weeks out of three.
      Learning useless stuff the rest of the time.
      Anyway, this was my first job experience.
      """
  ,
    id: 2013
    title: 're'
    description: 'alalala'
  ,
    id: 2014
    title: 're'
    description: 'alalala'
  ,
    id: 2015
    title: 're'
    description: 'alalala'
  ]

  $scope.selectDate = (date) ->
    $scope.activeDate = date.id

module.exports = ['$scope', Experience]
