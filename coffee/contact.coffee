$(document).ready ->
  $('body').on 'click', '.purpose', ->
    $('.purpose').removeClass('selected-purpose')
    $('.purpose').attr 'class', (i, c) ->
       return c.replace(/_hover/g, '');
    $(@).addClass('selected-purpose')
    $(@).attr 'class', (i, c) ->
       return c.replace(/_icon/, '_icon_hover');    
  
