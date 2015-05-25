angular = require('angular')

Portfolio = angular.module('Portfolio', [require('angular-ui-router'), require('angular-animate')])

# Routing
Portfolio.config(require('./routing.coffee'))

# Directive
Portfolio.directive('progressbar', require('./directive/ProgressBar.coffee'))
Portfolio.directive('timeline', require('./directive/ExperienceTimeline.coffee'))

# Controllers
Portfolio.controller('AboutMe', require('./controller/AboutMe.coffee'))
Portfolio.controller('Skills', require('./controller/Skills.coffee'))
Portfolio.controller('Experience', require('./controller/Experience.coffee'))
Portfolio.controller('Realisations', require('./controller/Realisations.coffee'))
Portfolio.controller('Hire', require('./controller/Hire.coffee'))
