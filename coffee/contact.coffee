$(document).ready ->
  $('body').on 'click', '.purpose', ->
    # Clean selected and hover
    $('.purpose').removeClass('selected-purpose')
    $('.purpose').attr 'class', (i, c) ->
       return c.replace(/_hover/g, '');
    # Add selected and hover to selected element
    $(@).addClass('selected-purpose')
    $(@).attr 'class', (i, c) ->
       return c.replace(/_icon/, '_icon_hover');
    # Set value in form
    console.log $(@).attr('id')
    $('#purpose').val($(@).attr('id'))
  
