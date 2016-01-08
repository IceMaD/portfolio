module.exports = ['$sce', ($sce)->

  Text = (text) ->
    this.text = text
    this.html = ->
      $sce.trustAsHtml(this.text)
    this.toString = ->
      this.text

    this

  _formatter = (type) ->

    switch type
      when 'link' then return (url, name) ->
        name = url unless angular.isDefined(name)

        new Text('<a href="' + url + '" target="_blank" class="terminal_word --link">' + name + '</a>')

      when 'dump' then return (object) ->
        response = []

        for field, value of object
          response.push new Text(field + ': ' + _formatter('info')(value))

        response

      when 'text' then return (text) ->
        new Text(text)

      else return (text) ->
        return new Text('<span class="terminal_word --' + type + '">' + text + '</span>')

  Formatter = ->
    _formatter

  return new Formatter();
]
