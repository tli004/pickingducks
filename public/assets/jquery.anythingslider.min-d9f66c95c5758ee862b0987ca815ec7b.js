!function(t,e,i){t.anythingSlider=function(n,s){var a,o,r=this;r.el=n,r.$el=t(n).addClass("anythingBase").wrap('<div class="anythingSlider"><div class="anythingWindow" /></div>'),r.$el.data("AnythingSlider",r),r.init=function(){r.options=a=t.extend({},t.anythingSlider.defaults,s),r.initialized=!1,t.isFunction(a.onBeforeInitialize)&&r.$el.bind("before_initialize",a.onBeforeInitialize),r.$el.trigger("before_initialize",r),t('<!--[if lte IE 8]><script>jQuery("body").addClass("as-oldie");</script><![endif]-->').appendTo("body").remove(),r.$wrapper=r.$el.parent().closest("div.anythingSlider").addClass("anythingSlider-"+a.theme),r.$outer=r.$wrapper.parent(),r.$window=r.$el.closest("div.anythingWindow"),r.$win=t(e),r.$controls=t('<div class="anythingControls"></div>'),r.$nav=t('<ul class="thumbNav"><li><a><span></span></a></li></ul>'),r.$startStop=t('<a href="#" class="start-stop"></a>'),(a.buildStartStop||a.buildNavigation)&&r.$controls.appendTo(a.appendControlsTo&&t(a.appendControlsTo).length?t(a.appendControlsTo):r.$wrapper),a.buildNavigation&&r.$nav.appendTo(a.appendNavigationTo&&t(a.appendNavigationTo).length?t(a.appendNavigationTo):r.$controls),a.buildStartStop&&r.$startStop.appendTo(a.appendStartStopTo&&t(a.appendStartStopTo).length?t(a.appendStartStopTo):r.$controls),r.runTimes=t(".anythingBase").length,r.regex=a.hashTags?RegExp("panel"+r.runTimes+"-(\\d+)","i"):null,1===r.runTimes&&r.makeActive(),r.flag=!1,a.autoPlayLocked&&(a.autoPlay=!0),r.playing=a.autoPlay,r.slideshow=!1,r.hovered=!1,r.panelSize=[],r.currentPage=r.targetPage=a.startPanel=parseInt(a.startPanel,10)||1,a.changeBy=parseInt(a.changeBy,10)||1,o=(a.mode||"h").toLowerCase().match(/(h|v|f)/),o=a.vertical?"v":(o||["h"])[0],a.mode="v"===o?"vertical":"f"===o?"fade":"horizontal","f"===o&&(a.showMultiple=1,a.infiniteSlides=!1),r.adj=a.infiniteSlides?0:1,r.adjustMultiple=0,a.playRtl&&r.$wrapper.addClass("rtl"),a.buildStartStop&&r.buildAutoPlay(),a.buildArrows&&r.buildNextBackButtons(),r.$lastPage=r.$targetPage=r.$currentPage,r.updateSlider(),a.expand&&(r.$window.css({width:"100%",height:"100%"}),r.checkResize()),t.isFunction(t.easing[a.easing])||(a.easing="swing"),a.pauseOnHover&&r.$wrapper.hover(function(){r.playing&&(r.$el.trigger("slideshow_paused",r),r.clearTimer(!0))},function(){r.playing&&(r.$el.trigger("slideshow_unpaused",r),r.startStop(r.playing,!0))}),r.slideControls(!1),r.$wrapper.bind("mouseenter mouseleave",function(e){t(this)["mouseenter"===e.type?"addClass":"removeClass"]("anythingSlider-hovered"),r.hovered="mouseenter"===e.type?!0:!1,r.slideControls(r.hovered)}),t(i).keyup(function(t){if(a.enableKeyboard&&r.$wrapper.hasClass("activeSlider")&&!t.target.tagName.match("TEXTAREA|INPUT|SELECT")&&("vertical"===a.mode||38!==t.which&&40!==t.which))switch(t.which){case 39:case 40:r.goForward();break;case 37:case 38:r.goBack()}}),r.currentPage=(a.hashTags?r.gotoHash():"")||a.startPanel||1,r.gotoPage(r.currentPage,!1,null,-1);var n="slideshow_resized slideshow_paused slideshow_unpaused slide_init slide_begin slideshow_stop slideshow_start initialized swf_completed".split(" ");t.each("onSliderResize onShowPause onShowUnpause onSlideInit onSlideBegin onShowStop onShowStart onInitialized onSWFComplete".split(" "),function(e,i){t.isFunction(a[i])&&r.$el.bind(n[e],a[i])}),t.isFunction(a.onSlideComplete)&&r.$el.bind("slide_complete",function(){return setTimeout(function(){a.onSlideComplete(r)},0),!1}),r.initialized=!0,r.$el.trigger("initialized",r),r.startStop(a.autoPlay)},r.updateSlider=function(){r.$el.children(".cloned").remove(),r.navTextVisible="hidden"!==r.$nav.find("span:first").css("visibility"),r.$nav.empty(),r.currentPage=r.currentPage||1,r.$items=r.$el.children(),r.pages=r.$items.length,r.dir="vertical"===a.mode?"top":"left",a.showMultiple=parseInt(a.showMultiple,10)||1,a.navigationSize=!1===a.navigationSize?0:parseInt(a.navigationSize,10)||0,r.$items.find("a").unbind("focus.AnythingSlider").bind("focus.AnythingSlider",function(e){var i=t(this).closest(".panel"),i=r.$items.index(i)+r.adj;r.$items.find(".focusedLink").removeClass("focusedLink"),t(this).addClass("focusedLink"),r.$window.scrollLeft(0).scrollTop(0),-1!==i&&(i>=r.currentPage+a.showMultiple||i<r.currentPage)&&(r.gotoPage(i),e.preventDefault())}),1<a.showMultiple&&(a.showMultiple>r.pages&&(a.showMultiple=r.pages),r.adjustMultiple=a.infiniteSlides&&1<r.pages?0:a.showMultiple-1),r.$controls.add(r.$nav).add(r.$startStop).add(r.$forward).add(r.$back)[1>=r.pages?"hide":"show"](),1<r.pages&&r.buildNavigation(),"fade"!==a.mode&&a.infiniteSlides&&1<r.pages&&(r.$el.prepend(r.$items.filter(":last").clone().addClass("cloned")),1<a.showMultiple?r.$el.append(r.$items.filter(":lt("+a.showMultiple+")").clone().addClass("cloned multiple")):r.$el.append(r.$items.filter(":first").clone().addClass("cloned")),r.$el.find(".cloned").each(function(){t(this).find("a,input,textarea,select,button,area,form").attr({disabled:"disabled",name:""}),t(this).find("[id]")[t.fn.addBack?"addBack":"andSelf"]().removeAttr("id")})),r.$items=r.$el.addClass(a.mode).children().addClass("panel"),r.setDimensions(),a.resizeContents?(r.$items.css("width",r.width),r.$wrapper.css("width",r.getDim(r.currentPage)[0]).add(r.$items).css("height",r.height)):r.$win.load(function(){r.setDimensions(),o=r.getDim(r.currentPage),r.$wrapper.css({width:o[0],height:o[1]}),r.setCurrentPage(r.currentPage,!1)}),r.currentPage>r.pages&&(r.currentPage=r.pages),r.setCurrentPage(r.currentPage,!1),r.$nav.find("a").eq(r.currentPage-1).addClass("cur"),"fade"===a.mode&&(o=r.$items.eq(r.currentPage-1),a.resumeOnVisible?o.css({opacity:1}).siblings().css({opacity:0}):(r.$items.css("opacity",1),o.fadeIn(0).siblings().fadeOut(0)))},r.buildNavigation=function(){if(a.buildNavigation&&1<r.pages){var e,i,n,s,o;r.$items.filter(":not(.cloned)").each(function(l){o=t("<li/>"),n=l+1,i=(1===n?" first":"")+(n===r.pages?" last":""),e='<a class="panel'+n+(r.navTextVisible?'"':" "+a.tooltipClass+'" title="@"')+' href="#"><span>@</span></a>',t.isFunction(a.navigationFormatter)?(s=a.navigationFormatter(n,t(this)),"string"==typeof s?o.html(e.replace(/@/g,s)):o=t("<li/>",s)):o.html(e.replace(/@/g,n)),o.appendTo(r.$nav).addClass(i).data("index",n)}),r.$nav.children("li").bind(a.clickControls,function(e){!r.flag&&a.enableNavigation&&(r.flag=!0,setTimeout(function(){r.flag=!1},100),r.gotoPage(t(this).data("index"))),e.preventDefault()}),a.navigationSize&&a.navigationSize<r.pages&&(r.$controls.find(".anythingNavWindow").length||r.$nav.before('<ul><li class="prev"><a href="#"><span>'+a.backText+"</span></a></li></ul>").after('<ul><li class="next"><a href="#"><span>'+a.forwardText+"</span></a></li></ul>").wrap('<div class="anythingNavWindow"></div>'),r.navWidths=r.$nav.find("li").map(function(){return t(this).outerWidth(!0)+Math.ceil(parseInt(t(this).find("span").css("left"),10)/2||0)}).get(),r.navLeft=r.currentPage,r.$nav.width(r.navWidth(1,r.pages+1)+25),r.$controls.find(".anythingNavWindow").width(r.navWidth(1,a.navigationSize+1)).end().find(".prev,.next").bind(a.clickControls,function(e){r.flag||(r.flag=!0,setTimeout(function(){r.flag=!1},200),r.navWindow(r.navLeft+a.navigationSize*(t(this).is(".prev")?-1:1))),e.preventDefault()}))}},r.navWidth=function(t,e){var i;i=Math.min(t,e);for(var n=Math.max(t,e),s=0;n>i;i++)s+=r.navWidths[i-1]||0;return s},r.navWindow=function(t){if(a.navigationSize&&a.navigationSize<r.pages&&r.navWidths){var e=r.pages-a.navigationSize+1;t=1>=t?1:t>1&&e>t?t:e,t!==r.navLeft&&(r.$controls.find(".anythingNavWindow").animate({scrollLeft:r.navWidth(1,t),width:r.navWidth(t,t+a.navigationSize)},{queue:!1,duration:a.animationTime}),r.navLeft=t)}},r.buildNextBackButtons=function(){r.$forward=t('<span class="arrow forward"><a href="#"><span>'+a.forwardText+"</span></a></span>"),r.$back=t('<span class="arrow back"><a href="#"><span>'+a.backText+"</span></a></span>"),r.$back.bind(a.clickBackArrow,function(t){a.enableArrows&&!r.flag&&(r.flag=!0,setTimeout(function(){r.flag=!1},100),r.goBack()),t.preventDefault()}),r.$forward.bind(a.clickForwardArrow,function(t){a.enableArrows&&!r.flag&&(r.flag=!0,setTimeout(function(){r.flag=!1},100),r.goForward()),t.preventDefault()}),r.$back.add(r.$forward).find("a").bind("focusin focusout",function(){t(this).toggleClass("hover")}),r.$back.appendTo(a.appendBackTo&&t(a.appendBackTo).length?t(a.appendBackTo):r.$wrapper),r.$forward.appendTo(a.appendForwardTo&&t(a.appendForwardTo).length?t(a.appendForwardTo):r.$wrapper),r.arrowWidth=r.$forward.width(),r.arrowRight=parseInt(r.$forward.css("right"),10),r.arrowLeft=parseInt(r.$back.css("left"),10)},r.buildAutoPlay=function(){r.$startStop.html("<span>"+(r.playing?a.stopText:a.startText)+"</span>").bind(a.clickSlideshow,function(t){a.enableStartStop&&(r.startStop(!r.playing),r.makeActive(),r.playing&&!a.autoPlayDelayed&&r.goForward(!0,a.playRtl)),t.preventDefault()}).bind("focusin focusout",function(){t(this).toggleClass("hover")})},r.checkResize=function(t){var e=!!(i.hidden||i.webkitHidden||i.mozHidden||i.msHidden);clearTimeout(r.resizeTimer),r.resizeTimer=setTimeout(function(){var i=r.$outer.width(),n="BODY"===r.$outer[0].tagName?r.$win.height():r.$outer.height();e||r.lastDim[0]===i&&r.lastDim[1]===n||(r.setDimensions(),r.$el.trigger("slideshow_resized",r),r.gotoPage(r.currentPage,r.playing,null,-1)),"undefined"==typeof t&&r.checkResize()},e?2e3:500)},r.setDimensions=function(){r.$wrapper.find(".anythingWindow, .anythingBase, .panel")[t.fn.addBack?"addBack":"andSelf"]().css({width:"",height:""}),r.width=r.$el.width(),r.height=r.$el.height(),r.outerPad=[r.$wrapper.innerWidth()-r.$wrapper.width(),r.$wrapper.innerHeight()-r.$wrapper.height()];var e,i,n,s,o=0,l={width:"100%",height:"100%"},h=1<a.showMultiple&&"horizontal"===a.mode?r.width||r.$window.width()/a.showMultiple:r.$window.width(),u=1<a.showMultiple&&"vertical"===a.mode?r.height/a.showMultiple||r.$window.height()/a.showMultiple:r.$window.height();a.expand&&(r.lastDim=[r.$outer.width(),r.$outer.height()],e=r.lastDim[0]-r.outerPad[0],i=r.lastDim[1]-r.outerPad[1],r.$wrapper.add(r.$window).css({width:e,height:i}),r.height=i=1<a.showMultiple&&"vertical"===a.mode?u:i,r.width=h=1<a.showMultiple&&"horizontal"===a.mode?e/a.showMultiple:e,r.$items.css({width:h,height:u})),r.$items.each(function(u){s=t(this),n=s.children(),a.resizeContents?(e=r.width,i=r.height,s.css({width:e,height:i}),n.length&&("EMBED"===n[0].tagName&&n.attr(l),"OBJECT"===n[0].tagName&&n.find("embed").attr(l),1===n.length&&n.css(l))):("vertical"===a.mode?(e=s.css("display","inline-block").width(),s.css("display","")):e=s.width()||r.width,1===n.length&&e>=h&&(e=n.width()>=h?h:n.width(),n.css("max-width",e)),s.css({width:e,height:""}),i=1===n.length?n.outerHeight(!0):s.height(),i<=r.outerPad[1]&&(i=r.height),s.css("height",i)),r.panelSize[u]=[e,i,o],o+="vertical"===a.mode?i:e}),r.$el.css("vertical"===a.mode?"height":"width","fade"===a.mode?r.width:o)},r.getDim=function(t){var e,i,n=r.width,s=r.height;if(1>r.pages||isNaN(t))return[n,s];if(t=a.infiniteSlides&&1<r.pages?t:t-1,(i=r.panelSize[t])&&(n=i[0]||n,s=i[1]||s),1<a.showMultiple)for(i=1;i<a.showMultiple;i++)e=t+i,"vertical"===a.mode?(n=Math.max(n,r.panelSize[e][0]),s+=r.panelSize[e][1]):(n+=r.panelSize[e][0],s=Math.max(s,r.panelSize[e][1]));return[n,s]},r.goForward=function(t,e){r.gotoPage(r[a.allowRapidChange?"targetPage":"currentPage"]+a.changeBy*(e?-1:1),t)},r.goBack=function(t){r.gotoPage(r[a.allowRapidChange?"targetPage":"currentPage"]-a.changeBy,t)},r.gotoPage=function(e,i,n,s){if(!0!==i&&(i=!1,r.startStop(!1),r.makeActive()),/^[#|.]/.test(e)&&t(e).length&&(e=t(e).closest(".panel").index()+r.adj),1!==a.changeBy){var o=r.pages-r.adjustMultiple;1>e&&(e=a.stopAtEnd?1:a.infiniteSlides?r.pages+e:a.showMultiple>1-e?1:o),e>r.pages?e=a.stopAtEnd?r.pages:a.showMultiple>1-e?1:e-=o:e>=o&&(e=o)}1>=r.pages||(r.$lastPage=r.$currentPage,"number"!=typeof e&&(e=parseInt(e,10)||a.startPanel,r.setCurrentPage(e)),i&&a.isVideoPlaying(r))||(a.stopAtEnd&&!a.infiniteSlides&&e>r.pages-a.showMultiple&&(e=r.pages-a.showMultiple+1),r.exactPage=e,e>r.pages+1-r.adj&&(e=a.infiniteSlides||a.stopAtEnd?r.pages:1),e<r.adj&&(e=a.infiniteSlides||a.stopAtEnd?1:r.pages),a.infiniteSlides||(r.exactPage=e),r.currentPage=e>r.pages?r.pages:1>e?1:r.currentPage,r.$currentPage=r.$items.eq(r.currentPage-r.adj),r.targetPage=0===e?r.pages:e>r.pages?1:e,r.$targetPage=r.$items.eq(r.targetPage-r.adj),s="undefined"!=typeof s?s:a.animationTime,s>=0&&r.$el.trigger("slide_init",r),s>0&&r.slideControls(!0),a.buildNavigation&&r.setNavigation(r.targetPage),!0!==i&&(i=!1),(!i||a.stopAtEnd&&e===r.pages)&&r.startStop(!1),s>=0&&r.$el.trigger("slide_begin",r),setTimeout(function(t){var i,o=!0;a.allowRapidChange&&r.$wrapper.add(r.$el).add(r.$items).stop(!0,!0),a.resizeContents||(i=r.getDim(e),t={},r.$wrapper.width()!==i[0]&&(t.width=i[0]||r.width,o=!1),r.$wrapper.height()!==i[1]&&(t.height=i[1]||r.height,o=!1),o||r.$wrapper.filter(":not(:animated)").animate(t,{queue:!1,duration:0>s?0:s,easing:a.easing})),"fade"===a.mode?r.$lastPage[0]!==r.$targetPage[0]?(r.fadeIt(r.$lastPage,0,s),r.fadeIt(r.$targetPage,1,s,function(){r.endAnimation(e,n,s)})):r.endAnimation(e,n,s):(t={},t[r.dir]=-r.panelSize[a.infiniteSlides&&1<r.pages?e:e-1][2],"vertical"===a.mode&&!a.resizeContents&&(t.width=i[0]),r.$el.filter(":not(:animated)").animate(t,{queue:!1,duration:0>s?0:s,easing:a.easing,complete:function(){r.endAnimation(e,n,s)}}))},parseInt(a.delayBeforeAnimate,10)||0))},r.endAnimation=function(t,e,i){0===t?(r.$el.css(r.dir,"fade"===a.mode?0:-r.panelSize[r.pages][2]),t=r.pages):t>r.pages&&(r.$el.css(r.dir,"fade"===a.mode?0:-r.panelSize[1][2]),t=1),r.exactPage=t,r.setCurrentPage(t,!1),"fade"===a.mode&&r.fadeIt(r.$items.not(":eq("+(t-r.adj)+")"),0,0),r.hovered||r.slideControls(!1),a.hashTags&&r.setHash(t),i>=0&&r.$el.trigger("slide_complete",r),"function"==typeof e&&e(r),a.autoPlayLocked&&!r.playing&&setTimeout(function(){r.startStop(!0)},a.resumeDelay-(a.autoPlayDelayed?a.delay:0))},r.fadeIt=function(t,e,i,n){i=0>i?0:i,a.resumeOnVisible?t.filter(":not(:animated)").fadeTo(i,e,n):t.filter(":not(:animated)")[0===e?"fadeOut":"fadeIn"](i,n)},r.setCurrentPage=function(t,e){if(t=parseInt(t,10),!(1>r.pages||0===t||isNaN(t))){if(t>r.pages+1-r.adj&&(t=r.pages-r.adj),t<r.adj&&(t=1),a.buildArrows&&!a.infiniteSlides&&a.stopAtEnd&&(r.$forward[t===r.pages-r.adjustMultiple?"addClass":"removeClass"]("disabled"),r.$back[1===t?"addClass":"removeClass"]("disabled"),t===r.pages&&r.playing&&r.startStop()),!e){var i=r.getDim(t);r.$wrapper.css({width:i[0],height:i[1]}).add(r.$window).scrollLeft(0).scrollTop(0),r.$el.css(r.dir,"fade"===a.mode?0:-r.panelSize[a.infiniteSlides&&1<r.pages?t:t-1][2])}r.currentPage=t,r.$currentPage=r.$items.removeClass("activePage").eq(t-r.adj).addClass("activePage"),a.buildNavigation&&r.setNavigation(t)}},r.setNavigation=function(t){r.$nav.find(".cur").removeClass("cur").end().find("a").eq(t-1).addClass("cur")},r.makeActive=function(){r.$wrapper.hasClass("activeSlider")||(t(".activeSlider").removeClass("activeSlider"),r.$wrapper.addClass("activeSlider"))},r.gotoHash=function(){var i=e.location.hash,n=i.indexOf("&"),s=i.match(r.regex);return null!==s||/^#&/.test(i)||/#!?\//.test(i)||/\=/.test(i)?null!==s&&(s=a.hashTags?parseInt(s[1],10):null):(i=i.substring(0,n>=0?n:i.length),s=t(i).length&&t(i).closest(".anythingBase")[0]===r.el?r.$items.index(t(i).closest(".panel"))+r.adj:null),s},r.setHash=function(t){var i="panel"+r.runTimes+"-",n=e.location.hash;"undefined"!=typeof n&&(e.location.hash=0<n.indexOf(i)?n.replace(r.regex,i+t):n+"&"+i+t)},r.slideControls=function(t){var e=t?0:a.animationTime,i=t?a.animationTime:0,n=t?1:0,s=t?0:1;a.toggleControls&&r.$controls.stop(!0,!0).delay(e)[t?"slideDown":"slideUp"](a.animationTime/2).delay(i),a.buildArrows&&a.toggleArrows&&(!r.hovered&&r.playing&&(s=1,n=0),r.$forward.stop(!0,!0).delay(e).animate({right:r.arrowRight+s*r.arrowWidth,opacity:n},a.animationTime/2),r.$back.stop(!0,!0).delay(e).animate({left:r.arrowLeft+s*r.arrowWidth,opacity:n},a.animationTime/2))},r.clearTimer=function(t){r.timer&&(e.clearInterval(r.timer),!t&&r.slideshow&&(r.$el.trigger("slideshow_stop",r),r.slideshow=!1))},r.startStop=function(t,n){!0!==t&&(t=!1),(r.playing=t)&&!n&&(r.$el.trigger("slideshow_start",r),r.slideshow=!0),a.buildStartStop&&(r.$startStop.toggleClass("playing",t).find("span").html(t?a.stopText:a.startText),"hidden"===r.$startStop.find("span").css("visibility")&&r.$startStop.addClass(a.tooltipClass).attr("title",t?a.stopText:a.startText)),t?(r.clearTimer(!0),r.timer=e.setInterval(function(){i.hidden||i.webkitHidden||i.mozHidden||i.msHidden?a.autoPlayLocked||r.startStop():a.isVideoPlaying(r)?a.resumeOnVideoEnd||r.startStop():r.goForward(!0,a.playRtl)},a.delay)):r.clearTimer()},r.init()},t.anythingSlider.defaults={theme:"default",mode:"horiz",expand:!1,resizeContents:!0,showMultiple:!1,easing:"swing",buildArrows:!0,buildNavigation:!0,buildStartStop:!0,toggleArrows:!1,toggleControls:!1,startText:"Start",stopText:"Stop",forwardText:"&raquo;",backText:"&laquo;",tooltipClass:"tooltip",enableArrows:!0,enableNavigation:!0,enableStartStop:!0,enableKeyboard:!0,startPanel:1,changeBy:1,hashTags:!0,infiniteSlides:!0,navigationFormatter:null,navigationSize:!1,autoPlay:!1,autoPlayLocked:!1,autoPlayDelayed:!1,pauseOnHover:!0,stopAtEnd:!1,playRtl:!1,delay:3e3,resumeDelay:15e3,animationTime:600,delayBeforeAnimate:0,clickForwardArrow:"click",clickBackArrow:"click",clickControls:"click focusin",clickSlideshow:"click",allowRapidChange:!1,resumeOnVideoEnd:!0,resumeOnVisible:!0,isVideoPlaying:function(){return!1}},t.fn.anythingSlider=function(e,i){return this.each(function(){var n,s=t(this).data("AnythingSlider");(typeof e).match("object|undefined")?s?s.updateSlider():new t.anythingSlider(this,e):/\d/.test(e)&&!isNaN(e)&&s?(n="number"==typeof e?e:parseInt(t.trim(e),10),n>=1&&n<=s.pages&&s.gotoPage(n,!1,i)):/^[#|.]/.test(e)&&t(e).length&&s.gotoPage(e,!1,i)})}}(jQuery,window,document);