Skills = ($scope) ->
  $scope.categories = [
    {
      name: 'PHP',
      skills: [
        {
          name: 'Symfony2',
          value: 95
        }
      ]
    },
    {
      name: 'Javascript',
      skills: [
        {
          name: 'Angular',
          value: 50
        },
        {
          name: 'Backbone',
          value: 20
        },
        {
          name: 'jQuery',
          value: 90
        }
      ]
    },
    {
      name: 'Integration',
      skills: [
        {
          name: 'HTML5',
          value: 95
        },
        {
          name: 'CSS3',
          value: 80
        }
      ]
    },
    {
      name: 'TeamWork',
      skills: [
        {
          name: 'Git',
        },
        {
          name: 'GitHub',
        },
        {
          name: 'Scrum',
        },
        {
          name: 'Trello',
        }
      ]
    }
  ]

module.exports = ['$scope', Skills];
