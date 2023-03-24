// Collection of scriptlets to be used for injection in uBlock Origin.

'use strict';

/// eval-logger
/// alias eval-logger.js
(() => {
	'use strict';
	let z = window.eval,
		log = console.log.bind(console);
	window.eval = function(a) {
		log('uBO: eval("%s")', String(a));
		return z.apply(this, arguments);
	}.bind(window);
})();

/// decodeURIComponent-logger
/// alias duc-logger.js
(() => {
    let z = window.decodeURIComponent,
        log = console.log.bind(console);
    window.decodeURIComponent = function(a) {
        log('uBO: decodeURIComponent("%s")', a.toString());
        return z.apply(this, arguments);
    }.bind(window);
})();

/// encodeURIComponent-logger
/// alias euc-logger.js
(() => {
    let z = window.encodeURIComponent,
        log = console.log.bind(console);
    window.encodeURIComponent = function(a) {
        log('uBO: encodeURIComponent("%s")', a.toString());
        return z.apply(this, arguments);
    }.bind(window);
})();

/// document.write-defuser
/// alias dwrite.js
(() => {
    let needle = '{{1}}';
    if (needle === '' || needle === '{{1}}') {
        needle = '.?';
    } else if (needle.slice(0, 1) === '/' && needle.slice(-1) === '/') {
        needle = needle.slice(1, -1);
    } else {
        needle = needle.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
    }
    needle = new RegExp(needle);
    rdwrite = document.write.bind(document);
    window.document.write = function(a) {
        if (!needle.test(String(a))) {
            rdwrite.call(window, a);
        }
    }.bind(window);
})();

/// document.write-logger
/// alias dwrite-logger.js
(() => {
    let z = window.document.write.bind(document),
        log = console.log.bind(console);
    window.document.write = function(a) {
        log('uBO: document.write("%s")', String(a));
        return z.apply(this, arguments);
    }.bind(window);
})();

/// document.createElement-logger
/// alias dce-logger.js
(() => {
	let z = window.document.createElement.bind(document),
		log = console.log.bind(console);
	window.document.createElement = function(a) {
		log('uBO: document.createElement("%s")', a.toString());
		return z.apply(this, arguments);
	}.bind(window);
})();

/// document.getElementsByName-logger
/// alias dgebn-logger.js
(() => {
	let z = window.document.getElementsByName.bind(document),
		log = console.log.bind(console);
	window.document.getElementsByName = function(a) {
		log('uBO: document.getElementsByName("%s")', a.toString());
		return z.apply(this, arguments);
	}.bind(window);
})();

/// document.getElementsByTagName-logger
/// alias dgebtn-logger.js
(() => {
	let z = window.document.getElementsByTagName.bind(document),
		log = console.log.bind(console);
	window.document.getElementsByTagName = function(a) {
		log('uBO: document.getElementsByTagName("%s")', a.toString());
		return z.apply(this, arguments);
	}.bind(window);
})();

/// mouseclick-defuser
/// alias mousedef.js
(() => {
    'use strict';
    document.body.removeAttribute('oncopy');
    document.body.removeAttribute('onselectstart');
    document.body.removeAttribute('ondragstart');
    document.body.removeAttribute('ondrag');
    document.oncopy = null;
    document.onselectstart = null;
    document.ondragstart = null;
    document.ondrag = null;
})();

/// mouseclick-defuser-2
/// alias mousedef2.js
! function() {
    function e(e) {
        for (var t = 0; t < r.length; t++) {
            var n = r[t],
                o = "on" + n;
            e[o] && (e[o] = null), e.addEventListener(n, function(e) {
                e.stopPropagation()
            }, !0)
        }
    }
    var r = ["contextmenu", "copy", "cut", "paste", "mousedown", "mouseup", "beforeunload", "beforeprint", "keyup", "keydown", "select", "selectstart"];
    e(window);
    for (var t, n = window.frames, o = 0; o < n.length; o++) try {
        e(n[o])
    } catch (e) {}(t = document.createElement("style")).type = "text/css", t.innerHTML = "* { -webkit-touch-callout: default !important; -webkit-user-select: text !important; -moz-user-select: text !important; -ms-user-select: text !important; user-select: text !important; } ", document.head.appendChild(t)
}();

/// oncontextmenu-defuser
/// alias contextmenudef.js
function clearEventListeners() {
    document.oncontextmenu = null;
    document.body.removeAttribute("oncontextmenu")
}
window.addEventListener('load', clearEventListeners, false);

/// btoa-logger
/// alias btoa-logger.js
(() => {
	let z = window.btoa,
		log = console.log.bind(console);
	window.btoa = function(a) {
		log('uBO: btoa("%s")', a.toString());
		return z.apply(this, arguments);
	}.bind(window);
})();

/// cookie-setter
/// alias cookie-set.js
(() => {
	     'use strict';
	     document.cookie = '{{1}}={{2}}; max-age={{3}}; secure; path=/;';
})();

/// js-rm
/// alias js-rm.js
(() => { 
	  'use strict';
	  let needle = '{{1}}';
	  if ( needle === '' || needle === '{{1}}' ) {
	      needle = '.?';
	  } else if ( needle.slice(0,1) === '/' && needle.slice(-1) === '/' ) {
	      needle = needle.slice(1,-1);
	  } else {
	      needle = needle.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
	  }
	  needle = new RegExp(needle);
	  const jsnode = () => {
				    try {
					    const jss = document.querySelectorAll('script');
					    for (const js of jss) {
						    if (js.outerHTML.match(needle)) {
							js.textContent = '';
							js.remove();
					   	    }			
					    }
				    } catch { }
	  };
	  const observer = new MutationObserver(jsnode);
	  observer.observe(document.documentElement, { childList: true, subtree: true });
	  if (document.readyState === 'complete') { observer.disconnect(); return; }
})();

