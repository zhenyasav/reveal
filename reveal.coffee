animation = 500
domBreak = 300
reactivity = true
transitions = ['fade', 'slide']

delay = (d, f) -> Meteor.setTimeout f, d

Template.reveal.rendered = ->
	
	root = $ @firstNode
	root.addClass t for t in transitions
	container = $ root?[0]?.children?[0]
	revealedView = null

	data = null

	if root and container
		@autorun =>	
			d = Template.parentData 0
			transition = d?.transition ? 'fade slide'
			react = d?.reactive ? reactivity
			newd = if 'data' of d then d.data else data
			return if newd is data
			data = newd
			
			root.removeClass('show').addClass 'hide'
			delay animation, =>
				
				transitionClasses = _.intersection transitions, transition.split(' ')
				for trans in transitions
					root.toggleClass trans, trans in transitionClasses

				if react
					Blaze.remove revealedView if revealedView?
					revealedView = Blaze.renderWithData @view.templateContentBlock, data, container[0]
				else
					html = Blaze.toHTMLWithData @view.templateContentBlock, data
					container.empty().html html

				root.removeClass 'hide'
				delay domBreak, => root.addClass 'show'

Template.reveal.helpers

	transition: -> @transition ? 'fade slide'




