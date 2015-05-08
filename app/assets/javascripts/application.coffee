#= require es5-shim
#= require es6-shim
#= require jquery2
#= require lodash
#= require angular
#= require angular-ui-router
#= require angular-classy
#= require hamlcoffee

#= require_self

#= require_tree ./lib
#= require_tree ./config
#= require_tree ./controllers
#= require_tree ./directives
#= require_tree ./templates
#= require_tree ./factories

#= require routes
#= require helpers

@Application = angular.module 'Application', [
  'classy'
  'ui.router'
]

$(document).ready ->
  console.info "let's start!"
