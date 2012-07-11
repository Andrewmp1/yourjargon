YJ.Router = Ember.Router.extend(
  enableLogging: true
  location: 'hash'

  root: Ember.Route.extend(
    # EVENTS
    newTerm: Ember.Route.transitionTo('terms.new')
    editTerm: Ember.Route.transitionTo('edit')
    viewTerms: Ember.Route.transitionTo('terms.index')
    cancel: Ember.Route.transitionTo('cancel')
    goHome: Ember.Route.transitionTo('home')

    home: Ember.Route.extend(
      route: '/'
      redirectsTo: 'terms.index'

      #      connectOutlets: (router) ->
      #        appController = router.get('applicationController')
      #        appController.connectOutlet(YJ.MainView)


    )

    terms: Ember.Route.extend(
      route: '/terms'

      new: Ember.Route.extend(
        #EVENTS

        route: '/new'

        connectOutlets: (router) ->
          router.get('applicationController').connectOutlet('newTerm', YJ.Term.createRecord())
      )

      index: Ember.Route.extend(
        route: '/'

        connectOutlets: (router) ->
          router.get('applicationController').connectOutlet('terms', YJ.Term.find())
      )

      edit: Ember.Route.extend(
        route: ':term_id/edit'

        connectOutlets: (router, term) ->
          router.get('applicationController').connectOutlet('editTerm', term)
      )

      #      show: Ember.Route.extend(
      #        route: ':term_id'
      #
      #        connectOutlets: (router, term) ->
      #          router.get('applicationController').connectOutlet(YJ.Term)
      #      )
    )



    #    loggedIn: Ember.Route.extend(
    #      #EVENTS
    #      logout: Ember.Route.transitionTo('loggedOut')

    #      route: '/'
    #    )
    #
    #    loggedOut: Ember.Route.extend(
    #      #EVENTS
    #      login: Ember.Route.transitionTo('loggedIn')
    #
    #      route: '/login'
    #    )

  )
)