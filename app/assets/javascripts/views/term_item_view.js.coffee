YJ.TermItemView = Ember.View.extend(
  content: null
  mouseEnter: (event) ->
    @set('hasFocus', true)
  mouseLeave: (event) ->
    @set('hasFocus', false)
  hasFocus: false
  shortDescription: Ember.computed ->
    description = this.get('content.description')
    if description && description.length > 100
      description.slice(0, 100) + '...'
    else
      description
  .property('content.description')
)