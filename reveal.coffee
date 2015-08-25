animation = 150
domBreak = 150
reactivity = true
transitions = ['fade', 'slide']

delay = (d, f) -> Meteor.setTimeout f, d

get = (obj, path) ->
  if typeof path == 'string'
    path = path.split '.'
  if !path or !path.length
    obj
  else if path[0] of obj
    get obj[path[0]], path.slice 1


Template.reveal.rendered = ->
  
  root = $ @firstNode
  root.addClass t for t in transitions
  container = $ root?[0]?.children?[0]
  revealedView = null

  data = null

  if root and container
    @autorun => 
      d = Template.parentData 0
      return if not d?
      transition = d?.transition ? 'fade slide'
      classes = d?.classes ? ''
      react = d?.reactive ? reactivity
    
      if 'triggerProperty' of d
        n = d.triggerProperty
        o = data?.triggerProperty
        return if n is o
      else
        return if (d?.data ? d) is (data?.data ? data)
      
      data = d

      root.removeClass('show').addClass 'hide'
      delay animation, =>
        
        transitionClasses = _.intersection transitions, transition.split(' ')
        for trans in transitions
          root.toggleClass trans, trans in transitionClasses



        if react
          Blaze.remove revealedView if revealedView?
          revealedView = Blaze.renderWithData @view.templateContentBlock, (data?.data ? data), container[0]
        else
          html = Blaze.toHTMLWithData @view.templateContentBlock, data
          container.empty().html html

        root.removeClass 'hide'
        delay domBreak, => root.addClass 'show'

Template.reveal.helpers

  transition: -> @transition ? 'fade slide'




