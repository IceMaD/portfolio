Experience = ($scope) ->
  $scope.years = [
    {
      year: 2009
    },
    {
      year: 2010
    },
    {
      year: 2011
    },
    {
      year: 2012
    },
    {
      year: 2013
    },
    {
      year: 2014
    },
    {
      year: 2015
    },
  ]

  $scope.selectYear = (date) ->
    console.log(date)

module.exports = ['$scope', Experience];
