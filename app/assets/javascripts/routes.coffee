Application.config ['$stateProvider', '$urlRouterProvider', '$locationProvider',
  ($stateProvider, $urlRouterProvider, $locationProvider) ->

# Settings
    $locationProvider
    .html5Mode(true)

    # Routes
    $urlRouterProvider.otherwise('/')

    $stateProvider
    .state 'main',
      url: '/'
      template: JST['templates/index']

    .state 'orders',
      url: '/orders'
      template: JST['templates/orders']

    .state 'user',
      url: '/user'
      template: JST['templates/user']
]
