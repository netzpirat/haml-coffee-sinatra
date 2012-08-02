#= require hamlcoffee
#= require_tree ./templates
#= require_self

window.onload = ->
  document.getElementById('target').innerHTML = JST['hello_haml_coffee']({ name: 'visitor' })
