/*!
 * jQuery UI Position 1.10.3
 * http://jqueryui.com
 *
 * Copyright 2013 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 *
 * http://api.jqueryui.com/position/
 */
!function(t,e){function i(t,e,i){return[parseFloat(t[0])*(f.test(t[0])?e/100:1),parseFloat(t[1])*(f.test(t[1])?i/100:1)]}function n(e,i){return parseInt(t.css(e,i),10)||0}function s(e){var i=e[0];return 9===i.nodeType?{width:e.width(),height:e.height(),offset:{top:0,left:0}}:t.isWindow(i)?{width:e.width(),height:e.height(),offset:{top:e.scrollTop(),left:e.scrollLeft()}}:i.preventDefault?{width:0,height:0,offset:{top:i.pageY,left:i.pageX}}:{width:e.outerWidth(),height:e.outerHeight(),offset:e.offset()}}t.ui=t.ui||{};var o,a=Math.max,r=Math.abs,l=Math.round,h=/left|center|right/,u=/top|center|bottom/,c=/[\+\-]\d+(\.[\d]+)?%?/,d=/^\w+/,f=/%$/,p=t.fn.position;t.position={scrollbarWidth:function(){if(o!==e)return o;var i,n,s=t("<div style='display:block;width:50px;height:50px;overflow:hidden;'><div style='height:100px;width:auto;'></div></div>"),a=s.children()[0];return t("body").append(s),i=a.offsetWidth,s.css("overflow","scroll"),n=a.offsetWidth,i===n&&(n=s[0].clientWidth),s.remove(),o=i-n},getScrollInfo:function(e){var i=e.isWindow?"":e.element.css("overflow-x"),n=e.isWindow?"":e.element.css("overflow-y"),s="scroll"===i||"auto"===i&&e.width<e.element[0].scrollWidth,o="scroll"===n||"auto"===n&&e.height<e.element[0].scrollHeight;return{width:o?t.position.scrollbarWidth():0,height:s?t.position.scrollbarWidth():0}},getWithinInfo:function(e){var i=t(e||window),n=t.isWindow(i[0]);return{element:i,isWindow:n,offset:i.offset()||{left:0,top:0},scrollLeft:i.scrollLeft(),scrollTop:i.scrollTop(),width:n?i.width():i.outerWidth(),height:n?i.height():i.outerHeight()}}},t.fn.position=function(e){if(!e||!e.of)return p.apply(this,arguments);e=t.extend({},e);var o,f,g,m,v,b,_=t(e.of),y=t.position.getWithinInfo(e.within),w=t.position.getScrollInfo(y),x=(e.collision||"flip").split(" "),k={};return b=s(_),_[0].preventDefault&&(e.at="left top"),f=b.width,g=b.height,m=b.offset,v=t.extend({},m),t.each(["my","at"],function(){var t,i,n=(e[this]||"").split(" ");1===n.length&&(n=h.test(n[0])?n.concat(["center"]):u.test(n[0])?["center"].concat(n):["center","center"]),n[0]=h.test(n[0])?n[0]:"center",n[1]=u.test(n[1])?n[1]:"center",t=c.exec(n[0]),i=c.exec(n[1]),k[this]=[t?t[0]:0,i?i[0]:0],e[this]=[d.exec(n[0])[0],d.exec(n[1])[0]]}),1===x.length&&(x[1]=x[0]),"right"===e.at[0]?v.left+=f:"center"===e.at[0]&&(v.left+=f/2),"bottom"===e.at[1]?v.top+=g:"center"===e.at[1]&&(v.top+=g/2),o=i(k.at,f,g),v.left+=o[0],v.top+=o[1],this.each(function(){var s,h,u=t(this),c=u.outerWidth(),d=u.outerHeight(),p=n(this,"marginLeft"),b=n(this,"marginTop"),C=c+p+n(this,"marginRight")+w.width,T=d+b+n(this,"marginBottom")+w.height,D=t.extend({},v),S=i(k.my,u.outerWidth(),u.outerHeight());"right"===e.my[0]?D.left-=c:"center"===e.my[0]&&(D.left-=c/2),"bottom"===e.my[1]?D.top-=d:"center"===e.my[1]&&(D.top-=d/2),D.left+=S[0],D.top+=S[1],t.support.offsetFractions||(D.left=l(D.left),D.top=l(D.top)),s={marginLeft:p,marginTop:b},t.each(["left","top"],function(i,n){t.ui.position[x[i]]&&t.ui.position[x[i]][n](D,{targetWidth:f,targetHeight:g,elemWidth:c,elemHeight:d,collisionPosition:s,collisionWidth:C,collisionHeight:T,offset:[o[0]+S[0],o[1]+S[1]],my:e.my,at:e.at,within:y,elem:u})}),e.using&&(h=function(t){var i=m.left-D.left,n=i+f-c,s=m.top-D.top,o=s+g-d,l={target:{element:_,left:m.left,top:m.top,width:f,height:g},element:{element:u,left:D.left,top:D.top,width:c,height:d},horizontal:0>n?"left":i>0?"right":"center",vertical:0>o?"top":s>0?"bottom":"middle"};c>f&&r(i+n)<f&&(l.horizontal="center"),d>g&&r(s+o)<g&&(l.vertical="middle"),l.important=a(r(i),r(n))>a(r(s),r(o))?"horizontal":"vertical",e.using.call(this,t,l)}),u.offset(t.extend(D,{using:h}))})},t.ui.position={fit:{left:function(t,e){var i,n=e.within,s=n.isWindow?n.scrollLeft:n.offset.left,o=n.width,r=t.left-e.collisionPosition.marginLeft,l=s-r,h=r+e.collisionWidth-o-s;e.collisionWidth>o?l>0&&0>=h?(i=t.left+l+e.collisionWidth-o-s,t.left+=l-i):t.left=h>0&&0>=l?s:l>h?s+o-e.collisionWidth:s:l>0?t.left+=l:h>0?t.left-=h:t.left=a(t.left-r,t.left)},top:function(t,e){var i,n=e.within,s=n.isWindow?n.scrollTop:n.offset.top,o=e.within.height,r=t.top-e.collisionPosition.marginTop,l=s-r,h=r+e.collisionHeight-o-s;e.collisionHeight>o?l>0&&0>=h?(i=t.top+l+e.collisionHeight-o-s,t.top+=l-i):t.top=h>0&&0>=l?s:l>h?s+o-e.collisionHeight:s:l>0?t.top+=l:h>0?t.top-=h:t.top=a(t.top-r,t.top)}},flip:{left:function(t,e){var i,n,s=e.within,o=s.offset.left+s.scrollLeft,a=s.width,l=s.isWindow?s.scrollLeft:s.offset.left,h=t.left-e.collisionPosition.marginLeft,u=h-l,c=h+e.collisionWidth-a-l,d="left"===e.my[0]?-e.elemWidth:"right"===e.my[0]?e.elemWidth:0,f="left"===e.at[0]?e.targetWidth:"right"===e.at[0]?-e.targetWidth:0,p=-2*e.offset[0];0>u?(i=t.left+d+f+p+e.collisionWidth-a-o,(0>i||i<r(u))&&(t.left+=d+f+p)):c>0&&(n=t.left-e.collisionPosition.marginLeft+d+f+p-l,(n>0||r(n)<c)&&(t.left+=d+f+p))},top:function(t,e){var i,n,s=e.within,o=s.offset.top+s.scrollTop,a=s.height,l=s.isWindow?s.scrollTop:s.offset.top,h=t.top-e.collisionPosition.marginTop,u=h-l,c=h+e.collisionHeight-a-l,d="top"===e.my[1],f=d?-e.elemHeight:"bottom"===e.my[1]?e.elemHeight:0,p="top"===e.at[1]?e.targetHeight:"bottom"===e.at[1]?-e.targetHeight:0,g=-2*e.offset[1];0>u?(n=t.top+f+p+g+e.collisionHeight-a-o,t.top+f+p+g>u&&(0>n||n<r(u))&&(t.top+=f+p+g)):c>0&&(i=t.top-e.collisionPosition.marginTop+f+p+g-l,t.top+f+p+g>c&&(i>0||r(i)<c)&&(t.top+=f+p+g))}},flipfit:{left:function(){t.ui.position.flip.left.apply(this,arguments),t.ui.position.fit.left.apply(this,arguments)},top:function(){t.ui.position.flip.top.apply(this,arguments),t.ui.position.fit.top.apply(this,arguments)}}},function(){var e,i,n,s,o,a=document.getElementsByTagName("body")[0],r=document.createElement("div");e=document.createElement(a?"div":"body"),n={visibility:"hidden",width:0,height:0,border:0,margin:0,background:"none"},a&&t.extend(n,{position:"absolute",left:"-1000px",top:"-1000px"});for(o in n)e.style[o]=n[o];e.appendChild(r),i=a||document.documentElement,i.insertBefore(e,i.firstChild),r.style.cssText="position: absolute; left: 10.7432222px;",s=t(r).offset().left,t.support.offsetFractions=s>10&&11>s,e.innerHTML="",i.removeChild(e)}()}(jQuery);