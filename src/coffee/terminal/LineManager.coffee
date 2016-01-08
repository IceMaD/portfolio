module.exports = ['PromptHistory', 'WordFormatter', 'Commands', (history, word, commands)->

  errors = 0

  help = ->
    return word('text')('Try ' + word('info')('list') + ' command')

  unknown = (prompt) ->
    [word('error')('Command not found "' + word('emphasis')(prompt) + '" !')]

  return {
    handle: (prompt, success) ->

      return success([help()]) if prompt == 'basic-tuto'

      cleanPrompt = String(prompt).replace(/<[^>]+>/gm, '')

      history.push(cleanPrompt)
      history.resetCurrent()

      response = [word('prompt')(cleanPrompt)]

      params = cleanPrompt.split(' ')

      command = params.shift()

      if commands[command]?
        errors = 0
        success(response.concat(commands[command].exec.apply(command, params)).concat(word('text')))
      else
        errors++
        response = response.concat(unknown(command)).concat(word('text'));

        return success(response.concat(help())) if (errors % 3 == 0)

        success(response)
  }
]
