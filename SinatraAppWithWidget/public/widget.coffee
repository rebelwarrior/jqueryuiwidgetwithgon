$ ->
  $("div#dialog").dialog
    modal : true
    autoOpen : true #false
    show : "bounce"
    hide : "puff"
    open : -> 
      $.ajax
        dataType: 'jsonp'
        url: gon.jsonp_url #url for Rail App sending jsonp
        error: (data, status, jqXHR)-> console.log("error loading Json #{data}, #{status} & #{jqXHR}")
        success: (data, status, xhr)->
          console.log("success #{data[0].name}, #{status}, #{xhr}")
          for item in data
            $('#content').append "<li>" + item.name + " <img src='" + 
              item.thumbnail + "' alt='thumbnail' /> <a href='" + item.link + "'> link </a> </li>"   
    close : ->
      $('#content').html "Articles: <br/>"
      console.log "Reset Window Content: #{$('div#content').contents()}"
  $('#open').click -> 
    $('div#dialog').dialog("open")    
  $('body').css('background', '#9999CC')

 



 


  