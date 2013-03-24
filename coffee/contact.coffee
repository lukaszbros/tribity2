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
  
  #submit form
  $('body').on 'submit', '#contact_form_form', (event) ->
    event.preventDefault()
    $.post 'mailing.php', $(@).serialize(), (data) ->
      if (data == 'success')
        alert('Thank you for sending your project information. We will contact you back as soon as possible.');
      else
        alert('There was a problem with sending your project information. You can contact us directly on office@tribity.com');
  
