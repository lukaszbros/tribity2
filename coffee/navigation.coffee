$(document).ready ->
  
  #Home page load
  $('#main_content').load 'work-nieodpuszczaj.html', ->
    $(@).fadeIn('fast')
    
  #Select logo text depending on shown address
  selectLogo = (address)->
    switch address
      when 'home.html' then $('logo').html('Tribity <span class="ux">UX</span> <span class="design">Design</span> <span class="software">Software</span>')
      when 'work.html' then $('logo').html('Tribity<span class="grey">\'s work</span>')
    
  #Load page animation function
  loadContent = (address) ->
    $('footer').fadeOut 'fast'
    $('#logo').hide("slide", { direction: "up" }, 'fast')
    $('#main_content').fadeOut 'fast', ->
      $(@).load address, ->
        $(@).fadeIn('fast')
        selectLogo(address)
        $('#logo').slideDown();
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
