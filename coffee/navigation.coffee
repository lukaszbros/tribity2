$(document).ready ->  
  cl = new CanvasLoader('canvasloader-container')
  cl.setColor('#dddddd')
  cl.setShape('spiral')
  cl.setDiameter(121)
  cl.setDensity(21)
  cl.setSpeed(1)
  
  getParameterByName = (name) ->
    name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]")
    regexS = "[\\?&]" + name + "=([^&#]*)"
    regex = new RegExp(regexS)
    results = regex.exec(window.location.search)
    if(results == null)
      return ""
    else
      return decodeURIComponent(results[1].replace(/\+/g, " "))
  
  runHistory = (window)->
    history = window.History;
    return false unless history.enabled
    history.Adapter.bind window,'statechange', ->
      state = History.getState()
      forward = getParameterByName('forward')
      if (forward && forward != "")
        History.pushState(null, null, forward)
        return;  
      $('#main_content').load state.url, ->        
        cl.hide()
        $(@).fadeIn('fast')      
        urlArray = state.url.split("/")
        address = urlArray[urlArray.length-1]
        _gaq.push(['_trackPageview', address]);     
        highlightMenu(address);
        $('footer').fadeIn 'fast'
      
  runHistory(window)
  
  forward = getParameterByName('forward')
  if (forward && forward != "")
    History.pushState(null, null, forward)
  else
    #Home page load
    History.pushState(null, null, 'home.html')
    
  #Select logo text depending on shown address
  #selectLogo = (address)->
  #  address = address.split("/")[-1]
  #  switch address
  #    when 'home.html' then $('#logo .absolut-center').html('Tribity <span class="ux">UX</span> <span class="design">Design</span> <span class="software">Software</span>')
  #    when 'work.html' then $('#logo .absolut-center').html('Tribity<span class="subpage"> - work</span>')
  #    when 'contact.html' then $('#logo .absolut-center').html('Tribity<span class="subpage"> - contact</span>')
  #    when 'company.html' then $('#logo .absolut-center').html('Tribity<span class="subpage"> - company</span>')
        
  highlightMenu = (address) ->
    $('#menu a').removeAttr('style');
    switch address
      when 'home.html' then 
      when 'work.html' then $('#menu a#work').stop().animate({color: "#e62799"})
      when 'company.html' then $('#menu a#company').stop().animate({color: "#00aed9"})
      when 'contact.html' then $('#menu a#contact').stop().animate({color: "#00c376"})
      else $('#menu a#work').stop().animate({color: "#e62799"})
        
    
  #Load page animation function
  loadContent = (address) ->
    state = History.getState()
    urlArray = state.url.split("/")
    if (urlArray[urlArray.length-1] == address) 
      return;      
    $('footer').fadeOut 'fast', ->
    $('#main_content').fadeOut 'fast', ->
      cl.show()
      History.pushState(null,null,address)

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
