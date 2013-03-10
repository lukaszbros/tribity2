$(document).ready ->
  
  #Home page load
  $('#main_content').load 'contact.html', ->
    $(@).fadeIn('fast')
  
  #Load page animation function
  loadContent = (address) ->
    $('footer').fadeOut 'fast'
    $('#main_content').fadeOut 'fast', ->
      $(@).load address, ->
        $(@).fadeIn('fast')
        $('footer').fadeIn 'fast'
  
  #Back to home page by clicking logo      
  $('#logo').click ->
    loadContent('home.html');
          
  #All links
  $('body').on 'click', 'a:not(.direct)', (event) ->
    event.preventDefault()
    href = $(@).attr("href")
    loadContent(href)
    
  $('body').on 'click', '.project', ->
    loadContent('work-' + $(@).attr('id') + '.html')