/// css-rm
/// alias css-rm.js
(() => { 
          'use strict';
	  let needle = '{{1}}';
          if ( needle === '' || needle === '{{1}}' ) {
              needle = '.?';
          } else if ( needle.slice(0,1) === '/' && needle.slice(-1) === '/' ) {
              needle = needle.slice(1,-1);
          } else {
              needle = needle.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
          }
          needle = new RegExp(needle);
          const cssnode = () => {
                                         try {
                                          	const css = document.querySelectorAll('style');
                                          	for (const cs of css) {
                                              		if (cs.outerHTML.match(needle)) {
								cs.textContent = '';
								cs.remove();
							}			
                                          	}
                                   	 } catch { }
          };
          const observer = new MutationObserver(cssnode);
	  observer.observe(document.documentElement, { childList: true, subtree: true });
	  if (document.readyState === 'complete') { observer.disconnect(); return; }
})();

/// frame-rm
/// alias frame-rm.js
(() => { 
          'use strict';
	  let needle = '{{1}}';
          if ( needle === '' || needle === '{{1}}' ) {
              needle = '.?';
          } else if ( needle.slice(0,1) === '/' && needle.slice(-1) === '/' ) {
              needle = needle.slice(1,-1);
          } else {
              needle = needle.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
          }
          needle = new RegExp(needle);
          const framenode = () => {
                                           try {
                                          	 const frames = document.querySelectorAll('iframe');
                                          	 for (const frame of frames) {
                                              		if (frame.outerHTML.match(needle)) {
                                                                	frame.textContent = '';
									frame.remove();
                                              		}			
                                          	 }
                                   	   } catch { }
          };
          const observer = new MutationObserver(framenode);
	  observer.observe(document.documentElement, { childList: true, subtree: true });
	  if (document.readyState === 'complete') { observer.disconnect(); return; }
})();

/// meta-rm
/// alias meta-rm.js
(() => { 
          'use strict';
	  let needle = '{{1}}';
          if ( needle === '' || needle === '{{1}}' ) {
              needle = '.?';
          } else if ( needle.slice(0,1) === '/' && needle.slice(-1) === '/' ) {
              needle = needle.slice(1,-1);
          } else {
              needle = needle.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
          }
          needle = new RegExp(needle);
          const metanode = () => {
                                          try {
                                          	const metas = document.querySelectorAll('meta');
                                          	for (const meta of metas) {
                                              		if (meta.outerHTML.match(needle)) {
                                                                	meta.textContent = '';
									meta.remove();
                                              		}			
                                          	}
                                   	  } catch { }
          };
          const observer = new MutationObserver(metanode);
	  observer.observe(document.documentElement, { childList: true, subtree: true });
	  if (document.readyState === 'complete') { observer.disconnect(); return; } 
})();

/// javascript-logger
/// alias js-logger.js
(() => {
		'use strict';
		const logscripts = ev => {
						  if (ev) { window.removeEventListener(ev.type, logscripts, true); }
						  try {
							const scripts = document.querySelectorAll('script');
							const log = console.log.bind(console);
								for (const script of scripts) {
									if (script.outerHTML) {
										log('uBO: javascript("%s")', script.outerHTML);
									}	
								}
						  } catch(ex) {
						  }
		};
		if (document.readyState === 'complete') {
			logscripts(); 
		} else {
			window.addEventListener('load', logscripts, true);
		}
})();

/// noscript-logger
/// alias noscript-logger.js
(() => {
		'use strict';
		const lognoscripts = ev => {
					    if (ev) { window.removeEventListener(ev.type, lognoscripts, true); }
					    try {
						 const noscripts = document.querySelectorAll('noscript');
						 const log = console.log.bind(console);
							for (const noscript of noscripts) {
								if (noscript.outerHTML) {
									log('uBO: noscript("%s")', noscript.outerHTML);
								}	
							}
					    } catch(ex) {
					    }
		};
		if (document.readyState === 'complete') {
			lognoscripts(); 
		} else {
			window.addEventListener('load', lognoscripts, true);
		}
})();

/// div-tag-logger
/// alias div-logger.js
(() => {
		'use strict';
		const logdivs = ev => {
					  if (ev) { window.removeEventListener(ev.type, logdivs, true); }
					  try {
						const divs = document.querySelectorAll('div');
						const log = console.log.bind(console);
						for (const div of divs) {
							if (div.outerHTML) {
								log('uBO: div("%s")', div.outerHTML);
							}	
						}
					  } catch(ex) {
					  }
		};
		if (document.readyState === 'complete') {
			logdivs(); 
		} else {
			window.addEventListener('load', logdivs, true);
		}
})();

/// element-clicker
/// alias eclick.js
(() => {
	'use strict';
	let selector = '{{1}}';
	if ( selector === '' || selector === '{{1}}' ) {
		return;
	}
	let click = () => {
		let element = document.querySelector(selector);
		element.click();
	};
	if ( document.readyState === 'interactive' || document.readyState === 'complete' ) {
		click();
	} else {
		addEventListener('DOMContentLoaded', click);
	}
})();

/// element-clicker-onload
/// alias eclick2.js
(() => {
		'use strict';
		 let selector = '{{1}}';
			if ( selector === '' || selector === '{{1}}' ) {
			return;
		}
		 let click = () => {
			let element = document.querySelector(selector);
			element.click();
		};
		if (document.readyState === 'complete') {
			click();
		} else {
			addEventListener('load', click);
		}
})();