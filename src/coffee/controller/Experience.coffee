Experience = ($scope) ->

  $scope.activeDate = 2014

  $scope.dates = [
    id: 2009
    title: 'october 2009 – august 2013'
    description: """
      I was in sandwich training at CFA'com for two degrees: CAP and BAC pro.

      Graphist for a company called Egeme two weeks out of three, learning useless stuff the rest of the time.

      Anyway, this was my first job experience.
      """
  ,
    id: 2013
    title: 'July 2013 - July 2014'
    description: """
      A year of full time course at cifacom ( now merged with Hétic ).

      That's where I learned the basics of web developpement.
      """
  ,
    id: 2014
    title: 'August 2014 - Now'
    description: """
      Still at Hétic, but in sandwich training.

      I work at SmartAngels three weeks a month, go to school one week a month, and work as freelance for the last two weeks ( oh wait .. )
      """
  ]

  $scope.selectDate = (date) ->
    $scope.activeDate = date.id

module.exports = ['$scope', Experience]
