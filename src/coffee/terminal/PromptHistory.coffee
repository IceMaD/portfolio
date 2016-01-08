module.exports = [()->

  return {
    list: ['demo', 'color winter']
    current: 0
    enabled: false

    push: (prompt) ->
      this.list.unshift(prompt) unless this.list[0] == prompt
      this

    getCurrent: ->
      return '' unless this.enabled

      this.list[this.current]

    getPrevious: ->
      this.current += 1 if this.current < this.list.length-1 && this.enabled
      this.enabled = true

      this.getCurrent()

    getNext: ->
      this.enabled = this.current != 0
      this.current -= 1 if this.current > 0

      this.getCurrent()

    resetCurrent: ->
      this.current = 0
      this.enabled = false
  }
]
