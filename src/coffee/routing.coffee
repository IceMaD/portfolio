Routing = ($stateProvider, $urlRouterProvider) ->

  $urlRouterProvider.otherwise "/about-me"

  $stateProvider

    .state 'about-me',
      url: "/about-me"
      templateUrl: "partials/AboutMe.html"
      controller: 'AboutMe'

    .state 'skills',
      url: "/skills"
      templateUrl: "partials/Skills.html"
      controller: 'Skills'

    .state 'experience',
      url: "/experience"
      templateUrl: "partials/Experience.html"
      controller: 'Experience'

    .state 'realisations',
      url: "/realisations"
      templateUrl: "partials/Realisations.html"
      controller: 'Realisations'

    .state 'hire',
      url: "/hire"
      templateUrl: "partials/Hire.html"
      controller: 'Hire'

module.exports = ['$stateProvider', '$urlRouterProvider', Routing];
