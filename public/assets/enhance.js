/*
 * EnhanceJS version 1.1 - Test-Driven Progressive Enhancement
 * http://enhancejs.googlecode.com/
 * Copyright (c) 2010 Filament Group, Inc, authors.txt
 * Licensed under MIT (license.txt)
*/
!function(e,t,n){function a(){return!!t.cookie}function i(){L(C.testName,"fail"),e.location.reload()}function r(){L(C.testName,"pass"),e.location.reload()}function o(){E(C.testName),e.location.reload()}function d(){M=t.createElement("body"),A.insertBefore(M,A.firstChild),w=M}function s(){A.removeChild(M),w=t.body}function c(){var e=b(C.testName);if(e)"pass"===e?(m(),C.onPass()):(C.onFail(),u()),C.appendToggleLink&&l(function(){f(e)});else{var t=!0;d();for(var n in C.tests)if(t=C.tests[n](),!t){C.alertOnFailure&&alert(n+" failed");break}s(),e=t?"pass":"fail",L(C.testName,e),t?(m(),C.onPass()):(C.onFail(),u()),C.appendToggleLink&&l(function(){f(e)})}}function l(t){if(B)t();else{var n=e.onload;e.onload=function(){n&&n(),t()}}}function f(e){if(C.appendToggleLink&&enhance.cookiesSupported&&e){var n=t.createElement("a");n.href="#",n.className=C.testName+"_toggleResult",n.innerHTML="pass"===e?C.forceFailText:C.forcePassText,n.onclick="pass"===e?enhance.forceFail:enhance.forcePass,t.getElementsByTagName("body")[0].appendChild(n)}}function u(){A.className=A.className.replace(C.testName,"")}function m(){F=!0,C.loadStyles.length&&x(),C.loadScripts.length?y():C.onScriptsLoaded()}function p(t,n){b(j)&&b(P)?(E(j),E(P)):(L(j,t),L(P,n)),e.location.reload()}function h(e){return 2==H.length&&(e==H[0]?e=H[1]:e==H[1]&&(e=H[0])),e}function v(){var e=C.testName+"-incomplete";-1===A.className.indexOf(e)&&(A.className+=" "+e)}function g(e){if(e.constructor===Array){var t=!0;for(var n in e)t&&(t=!!e[n]);return t}return!!e}function x(){for(var e,a=-1;e=C.loadStyles[++a];){var i=t.createElement("link");if(i.type="text/css",i.rel="stylesheet",i.onerror=C.onLoadError,"string"==typeof e)i.href=e,O.appendChild(i);else{e.media&&(e.media=h(e.media),C.media&&C.media[e.media]!==n&&(e.media=C.media[e.media])),e.excludemedia&&(e.excludemedia=h(e.excludemedia));var r=!0;if(e.media&&"print"!==e.media&&"projection"!==e.media&&"speech"!==e.media&&"aural"!==e.media&&"braille"!==e.media&&(r=q(e.media)),r&&e.excludemedia&&(r=!q(e.excludemedia)),r&&e.iecondition&&(r=X(e.iecondition)),r&&e.ifsupported!==n&&(r=g(e.ifsupported),r||e.fallback===n||(e.href=e.fallback,r=!0)),r){for(var o in e)"iecondition"!==o&&"excludemedia"!==o&&"ifsupported"!==o&&"fallback"!==o&&i.setAttribute(o,e[o]);O.appendChild(i)}}}}function y(){C.queueLoading?T():S()}function T(){function e(){if(0===t.length)return!1;var n=t.shift(),a=N(n),i=!1;return a?(a.onload=a.onreadystatechange=function(){i||this.readyState&&"loaded"!=this.readyState&&"complete"!=this.readyState||(i=!0,e()===!1&&C.onScriptsLoaded(),this.onload=this.onreadystatechange=null)},O.insertBefore(a,O.firstChild),void 0):e()}var t=[].concat(C.loadScripts);e()}function S(){for(var e,t=-1;e=C.loadScripts[++t];){var n=N(e);n&&O.insertBefore(n,O.firstChild)}C.onScriptsLoaded()}function N(e){var a=t.createElement("script");if(a.type="text/javascript",a.onerror=C.onLoadError,"string"==typeof e)return a.src=e,a;e.media&&(e.media=h(e.media),C.media&&C.media[e.media]&&(e.media=C.media[e.media])),e.excludemedia&&(e.excludemedia=h(e.excludemedia));var i=!0;if(e.media&&(i=q(e.media)),i&&e.excludemedia&&(i=!q(e.excludemedia)),i&&e.iecondition&&(i=X(e.iecondition)),i&&e.ifsupported!==n&&(i=g(e.ifsupported),i||e.fallback===n||(e.src=e.fallback,i=!0)),i){for(var r in e)"iecondition"!==r&&"media"!==r&&"excludemedia"!==r&&"ifsupported"!==r&&"fallback"!==r&&a.setAttribute(r,e[r]);return a}return!1}function L(e,n,a){a=a||90;var i=new Date;i.setTime(i.getTime()+1e3*60*60*24*a);var r="; expires="+i.toGMTString();t.cookie=e+"="+n+r+"; path=/"}function b(e){for(var n=e+"=",a=t.cookie.split(";"),i=0;i<a.length;i++){for(var r=a[i];" "==r.charAt(0);)r=r.substring(1,r.length);if(0==r.indexOf(n))return r.substring(n.length,r.length)}return null}function E(e){L(e,"",-1)}function k(){null==t.readyState&&t.addEventListener&&(t.addEventListener("DOMContentLoaded",function e(){t.removeEventListener("DOMContentLoaded",e,!1),t.readyState="complete"},!1),t.readyState="loading")}var C,w,M,B,O,j,P,A=t.documentElement,F=!1,H=[];O=t.getElementsByTagName?t.getElementsByTagName("head")[0]||A:A;var q=function(){var e={},a=t.createElement("div");return a.setAttribute("id","ejs-qtest"),function(i){if(e[i]===n){d();var r=t.createElement("style");r.type="text/css",O.appendChild(r);var o="@media "+i+" { #ejs-qtest { position: absolute; width: 10px; } }";r.styleSheet?r.styleSheet.cssText=o:r.appendChild(t.createTextNode(o)),w.appendChild(a);var c=a.offsetWidth;w.removeChild(a),O.removeChild(r),s(),e[i]=10==c}return e[i]}}();e.enhance=function(e){e=e||{},C={};for(var t in enhance.defaultSettings){var a=e[t];C[t]=a!==n?a:enhance.defaultSettings[t]}for(var i in e.addTests)C.tests[i]=e.addTests[i];-1===A.className.indexOf(C.testName)&&(A.className+=" "+C.testName),j=C.testName+"-toggledmediaA",P=C.testName+"-toggledmediaB",H=[b(j),b(P)],setTimeout(function(){F||u()},3e3),c(),k(),l(function(){B=!0})},enhance.query=q,enhance.defaultTests={getById:function(){return!!t.getElementById},getByTagName:function(){return!!t.getElementsByTagName},createEl:function(){return!!t.createElement},boxmodel:function(){var e=t.createElement("div");e.style.cssText="width: 1px; padding: 1px;",w.appendChild(e);var n=e.offsetWidth;return w.removeChild(e),3===n},position:function(){var e=t.createElement("div");e.style.cssText="position: absolute; left: 10px;",w.appendChild(e);var n=e.offsetLeft;return w.removeChild(e),10===n},floatClear:function(){var e=!1,n=t.createElement("div"),a='style="width: 5px; height: 5px; float: left;"';n.innerHTML="<div "+a+"></div><div "+a+"></div>",w.appendChild(n);var i=n.childNodes,r=i[0].offsetTop,o=i[1],d=o.offsetTop;return r===d&&(o.style.clear="left",d=o.offsetTop,r!==d&&(e=!0)),w.removeChild(n),e},heightOverflow:function(){var e=t.createElement("div");e.innerHTML='<div style="height: 10px;"></div>',e.style.cssText="overflow: hidden; height: 0;",w.appendChild(e);var n=e.offsetHeight;return w.removeChild(e),0===n},ajax:function(){for(var e,t=!1,n=-1,a=[function(){return new XMLHttpRequest},function(){return new ActiveXObject("Msxml2.XMLHTTP")},function(){return new ActiveXObject("Msxml3.XMLHTTP")},function(){return new ActiveXObject("Microsoft.XMLHTTP")}];e=a[++n];){try{t=e()}catch(i){continue}break}return!!t},resize:function(){return 0!=e.onresize},print:function(){return!!e.print}},enhance.defaultSettings={testName:"enhanced",loadScripts:[],loadStyles:[],queueLoading:!0,appendToggleLink:!0,forcePassText:"View high-bandwidth version",forceFailText:"View low-bandwidth version",tests:enhance.defaultTests,media:{"-ejs-desktop":enhance.query("screen and (max-device-width: 1024px)")?"not screen and (max-device-width: 1024px)":"screen","-ejs-handheld":"screen and (max-device-width: 1024px)"},addTests:{},alertOnFailure:!1,onPass:function(){},onFail:function(){},onLoadError:v,onScriptsLoaded:function(){}},enhance.cookiesSupported=a(),enhance.cookiesSupported&&(enhance.forceFail=i),enhance.cookiesSupported&&(enhance.forcePass=r),enhance.cookiesSupported&&(enhance.reTest=o),enhance.toggleMedia=p;var X=function(){return function(e){return!1}}()}(window,document);