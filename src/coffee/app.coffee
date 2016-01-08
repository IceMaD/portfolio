angular = require 'angular'

portfolio = angular.module 'IceMaD.Portfolio', []

# Routing
portfolio.config require './routing.coffee'

portfolio.directive 'terminal', require './terminal/TerminalDirective.coffee'

portfolio.factory 'LineManager', require './terminal/LineManager.coffee'
portfolio.factory 'WordFormatter', require './terminal/WordFormatter.coffee'
portfolio.factory 'TerminalState', require './terminal/TerminalState.coffee'

portfolio.service 'PromptHistory', require './terminal/PromptHistory.coffee'
portfolio.service 'Commands', require './terminal/Commands.coffee'
