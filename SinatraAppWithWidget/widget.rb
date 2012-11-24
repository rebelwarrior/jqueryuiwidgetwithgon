require 'sinatra'
require 'gon-sinatra' #allows me to pass @variables to js.
Sinatra::register Gon::Sinatra

before do
  @params = params
  if settings.environment === :development || settings.environment === :test
    @jsonp_url = 'http://localhost:3000/articles.json'
  else
    halt  
  end  
end
 
get "/" do
  gon.jsonp_url = @jsonp_url
  erb :index
end

__END__

@@layout

<!DOCTYPE html>
<head>
  <meta charset="utf-8" />
  <title>Modal Window with JQuery UI</title>
  <%= include_gon %>
</head>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
<link href="css/flick/jquery-ui-1.9.1.custom.css" rel="stylesheet">
<script type="text/javascript" src="widget.js"></script>


<html>
  <%= yield%>
</html>
  
@@index
 <style type=text/css>
    div.ui-dialgo-titlebar {
      font-size : 10px;
    }
 </style>
 
 <div id="dialog" title="Modal Window">
   <p id="content"> Articles: <br/> </p>
 </div>
 
 <input id='open' type=button value=Open>
 