$(document).ready ->
  # Hover over purpose
  $('body').on 'mouseenter ', '.purpose:not(.selected-purpose)', () -> $(@).find('.icon').attr 'class', (i, c) ->
       return c.replace(/_icon/, '_icon_hover');
  $('body').on 'mouseleave ', '.purpose:not(.selected-purpose)', ()  -> $(@).find('.icon').attr 'class', (i, c) ->
       return c.replace(/_hover/g, '');
  
  # Click on purpose
  $('body').on 'click', '.purpose', ->
    # Clean selected and hover
    $('.purpose').removeClass('selected-purpose')
    $('.icon').attr 'class', (i, c) ->
       return c.replace(/_hover/g, '');
    # Add selected and hover to selected element
    $(@).addClass('selected-purpose')
    $(@).find('.icon').attr 'class', (i, c) ->
       return c.replace(/_icon/, '_icon_hover');
    # Set value in form
    console.log $(@).attr('id')
    $('#purpose').val($(@).attr('id'))
  
