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
  
  #show dialog function
  showDialog = (message) ->
    $("#contact_message").fadeOut 'fast', ->
      $(@).html(message)
      $(@).fadeIn 'fast'      
    $('#contact_form_container').fadeOut 'fast'

  #submit form
  $('body').on 'submit', '#contact_form_form', (event) ->
    event.preventDefault()
    $.post 'mailing.php', $(@).serialize(), (data) ->    
      if (data == 'success')
        showDialog('Thank You! Your Conversation has Begun.<h2>Your message was sent successfully. We will be in touch with you shortly.</h2>');
      else
        showDialog('Sorry, there was a problem sending your message, please email us at <a href="mailto:office@tribity.com">office@tribity.com</a>');
        
  
  
