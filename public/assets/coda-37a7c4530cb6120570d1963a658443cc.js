$(function(){$(".date_has_event").each(function(){var t=10,e=250,i=0,n=null,s=!1,o=!1,a=$(this),r=$(".events ul",this).css("opacity",0);$([a.get(0),r.get(0)]).mouseover(function(){n&&clearTimeout(n),s||o||(s=!0,r.css({bottom:20,left:-76,display:"block"}).animate({bottom:"+="+t+"px",opacity:1},e,"swing",function(){s=!1,o=!0}))}).mouseout(function(){n&&clearTimeout(n),n=setTimeout(function(){n=null,r.animate({bottom:"-="+t+"px",opacity:0},e,"swing",function(){o=!1,r.css("display","none")})},i)})})});