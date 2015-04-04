define ->
	class Controller
		constructor: (@repository) ->
		addItem: =>
			@repository.addItem()
	return Controller