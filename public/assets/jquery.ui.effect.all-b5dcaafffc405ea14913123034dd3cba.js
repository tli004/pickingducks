/*!
 * jQuery UI Effects 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/category/effects-core/
 */
!function(t,e){var i="ui-effects-";t.effects={effect:{}},/*!
 * jQuery Color Animations v2.1.2
 * https://github.com/jquery/jquery-color
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * Date: Wed Jan 16 08:47:09 2013 -0600
 */
function(t,e){function i(t,e,i){var n=c[e.type]||{};return null==t?i||!e.def?null:e.def:(t=n.floor?~~t:parseFloat(t),isNaN(t)?e.def:n.mod?(t+n.mod)%n.mod:0>t?0:n.max<t?n.max:t)}function n(e){var i=h(),n=i._rgba=[];return e=e.toLowerCase(),p(l,function(t,s){var o,a=s.re.exec(e),r=a&&s.parse(a),l=s.space||"rgba";return r?(o=i[l](r),i[u[l].cache]=o[u[l].cache],n=i._rgba=o._rgba,!1):void 0}),n.length?("0,0,0,0"===n.join()&&t.extend(n,o.transparent),i):o[e]}function s(t,e,i){return i=(i+1)%1,1>6*i?t+6*(e-t)*i:1>2*i?e:2>3*i?t+6*(e-t)*(2/3-i):t}var o,a="backgroundColor borderBottomColor borderLeftColor borderRightColor borderTopColor color columnRuleColor outlineColor textDecorationColor textEmphasisColor",r=/^([\-+])=\s*(\d+\.?\d*)/,l=[{re:/rgba?\(\s*(\d{1,3})\s*,\s*(\d{1,3})\s*,\s*(\d{1,3})\s*(?:,\s*(\d?(?:\.\d+)?)\s*)?\)/,parse:function(t){return[t[1],t[2],t[3],t[4]]}},{re:/rgba?\(\s*(\d+(?:\.\d+)?)\%\s*,\s*(\d+(?:\.\d+)?)\%\s*,\s*(\d+(?:\.\d+)?)\%\s*(?:,\s*(\d?(?:\.\d+)?)\s*)?\)/,parse:function(t){return[2.55*t[1],2.55*t[2],2.55*t[3],t[4]]}},{re:/#([a-f0-9]{2})([a-f0-9]{2})([a-f0-9]{2})/,parse:function(t){return[parseInt(t[1],16),parseInt(t[2],16),parseInt(t[3],16)]}},{re:/#([a-f0-9])([a-f0-9])([a-f0-9])/,parse:function(t){return[parseInt(t[1]+t[1],16),parseInt(t[2]+t[2],16),parseInt(t[3]+t[3],16)]}},{re:/hsla?\(\s*(\d+(?:\.\d+)?)\s*,\s*(\d+(?:\.\d+)?)\%\s*,\s*(\d+(?:\.\d+)?)\%\s*(?:,\s*(\d?(?:\.\d+)?)\s*)?\)/,space:"hsla",parse:function(t){return[t[1],t[2]/100,t[3]/100,t[4]]}}],h=t.Color=function(e,i,n,s){return new t.Color.fn.parse(e,i,n,s)},u={rgba:{props:{red:{idx:0,type:"byte"},green:{idx:1,type:"byte"},blue:{idx:2,type:"byte"}}},hsla:{props:{hue:{idx:0,type:"degrees"},saturation:{idx:1,type:"percent"},lightness:{idx:2,type:"percent"}}}},c={"byte":{floor:!0,max:255},percent:{max:1},degrees:{mod:360,floor:!0}},d=h.support={},f=t("<p>")[0],p=t.each;f.style.cssText="background-color:rgba(1,1,1,.5)",d.rgba=f.style.backgroundColor.indexOf("rgba")>-1,p(u,function(t,e){e.cache="_"+t,e.props.alpha={idx:3,type:"percent",def:1}}),h.fn=t.extend(h.prototype,{parse:function(s,a,r,l){if(s===e)return this._rgba=[null,null,null,null],this;(s.jquery||s.nodeType)&&(s=t(s).css(a),a=e);var c=this,d=t.type(s),f=this._rgba=[];return a!==e&&(s=[s,a,r,l],d="array"),"string"===d?this.parse(n(s)||o._default):"array"===d?(p(u.rgba.props,function(t,e){f[e.idx]=i(s[e.idx],e)}),this):"object"===d?(s instanceof h?p(u,function(t,e){s[e.cache]&&(c[e.cache]=s[e.cache].slice())}):p(u,function(e,n){var o=n.cache;p(n.props,function(t,e){if(!c[o]&&n.to){if("alpha"===t||null==s[t])return;c[o]=n.to(c._rgba)}c[o][e.idx]=i(s[t],e,!0)}),c[o]&&t.inArray(null,c[o].slice(0,3))<0&&(c[o][3]=1,n.from&&(c._rgba=n.from(c[o])))}),this):void 0},is:function(t){var e=h(t),i=!0,n=this;return p(u,function(t,s){var o,a=e[s.cache];return a&&(o=n[s.cache]||s.to&&s.to(n._rgba)||[],p(s.props,function(t,e){return null!=a[e.idx]?i=a[e.idx]===o[e.idx]:void 0})),i}),i},_space:function(){var t=[],e=this;return p(u,function(i,n){e[n.cache]&&t.push(i)}),t.pop()},transition:function(t,e){var n=h(t),s=n._space(),o=u[s],a=0===this.alpha()?h("transparent"):this,r=a[o.cache]||o.to(a._rgba),l=r.slice();return n=n[o.cache],p(o.props,function(t,s){var o=s.idx,a=r[o],h=n[o],u=c[s.type]||{};null!==h&&(null===a?l[o]=h:(u.mod&&(h-a>u.mod/2?a+=u.mod:a-h>u.mod/2&&(a-=u.mod)),l[o]=i((h-a)*e+a,s)))}),this[s](l)},blend:function(e){if(1===this._rgba[3])return this;var i=this._rgba.slice(),n=i.pop(),s=h(e)._rgba;return h(t.map(i,function(t,e){return(1-n)*s[e]+n*t}))},toRgbaString:function(){var e="rgba(",i=t.map(this._rgba,function(t,e){return null==t?e>2?1:0:t});return 1===i[3]&&(i.pop(),e="rgb("),e+i.join()+")"},toHslaString:function(){var e="hsla(",i=t.map(this.hsla(),function(t,e){return null==t&&(t=e>2?1:0),e&&3>e&&(t=Math.round(100*t)+"%"),t});return 1===i[3]&&(i.pop(),e="hsl("),e+i.join()+")"},toHexString:function(e){var i=this._rgba.slice(),n=i.pop();return e&&i.push(~~(255*n)),"#"+t.map(i,function(t){return t=(t||0).toString(16),1===t.length?"0"+t:t}).join("")},toString:function(){return 0===this._rgba[3]?"transparent":this.toRgbaString()}}),h.fn.parse.prototype=h.fn,u.hsla.to=function(t){if(null==t[0]||null==t[1]||null==t[2])return[null,null,null,t[3]];var e,i,n=t[0]/255,s=t[1]/255,o=t[2]/255,a=t[3],r=Math.max(n,s,o),l=Math.min(n,s,o),h=r-l,u=r+l,c=.5*u;return e=l===r?0:n===r?60*(s-o)/h+360:s===r?60*(o-n)/h+120:60*(n-s)/h+240,i=0===h?0:.5>=c?h/u:h/(2-u),[Math.round(e)%360,i,c,null==a?1:a]},u.hsla.from=function(t){if(null==t[0]||null==t[1]||null==t[2])return[null,null,null,t[3]];var e=t[0]/360,i=t[1],n=t[2],o=t[3],a=.5>=n?n*(1+i):n+i-n*i,r=2*n-a;return[Math.round(255*s(r,a,e+1/3)),Math.round(255*s(r,a,e)),Math.round(255*s(r,a,e-1/3)),o]},p(u,function(n,s){var o=s.props,a=s.cache,l=s.to,u=s.from;h.fn[n]=function(n){if(l&&!this[a]&&(this[a]=l(this._rgba)),n===e)return this[a].slice();var s,r=t.type(n),c="array"===r||"object"===r?n:arguments,d=this[a].slice();return p(o,function(t,e){var n=c["object"===r?t:e.idx];null==n&&(n=d[e.idx]),d[e.idx]=i(n,e)}),u?(s=h(u(d)),s[a]=d,s):h(d)},p(o,function(e,i){h.fn[e]||(h.fn[e]=function(s){var o,a=t.type(s),l="alpha"===e?this._hsla?"hsla":"rgba":n,h=this[l](),u=h[i.idx];return"undefined"===a?u:("function"===a&&(s=s.call(this,u),a=t.type(s)),null==s&&i.empty?this:("string"===a&&(o=r.exec(s),o&&(s=u+parseFloat(o[2])*("+"===o[1]?1:-1))),h[i.idx]=s,this[l](h)))})})}),h.hook=function(e){var i=e.split(" ");p(i,function(e,i){t.cssHooks[i]={set:function(e,s){var o,a,r="";if("transparent"!==s&&("string"!==t.type(s)||(o=n(s)))){if(s=h(o||s),!d.rgba&&1!==s._rgba[3]){for(a="backgroundColor"===i?e.parentNode:e;(""===r||"transparent"===r)&&a&&a.style;)try{r=t.css(a,"backgroundColor"),a=a.parentNode}catch(l){}s=s.blend(r&&"transparent"!==r?r:"_default")}s=s.toRgbaString()}try{e.style[i]=s}catch(l){}}},t.fx.step[i]=function(e){e.colorInit||(e.start=h(e.elem,i),e.end=h(e.end),e.colorInit=!0),t.cssHooks[i].set(e.elem,e.start.transition(e.end,e.pos))}})},h.hook(a),t.cssHooks.borderColor={expand:function(t){var e={};return p(["Top","Right","Bottom","Left"],function(i,n){e["border"+n+"Color"]=t}),e}},o=t.Color.names={aqua:"#00ffff",black:"#000000",blue:"#0000ff",fuchsia:"#ff00ff",gray:"#808080",green:"#008000",lime:"#00ff00",maroon:"#800000",navy:"#000080",olive:"#808000",purple:"#800080",red:"#ff0000",silver:"#c0c0c0",teal:"#008080",white:"#ffffff",yellow:"#ffff00",transparent:[null,null,null,0],_default:"#ffffff"}}(jQuery),function(){function i(e){var i,n,s=e.ownerDocument.defaultView?e.ownerDocument.defaultView.getComputedStyle(e,null):e.currentStyle,o={};if(s&&s.length&&s[0]&&s[s[0]])for(n=s.length;n--;)i=s[n],"string"==typeof s[i]&&(o[t.camelCase(i)]=s[i]);else for(i in s)"string"==typeof s[i]&&(o[i]=s[i]);return o}function n(e,i){var n,s,a={};for(n in i)s=i[n],e[n]!==s&&(o[n]||(t.fx.step[n]||!isNaN(parseFloat(s)))&&(a[n]=s));return a}var s=["add","remove","toggle"],o={border:1,borderBottom:1,borderColor:1,borderLeft:1,borderRight:1,borderTop:1,borderWidth:1,margin:1,padding:1};t.each(["borderLeftStyle","borderRightStyle","borderBottomStyle","borderTopStyle"],function(e,i){t.fx.step[i]=function(t){("none"!==t.end&&!t.setAttr||1===t.pos&&!t.setAttr)&&(jQuery.style(t.elem,i,t.end),t.setAttr=!0)}}),t.fn.addBack||(t.fn.addBack=function(t){return this.add(null==t?this.prevObject:this.prevObject.filter(t))}),t.effects.animateClass=function(e,o,a,r){var l=t.speed(o,a,r);return this.queue(function(){var o,a=t(this),r=a.attr("class")||"",h=l.children?a.find("*").addBack():a;h=h.map(function(){var e=t(this);return{el:e,start:i(this)}}),o=function(){t.each(s,function(t,i){e[i]&&a[i+"Class"](e[i])})},o(),h=h.map(function(){return this.end=i(this.el[0]),this.diff=n(this.start,this.end),this}),a.attr("class",r),h=h.map(function(){var e=this,i=t.Deferred(),n=t.extend({},l,{queue:!1,complete:function(){i.resolve(e)}});return this.el.animate(this.diff,n),i.promise()}),t.when.apply(t,h.get()).done(function(){o(),t.each(arguments,function(){var e=this.el;t.each(this.diff,function(t){e.css(t,"")})}),l.complete.call(a[0])})})},t.fn.extend({addClass:function(e){return function(i,n,s,o){return n?t.effects.animateClass.call(this,{add:i},n,s,o):e.apply(this,arguments)}}(t.fn.addClass),removeClass:function(e){return function(i,n,s,o){return arguments.length>1?t.effects.animateClass.call(this,{remove:i},n,s,o):e.apply(this,arguments)}}(t.fn.removeClass),toggleClass:function(i){return function(n,s,o,a,r){return"boolean"==typeof s||s===e?o?t.effects.animateClass.call(this,s?{add:n}:{remove:n},o,a,r):i.apply(this,arguments):t.effects.animateClass.call(this,{toggle:n},s,o,a)}}(t.fn.toggleClass),switchClass:function(e,i,n,s,o){return t.effects.animateClass.call(this,{add:i,remove:e},n,s,o)}})}(),function(){function n(e,i,n,s){return t.isPlainObject(e)&&(i=e,e=e.effect),e={effect:e},null==i&&(i={}),t.isFunction(i)&&(s=i,n=null,i={}),("number"==typeof i||t.fx.speeds[i])&&(s=n,n=i,i={}),t.isFunction(n)&&(s=n,n=null),i&&t.extend(e,i),n=n||i.duration,e.duration=t.fx.off?0:"number"==typeof n?n:n in t.fx.speeds?t.fx.speeds[n]:t.fx.speeds._default,e.complete=s||i.complete,e}function s(e){return!e||"number"==typeof e||t.fx.speeds[e]?!0:"string"!=typeof e||t.effects.effect[e]?t.isFunction(e)?!0:"object"!=typeof e||e.effect?!1:!0:!0}t.extend(t.effects,{version:"1.10.3",save:function(t,e){for(var n=0;n<e.length;n++)null!==e[n]&&t.data(i+e[n],t[0].style[e[n]])},restore:function(t,n){var s,o;for(o=0;o<n.length;o++)null!==n[o]&&(s=t.data(i+n[o]),s===e&&(s=""),t.css(n[o],s))},setMode:function(t,e){return"toggle"===e&&(e=t.is(":hidden")?"show":"hide"),e},getBaseline:function(t,e){var i,n;switch(t[0]){case"top":i=0;break;case"middle":i=.5;break;case"bottom":i=1;break;default:i=t[0]/e.height}switch(t[1]){case"left":n=0;break;case"center":n=.5;break;case"right":n=1;break;default:n=t[1]/e.width}return{x:n,y:i}},createWrapper:function(e){if(e.parent().is(".ui-effects-wrapper"))return e.parent();var i={width:e.outerWidth(!0),height:e.outerHeight(!0),"float":e.css("float")},n=t("<div></div>").addClass("ui-effects-wrapper").css({fontSize:"100%",background:"transparent",border:"none",margin:0,padding:0}),s={width:e.width(),height:e.height()},o=document.activeElement;try{o.id}catch(a){o=document.body}return e.wrap(n),(e[0]===o||t.contains(e[0],o))&&t(o).focus(),n=e.parent(),"static"===e.css("position")?(n.css({position:"relative"}),e.css({position:"relative"})):(t.extend(i,{position:e.css("position"),zIndex:e.css("z-index")}),t.each(["top","left","bottom","right"],function(t,n){i[n]=e.css(n),isNaN(parseInt(i[n],10))&&(i[n]="auto")}),e.css({position:"relative",top:0,left:0,right:"auto",bottom:"auto"})),e.css(s),n.css(i).show()},removeWrapper:function(e){var i=document.activeElement;return e.parent().is(".ui-effects-wrapper")&&(e.parent().replaceWith(e),(e[0]===i||t.contains(e[0],i))&&t(i).focus()),e},setTransition:function(e,i,n,s){return s=s||{},t.each(i,function(t,i){var o=e.cssUnit(i);o[0]>0&&(s[i]=o[0]*n+o[1])}),s}}),t.fn.extend({effect:function(){function e(e){function n(){t.isFunction(o)&&o.call(s[0]),t.isFunction(e)&&e()}var s=t(this),o=i.complete,r=i.mode;(s.is(":hidden")?"hide"===r:"show"===r)?(s[r](),n()):a.call(s[0],i,n)}var i=n.apply(this,arguments),s=i.mode,o=i.queue,a=t.effects.effect[i.effect];return t.fx.off||!a?s?this[s](i.duration,i.complete):this.each(function(){i.complete&&i.complete.call(this)}):o===!1?this.each(e):this.queue(o||"fx",e)},show:function(t){return function(e){if(s(e))return t.apply(this,arguments);var i=n.apply(this,arguments);return i.mode="show",this.effect.call(this,i)}}(t.fn.show),hide:function(t){return function(e){if(s(e))return t.apply(this,arguments);var i=n.apply(this,arguments);return i.mode="hide",this.effect.call(this,i)}}(t.fn.hide),toggle:function(t){return function(e){if(s(e)||"boolean"==typeof e)return t.apply(this,arguments);var i=n.apply(this,arguments);return i.mode="toggle",this.effect.call(this,i)}}(t.fn.toggle),cssUnit:function(e){var i=this.css(e),n=[];return t.each(["em","px","%","pt"],function(t,e){i.indexOf(e)>0&&(n=[parseFloat(i),e])}),n}})}(),function(){var e={};t.each(["Quad","Cubic","Quart","Quint","Expo"],function(t,i){e[i]=function(e){return Math.pow(e,t+2)}}),t.extend(e,{Sine:function(t){return 1-Math.cos(t*Math.PI/2)},Circ:function(t){return 1-Math.sqrt(1-t*t)},Elastic:function(t){return 0===t||1===t?t:-Math.pow(2,8*(t-1))*Math.sin((80*(t-1)-7.5)*Math.PI/15)},Back:function(t){return t*t*(3*t-2)},Bounce:function(t){for(var e,i=4;t<((e=Math.pow(2,--i))-1)/11;);return 1/Math.pow(4,3-i)-7.5625*Math.pow((3*e-2)/22-t,2)}}),t.each(e,function(e,i){t.easing["easeIn"+e]=i,t.easing["easeOut"+e]=function(t){return 1-i(1-t)},t.easing["easeInOut"+e]=function(t){return.5>t?i(2*t)/2:1-i(-2*t+2)/2}})}()}(jQuery),/*!
 * jQuery UI Effects Blind 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/blind-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
function(t){var e=/up|down|vertical/,i=/up|left|vertical|horizontal/;t.effects.effect.blind=function(n,s){var o,a,r,l=t(this),h=["position","top","bottom","left","right","height","width"],u=t.effects.setMode(l,n.mode||"hide"),c=n.direction||"up",d=e.test(c),f=d?"height":"width",p=d?"top":"left",g=i.test(c),m={},v="show"===u;l.parent().is(".ui-effects-wrapper")?t.effects.save(l.parent(),h):t.effects.save(l,h),l.show(),o=t.effects.createWrapper(l).css({overflow:"hidden"}),a=o[f](),r=parseFloat(o.css(p))||0,m[f]=v?a:0,g||(l.css(d?"bottom":"right",0).css(d?"top":"left","auto").css({position:"absolute"}),m[p]=v?r:a+r),v&&(o.css(f,0),g||o.css(p,r+a)),o.animate(m,{duration:n.duration,easing:n.easing,queue:!1,complete:function(){"hide"===u&&l.hide(),t.effects.restore(l,h),t.effects.removeWrapper(l),s()}})}}(jQuery),/*!
 * jQuery UI Effects Bounce 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/bounce-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
function(t){t.effects.effect.bounce=function(e,i){var n,s,o,a=t(this),r=["position","top","bottom","left","right","height","width"],l=t.effects.setMode(a,e.mode||"effect"),h="hide"===l,u="show"===l,c=e.direction||"up",d=e.distance,f=e.times||5,p=2*f+(u||h?1:0),g=e.duration/p,m=e.easing,v="up"===c||"down"===c?"top":"left",b="up"===c||"left"===c,y=a.queue(),_=y.length;for((u||h)&&r.push("opacity"),t.effects.save(a,r),a.show(),t.effects.createWrapper(a),d||(d=a["top"===v?"outerHeight":"outerWidth"]()/3),u&&(o={opacity:1},o[v]=0,a.css("opacity",0).css(v,b?2*-d:2*d).animate(o,g,m)),h&&(d/=Math.pow(2,f-1)),o={},o[v]=0,n=0;f>n;n++)s={},s[v]=(b?"-=":"+=")+d,a.animate(s,g,m).animate(o,g,m),d=h?2*d:d/2;h&&(s={opacity:0},s[v]=(b?"-=":"+=")+d,a.animate(s,g,m)),a.queue(function(){h&&a.hide(),t.effects.restore(a,r),t.effects.removeWrapper(a),i()}),_>1&&y.splice.apply(y,[1,0].concat(y.splice(_,p+1))),a.dequeue()}}(jQuery),/*!
 * jQuery UI Effects Clip 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/clip-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
function(t){t.effects.effect.clip=function(e,i){var n,s,o,a=t(this),r=["position","top","bottom","left","right","height","width"],l=t.effects.setMode(a,e.mode||"hide"),h="show"===l,u=e.direction||"vertical",c="vertical"===u,d=c?"height":"width",f=c?"top":"left",p={};t.effects.save(a,r),a.show(),n=t.effects.createWrapper(a).css({overflow:"hidden"}),s="IMG"===a[0].tagName?n:a,o=s[d](),h&&(s.css(d,0),s.css(f,o/2)),p[d]=h?o:0,p[f]=h?0:o/2,s.animate(p,{queue:!1,duration:e.duration,easing:e.easing,complete:function(){h||a.hide(),t.effects.restore(a,r),t.effects.removeWrapper(a),i()}})}}(jQuery),/*!
 * jQuery UI Effects Drop 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/drop-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
function(t){t.effects.effect.drop=function(e,i){var n,s=t(this),o=["position","top","bottom","left","right","opacity","height","width"],a=t.effects.setMode(s,e.mode||"hide"),r="show"===a,l=e.direction||"left",h="up"===l||"down"===l?"top":"left",u="up"===l||"left"===l?"pos":"neg",c={opacity:r?1:0};t.effects.save(s,o),s.show(),t.effects.createWrapper(s),n=e.distance||s["top"===h?"outerHeight":"outerWidth"](!0)/2,r&&s.css("opacity",0).css(h,"pos"===u?-n:n),c[h]=(r?"pos"===u?"+=":"-=":"pos"===u?"-=":"+=")+n,s.animate(c,{queue:!1,duration:e.duration,easing:e.easing,complete:function(){"hide"===a&&s.hide(),t.effects.restore(s,o),t.effects.removeWrapper(s),i()}})}}(jQuery),/*!
 * jQuery UI Effects Explode 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/explode-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
function(t){t.effects.effect.explode=function(e,i){function n(){y.push(this),y.length===c*d&&s()}function s(){f.css({visibility:"visible"}),t(y).remove(),g||f.hide(),i()}var o,a,r,l,h,u,c=e.pieces?Math.round(Math.sqrt(e.pieces)):3,d=c,f=t(this),p=t.effects.setMode(f,e.mode||"hide"),g="show"===p,m=f.show().css("visibility","hidden").offset(),v=Math.ceil(f.outerWidth()/d),b=Math.ceil(f.outerHeight()/c),y=[];for(o=0;c>o;o++)for(l=m.top+o*b,u=o-(c-1)/2,a=0;d>a;a++)r=m.left+a*v,h=a-(d-1)/2,f.clone().appendTo("body").wrap("<div></div>").css({position:"absolute",visibility:"visible",left:-a*v,top:-o*b}).parent().addClass("ui-effects-explode").css({position:"absolute",overflow:"hidden",width:v,height:b,left:r+(g?h*v:0),top:l+(g?u*b:0),opacity:g?0:1}).animate({left:r+(g?0:h*v),top:l+(g?0:u*b),opacity:g?1:0},e.duration||500,e.easing,n)}}(jQuery),/*!
 * jQuery UI Effects Fade 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/fade-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
function(t){t.effects.effect.fade=function(e,i){var n=t(this),s=t.effects.setMode(n,e.mode||"toggle");n.animate({opacity:s},{queue:!1,duration:e.duration,easing:e.easing,complete:i})}}(jQuery),/*!
 * jQuery UI Effects Fold 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/fold-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
function(t){t.effects.effect.fold=function(e,i){var n,s,o=t(this),a=["position","top","bottom","left","right","height","width"],r=t.effects.setMode(o,e.mode||"hide"),l="show"===r,h="hide"===r,u=e.size||15,c=/([0-9]+)%/.exec(u),d=!!e.horizFirst,f=l!==d,p=f?["width","height"]:["height","width"],g=e.duration/2,m={},v={};t.effects.save(o,a),o.show(),n=t.effects.createWrapper(o).css({overflow:"hidden"}),s=f?[n.width(),n.height()]:[n.height(),n.width()],c&&(u=parseInt(c[1],10)/100*s[h?0:1]),l&&n.css(d?{height:0,width:u}:{height:u,width:0}),m[p[0]]=l?s[0]:u,v[p[1]]=l?s[1]:0,n.animate(m,g,e.easing).animate(v,g,e.easing,function(){h&&o.hide(),t.effects.restore(o,a),t.effects.removeWrapper(o),i()})}}(jQuery),/*!
 * jQuery UI Effects Highlight 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/highlight-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
function(t){t.effects.effect.highlight=function(e,i){var n=t(this),s=["backgroundImage","backgroundColor","opacity"],o=t.effects.setMode(n,e.mode||"show"),a={backgroundColor:n.css("backgroundColor")};"hide"===o&&(a.opacity=0),t.effects.save(n,s),n.show().css({backgroundImage:"none",backgroundColor:e.color||"#ffff99"}).animate(a,{queue:!1,duration:e.duration,easing:e.easing,complete:function(){"hide"===o&&n.hide(),t.effects.restore(n,s),i()}})}}(jQuery),/*!
 * jQuery UI Effects Pulsate 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/pulsate-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
function(t){t.effects.effect.pulsate=function(e,i){var n,s=t(this),o=t.effects.setMode(s,e.mode||"show"),a="show"===o,r="hide"===o,l=a||"hide"===o,h=2*(e.times||5)+(l?1:0),u=e.duration/h,c=0,d=s.queue(),f=d.length;for((a||!s.is(":visible"))&&(s.css("opacity",0).show(),c=1),n=1;h>n;n++)s.animate({opacity:c},u,e.easing),c=1-c;s.animate({opacity:c},u,e.easing),s.queue(function(){r&&s.hide(),i()}),f>1&&d.splice.apply(d,[1,0].concat(d.splice(f,h+1))),s.dequeue()}}(jQuery),/*!
 * jQuery UI Effects Scale 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/scale-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
function(t){t.effects.effect.puff=function(e,i){var n=t(this),s=t.effects.setMode(n,e.mode||"hide"),o="hide"===s,a=parseInt(e.percent,10)||150,r=a/100,l={height:n.height(),width:n.width(),outerHeight:n.outerHeight(),outerWidth:n.outerWidth()};t.extend(e,{effect:"scale",queue:!1,fade:!0,mode:s,complete:i,percent:o?a:100,from:o?l:{height:l.height*r,width:l.width*r,outerHeight:l.outerHeight*r,outerWidth:l.outerWidth*r}}),n.effect(e)},t.effects.effect.scale=function(e,i){var n=t(this),s=t.extend(!0,{},e),o=t.effects.setMode(n,e.mode||"effect"),a=parseInt(e.percent,10)||(0===parseInt(e.percent,10)?0:"hide"===o?0:100),r=e.direction||"both",l=e.origin,h={height:n.height(),width:n.width(),outerHeight:n.outerHeight(),outerWidth:n.outerWidth()},u={y:"horizontal"!==r?a/100:1,x:"vertical"!==r?a/100:1};s.effect="size",s.queue=!1,s.complete=i,"effect"!==o&&(s.origin=l||["middle","center"],s.restore=!0),s.from=e.from||("show"===o?{height:0,width:0,outerHeight:0,outerWidth:0}:h),s.to={height:h.height*u.y,width:h.width*u.x,outerHeight:h.outerHeight*u.y,outerWidth:h.outerWidth*u.x},s.fade&&("show"===o&&(s.from.opacity=0,s.to.opacity=1),"hide"===o&&(s.from.opacity=1,s.to.opacity=0)),n.effect(s)},t.effects.effect.size=function(e,i){var n,s,o,a=t(this),r=["position","top","bottom","left","right","width","height","overflow","opacity"],l=["position","top","bottom","left","right","overflow","opacity"],h=["width","height","overflow"],u=["fontSize"],c=["borderTopWidth","borderBottomWidth","paddingTop","paddingBottom"],d=["borderLeftWidth","borderRightWidth","paddingLeft","paddingRight"],f=t.effects.setMode(a,e.mode||"effect"),p=e.restore||"effect"!==f,g=e.scale||"both",m=e.origin||["middle","center"],v=a.css("position"),b=p?r:l,y={height:0,width:0,outerHeight:0,outerWidth:0};"show"===f&&a.show(),n={height:a.height(),width:a.width(),outerHeight:a.outerHeight(),outerWidth:a.outerWidth()},"toggle"===e.mode&&"show"===f?(a.from=e.to||y,a.to=e.from||n):(a.from=e.from||("show"===f?y:n),a.to=e.to||("hide"===f?y:n)),o={from:{y:a.from.height/n.height,x:a.from.width/n.width},to:{y:a.to.height/n.height,x:a.to.width/n.width}},("box"===g||"both"===g)&&(o.from.y!==o.to.y&&(b=b.concat(c),a.from=t.effects.setTransition(a,c,o.from.y,a.from),a.to=t.effects.setTransition(a,c,o.to.y,a.to)),o.from.x!==o.to.x&&(b=b.concat(d),a.from=t.effects.setTransition(a,d,o.from.x,a.from),a.to=t.effects.setTransition(a,d,o.to.x,a.to))),("content"===g||"both"===g)&&o.from.y!==o.to.y&&(b=b.concat(u).concat(h),a.from=t.effects.setTransition(a,u,o.from.y,a.from),a.to=t.effects.setTransition(a,u,o.to.y,a.to)),t.effects.save(a,b),a.show(),t.effects.createWrapper(a),a.css("overflow","hidden").css(a.from),m&&(s=t.effects.getBaseline(m,n),a.from.top=(n.outerHeight-a.outerHeight())*s.y,a.from.left=(n.outerWidth-a.outerWidth())*s.x,a.to.top=(n.outerHeight-a.to.outerHeight)*s.y,a.to.left=(n.outerWidth-a.to.outerWidth)*s.x),a.css(a.from),("content"===g||"both"===g)&&(c=c.concat(["marginTop","marginBottom"]).concat(u),d=d.concat(["marginLeft","marginRight"]),h=r.concat(c).concat(d),a.find("*[width]").each(function(){var i=t(this),n={height:i.height(),width:i.width(),outerHeight:i.outerHeight(),outerWidth:i.outerWidth()};p&&t.effects.save(i,h),i.from={height:n.height*o.from.y,width:n.width*o.from.x,outerHeight:n.outerHeight*o.from.y,outerWidth:n.outerWidth*o.from.x},i.to={height:n.height*o.to.y,width:n.width*o.to.x,outerHeight:n.height*o.to.y,outerWidth:n.width*o.to.x},o.from.y!==o.to.y&&(i.from=t.effects.setTransition(i,c,o.from.y,i.from),i.to=t.effects.setTransition(i,c,o.to.y,i.to)),o.from.x!==o.to.x&&(i.from=t.effects.setTransition(i,d,o.from.x,i.from),i.to=t.effects.setTransition(i,d,o.to.x,i.to)),i.css(i.from),i.animate(i.to,e.duration,e.easing,function(){p&&t.effects.restore(i,h)})})),a.animate(a.to,{queue:!1,duration:e.duration,easing:e.easing,complete:function(){0===a.to.opacity&&a.css("opacity",a.from.opacity),"hide"===f&&a.hide(),t.effects.restore(a,b),p||("static"===v?a.css({position:"relative",top:a.to.top,left:a.to.left}):t.each(["top","left"],function(t,e){a.css(e,function(e,i){var n=parseInt(i,10),s=t?a.to.left:a.to.top;return"auto"===i?s+"px":n+s+"px"})})),t.effects.removeWrapper(a),i()}})}}(jQuery),/*!
 * jQuery UI Effects Shake 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/shake-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
function(t){t.effects.effect.shake=function(e,i){var n,s=t(this),o=["position","top","bottom","left","right","height","width"],a=t.effects.setMode(s,e.mode||"effect"),r=e.direction||"left",l=e.distance||20,h=e.times||3,u=2*h+1,c=Math.round(e.duration/u),d="up"===r||"down"===r?"top":"left",f="up"===r||"left"===r,p={},g={},m={},v=s.queue(),b=v.length;for(t.effects.save(s,o),s.show(),t.effects.createWrapper(s),p[d]=(f?"-=":"+=")+l,g[d]=(f?"+=":"-=")+2*l,m[d]=(f?"-=":"+=")+2*l,s.animate(p,c,e.easing),n=1;h>n;n++)s.animate(g,c,e.easing).animate(m,c,e.easing);s.animate(g,c,e.easing).animate(p,c/2,e.easing).queue(function(){"hide"===a&&s.hide(),t.effects.restore(s,o),t.effects.removeWrapper(s),i()}),b>1&&v.splice.apply(v,[1,0].concat(v.splice(b,u+1))),s.dequeue()}}(jQuery),/*!
 * jQuery UI Effects Slide 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/slide-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
function(t){t.effects.effect.slide=function(e,i){var n,s=t(this),o=["position","top","bottom","left","right","width","height"],a=t.effects.setMode(s,e.mode||"show"),r="show"===a,l=e.direction||"left",h="up"===l||"down"===l?"top":"left",u="up"===l||"left"===l,c={};t.effects.save(s,o),s.show(),n=e.distance||s["top"===h?"outerHeight":"outerWidth"](!0),t.effects.createWrapper(s).css({overflow:"hidden"}),r&&s.css(h,u?isNaN(n)?"-"+n:-n:n),c[h]=(r?u?"+=":"-=":u?"-=":"+=")+n,s.animate(c,{queue:!1,duration:e.duration,easing:e.easing,complete:function(){"hide"===a&&s.hide(),t.effects.restore(s,o),t.effects.removeWrapper(s),i()}})}}(jQuery),/*!
 * jQuery UI Effects Transfer 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/transfer-effect/
 *
 * Depends:
 *	jquery.ui.effect.js
 */
function(t){t.effects.effect.transfer=function(e,i){var n=t(this),s=t(e.to),o="fixed"===s.css("position"),a=t("body"),r=o?a.scrollTop():0,l=o?a.scrollLeft():0,h=s.offset(),u={top:h.top-r,left:h.left-l,height:s.innerHeight(),width:s.innerWidth()},c=n.offset(),d=t("<div class='ui-effects-transfer'></div>").appendTo(document.body).addClass(e.className).css({top:c.top-r,left:c.left-l,height:n.innerHeight(),width:n.innerWidth(),position:o?"fixed":"absolute"}).animate(u,e.duration,e.easing,function(){d.remove(),i()})}}(jQuery);