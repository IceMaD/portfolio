nl2br = ($sce) ->
  (input) ->
    if input != undefined
      $sce.trustAsHtml input.replace /\n/g, '<br/>'

module.exports = ['$sce', nl2br]
