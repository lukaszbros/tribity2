$(document).ready ->
  
  #Home page load
  $('#main_content').load 'work-racinglife.html', ->
    $(@).fadeIn('fast')
    
  #Select logo text depending on shown address
  selectLogo = (address)->
    switch address
      when 'home.html' then $('#logo .absolut-center').html('Tribity <span class="ux">UX</span> <span class="design">Design</span> <span class="software">Software</span>')
      when 'work.html' then $('#logo .absolut-center').html('Tribity<span class="subpage">\'s work</span>')
      when 'contact.html' then $('#logo .absolut-center').html('Tribity<span class="subpage">\'s contact</span>')
      when 'company.html' then $('#logo .absolut-center').html('Tribity<span class="subpage">\'s company</span>')
    
  #Load page animation function
  loadContent = (address) ->
    $('footer').fadeOut 'fast'
    $('#logo .absolut-center').hide("slide", { direction: "up" }, 'fast')
    $('#main_content').fadeOut 'fast', ->
      $(@).load address, ->
        $(@).fadeIn('fast')
        selectLogo(address)
        $('#logo .absolut-center').slideDown();
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
    
  #Hover efect on logo
  $('body').on 'mouseenter ', '#logo .absolut-center', () -> $(@).stop().animate({color: "#cccccc"})
  $('body').on 'mouseleave ', '#logo .absolut-center', ()  -> $(@).stop().animate({color:'#333333'})  
