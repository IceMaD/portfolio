module.exports = ['LineManager', 'PromptHistory', 'TerminalState', '$timeout', (Line, PromptHistory, state, $timeout)->
  {
    templateUrl: 'terminal/terminal.html'
    replace: true
    restrict: 'E'
    scope: {}
    link: (scope, element, attrs) ->

      input = element.find('input')[0]

      refresh = ->
        scope.prompt = ''

        $timeout ->
          element[0].scrollTop = element[0].scrollHeight

      selectPrompt = ->
        $timeout ->
          input.setSelectionRange(scope.prompt.length, scope.prompt.length) if scope.prompt

      $timeout ->
        return false if scope.lines.length or scope.prompt

        Line.handle 'basic-tuto', (lines) ->

          for line in lines
            scope.lines.push line

          refresh()

      , 5000

      scope.lines = []

      scope.focus = (event) ->
        input.focus() if event.target == element[0]

      scope.getClass = ->
        return if state.color then '--' + state.color else false

      scope.onKeyDown = (event) ->
        switch event.which
          when 38 then scope.prompt = PromptHistory.getPrevious(); selectPrompt()
          when 40 then scope.prompt = PromptHistory.getNext(); selectPrompt()

        if event.ctrlKey && event.which == 76
          event.preventDefault()
          this.lines = []

      scope.submit = ->

        return unless scope.prompt

        Line.handle scope.prompt, (lines) ->

          for line in lines
            scope.lines.push line

          refresh()
  }
]
