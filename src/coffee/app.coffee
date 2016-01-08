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


window.WebFontConfig =
  google:
    families: [
      'Inconsolata:400,700:latin'
    ]


tag = document.createElement 'script'
tag.src = (if 'https:' == document.location.protocol then 'https' else 'http') + '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js'
tag.type = 'text/javascript'
tag.async = 'true'
s = document.getElementsByTagName('script')[0]
s.parentNode.insertBefore(tag, s)
