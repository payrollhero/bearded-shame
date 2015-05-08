Application.factory 'massageResource', ($http) ->
  apiRequestUrl = Application.helpers.apiRequestUrl

  list: () ->
    promise = $http(
      url: apiRequestUrl('/massages')
      method: 'GET'
    )
    promise.then (response) ->
      response.data

  get: () ->
    promise = $http(
      url: apiRequestUrl('/user/massage')
      method: 'GET'
    )
    promise.then (response) ->
      response.data || 0

  set: (id) ->
    promise = $http(
      url: apiRequestUrl("/user/massage/#{id}")
      method: 'PUT'
    )
    promise.then (response) ->
      response.data
