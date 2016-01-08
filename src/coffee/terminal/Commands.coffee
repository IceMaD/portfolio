module.exports = ['WordFormatter', 'TerminalState', (word, terminal)->

  me =
    firstName: 'Marc'
    name: 'Duboc'
    pseudo: 'icemad'
    job: 'Developer ' + word('link')('https://www.smartangels.fr/', '@SmartAngels')
    email: 'marc.duboc@smartangels.fr'
    github: word('link')('https://github.com/IceMaD')

  colors = ['default', 'winter', 'summer', 'autumn']

  alias = (name) ->
    {
      exec: ->
        commands[name].exec.apply(name, arguments)

      help: 'Alias of ' + word('emphasis')(name)
    }

  commands = {
    man:
      exec: (command) ->

        return word('warning')('Unknown command "' + word('emphasis')(command) + '" !') if command? and !commands[command]?

        return word('info')(commands[command][if commands[command].man then 'man' else 'help']) if command?

        word('text')('Pass a command name, or try ' + word('info')('list') + ' command')

      help: 'Some help about a command'

      man: """
        Take one argument, the command name.

        Display informations about how to use a given command

        Example: #{word('emphasis')('man name')}
        """

    help: alias('man')

    list:
      exec: ->
        commandList = []

        for name, command of commands
          commandList.push(word('text')(name + ': ' + word('info')(command.help))) if command.help

        commandList.sort()

      help: 'List all commands'

    pseudo:
      exec: ->
        [
          word('info')(' _____         __  __       _____'),
          word('info')('|_   _|       |  \\/  |     |  __ \\'),
          word('info')('  | |  ___ ___| \\  / | __ _| |  | |'),
          word('info')('  | | / __/ _ \\ |\\/| |/ _` | |  | |'),
          word('info')(' _| || (_|  __/ |  | | (_| | |__| |'),
          word('info')('|_____\\___\\___|_|  |_|\\__,_|_____/')
        ]

      help: 'Tell you my pseudo'

    julien:
      exec: ->
        [
          word('smell')('░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░')
          word('smell')('░░░░░░░░░░░░░░░▓████████▓░░░░░░░░░░░░░░░░')
          word('smell')('░░░░░░░░░░░░░░▒█████████▓▒░░░░░░░░░░░░░░░')
          word('smell')('░░░░░░░░░░░░░░░▓██▓▓▓▓▓▓███░░░░░░░░░░░░░░')
          word('smell')('░░░░░░░░░░░░░░░▓██▓▓▓▓▓▓▓██▓░░░░░░░░░░░░░')
          word('smell')('░░░░░░░░░░░░░░░░▓█▓▓▓▓▓▓▓▓█▓░░░░░░░░░░░░░')
          word('smell')('░░░░░░░░░░░░░░░░▓█▓▓▓▓▓▓▓▓█▓▒░░░░░░░░░░░░')
          word('smell')('░░░░░░░░░░░░░░░▓██▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░')
          word('smell')('░░░░░░░░░░░▒▓▓█████▓▓▓▓▓▓▓▓██▓░░░░░░░░░░░')
          word('smell')('░░░░░░░░░▓█████████▓▓▓▓▓▓▓▓███▓▒░░░░░░░░░')
          word('smell')('░░░░░░░░▓███▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████▓░░░░░░░░')
          word('smell')('░░░░░░▒████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███▓░░░░░░░')
          word('smell')('░░░░░░▓██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓░░░░░░')
          word('smell')('░░░░░░▓██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓░░░░░░')
          word('smell')('░░░░░░███▓▓▓█████▓▓▓▓▓▓▓█████▓▓▓██▓░░░░░░')
          word('smell')('░░░░░░████▓█▓░░▒▓▓▓▓█▓██▓░░▒▓█▓███▓░░░░░░')
          word('smell')('░░░░░▒█████▓░░░░▒▓█████▓░░░░▒▓█████▒░░░░░')
          word('smell')('░░░░▓████▓▒░░▒█░░░▓███▒░░▒▓░░░▓█████▓░░░░')
          word('smell')('░░▒▓███▓▓▓░░░██▒░░▒▓█▓░░░▓█▓░░░▓▓▓███▓▒░░')
          word('smell')('░▓████▓▓▓▓▓░░░░░░░▓▓▓▓▒░░░░░░░▓▓▓▓▓████░░')
          word('smell')('░███▓▓▓▓▓▓▓▓▒░░░▓▓▓▓▓▓▓▓▒░░░▓▓▓▓▓▓▓▓▓██▓░')
          word('smell')('░███▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓░')
          word('smell')('░███▓▓▓▓▓░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░▓▓▓▓██▓░')
          word('smell')('░███▓▓▓▓▓░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░▓▓▓▓██▓░')
          word('smell')('░███▓▓▓▓▓▓░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░▓▓▓▓▓██▓░')
          word('smell')('░█████▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░▓▓▓▓▓▓▓███▒░')
          word('smell')('░▒█████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███▓█░░')
          word('smell')('░░░▓████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████▒░░░')
          word('smell')('░░░░▒▓█████████████████████████████▓▒░░░░')
          word('smell')('░░░░░▒▓███████████████████████████▓░░░░░░')
        ]

    details:
      exec: ->
        word('dump')(me)

      help: 'Tell you all my details'

    demo:
      exec: ->
        [
          word('data')('Example of data line')
          word('warning')('Example of warning line')
          word('emphasis')('Example of emphasis line')
          word('error')('Example of error line')
          word('info')('Example of info line')
          word('smell')('Example of smell line')
          word('success')('Example of success line')
        ]

    theme:
      exec: (color) ->
        return word('error')('Unknown theme "' + word('emphasis')(color) + '" !') unless colors.indexOf(color) >= 0

        return word('warning')('Already on the ' + terminal.color + ' theme') unless color != terminal.color

        terminal.color = color

        word('info')('Color changed to theme ' + terminal.color + ' !')

      help: 'Change the color of the terminal.'

      man: """
        Change the color of the terminal.

        Available themes : #{colors.join(', ')}

        Example: #{word('emphasis')('theme winter')}
        """

    color: alias('theme')

    name:
      exec: ->
        [word('info')(me.firstName + ' ' + me.name)]

      help: 'Tell you my name'

    whoami:
      exec: ->
        [word('info')(me.pseudo)]

      help: 'Tell you my username'

    job:
      exec: ->
        [word('info')(me.job)]

      help: 'Tell you my job'
  }

  return commands;
]
