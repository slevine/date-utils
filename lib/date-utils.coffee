formatDate = (date) ->
  timeStamp = [(date.getMonth() + 1), date.getDate(),date.getFullYear()].join("/")
  RE_findSingleDigits = /\b(\d)\b/g

  timeStamp = timeStamp.replace( RE_findSingleDigits, "0$1" )
  timeStamp.replace /\s/g, ""

dayOfWeek = (date) ->
  weekday = new Array(7)
  weekday[0] = "Sunday"
  weekday[1] = "Monday"
  weekday[2] = "Tuesday"
  weekday[3] = "Wednesday"
  weekday[4] = "Thursday"
  weekday[5] = "Friday"
  weekday[6] = "Saturday"
  weekday[date.getMonth()]

module.exports =
  activate: ->
    atom.workspaceView.command "date-utils:insert", => @insert()

  insert: ->
    now = new Date
    selection = atom.workspace.getActiveEditor().getSelection()
    selection.insertText("### " + dayOfWeek(now) + " " + formatDate now)
