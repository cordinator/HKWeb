(function() {
	function n(p, m) {
		var q = this, r = document, o;
		q.wrapper = typeof p == "object" ? p : r.getElementById(p);
		q.wrapper.style.overflow = "hidden";
		q.scroller = q.wrapper.children[0];
		q.scroller.style.cssText += "-webkit-transition-property:-webkit-transform;-webkit-transform-origin:0 0;-webkit-transform:"
				+ a + "0,0" + g;
		q.scroller.style.cssText += "-webkit-transition-timing-function:cubic-bezier(0.33,0.66,0.66,1);-webkit-transition-duration:0;";
		q.options = {
			hScroll : true,
			vScroll : true,
			bounce : i,
			bounceLock : false,
			momentum : i,
			lockDirection : true,
			hScrollbar : true,
			vScrollbar : true,
			fixedScrollbar : k,
			fadeScrollbar : (l && i) || !h,
			hideScrollbar : l || !h,
			scrollbarClass : "",
			onScrollStart : null,
			onScrollEnd : null,
		};
		for (o in m) {
			q.options[o] = m[o]
		}
		q.options.hScrollbar = q.options.hScroll && q.options.hScrollbar;
		q.options.vScrollbar = q.options.vScroll && q.options.vScrollbar;
		q.refresh();
		q._bind(j, window);
		q._bind(e)
	}
	n.prototype = {
		x : 0,
		y : 0,
		handleEvent : function(o) {
			var m = this;
			switch (o.type) {
			case e:
				m._start(o);
				break;
			case d:
				m._move(o);
				break;
			case f:
			case b:
				m._end(o);
				break;
			case "webkitTransitionEnd":
				m._transitionEnd(o);
				break;
			case j:
				m._resize();
				break
			}
		},
		_scrollbar : function(m) {
			var p = this, q = document, o;
			if (!p[m + "Scrollbar"]) {
				if (p[m + "ScrollbarWrapper"]) {
					p[m + "ScrollbarIndicator"].style.webkitTransform = "";
					p[m + "ScrollbarWrapper"].parentNode.removeChild(p[m
							+ "ScrollbarWrapper"]);
					p[m + "ScrollbarWrapper"] = null;
					p[m + "ScrollbarIndicator"] = null
				}
				return
			}
			if (!p[m + "ScrollbarWrapper"]) {
				o = q.createElement("div");
				if (p.options.scrollbarClass) {
					o.className = p.options.scrollbarClass + m.toUpperCase()
				} else {
					o.style.cssText = "position:absolute;z-index:100;"
							+ (m == "h" ? "height:7px;bottom:1px;left:2px;right:7px"
									: "width:7px;bottom:7px;top:2px;right:1px")
				}
				o.style.cssText += "pointer-events:none;-webkit-transition-property:opacity;-webkit-transition-duration:"
						+ (p.options.fadeScrollbar ? "350ms" : "0")
						+ ";overflow:hidden;opacity:"
						+ (p.options.hideScrollbar ? "0" : "1");
				p.wrapper.appendChild(o);
				p[m + "ScrollbarWrapper"] = o;
				o = q.createElement("div");
				if (!p.options.scrollbarClass) {
					o.style.cssText = "position:absolute;z-index:100;background:rgba(0,0,0,0.5);border:1px solid rgba(255,255,255,0.9);-webkit-background-clip:padding-box;-webkit-box-sizing:border-box;"
							+ (m == "h" ? "height:100%;-webkit-border-radius:4px 3px;"
									: "width:100%;-webkit-border-radius:3px 4px;")
				}
				o.style.cssText += "pointer-events:none;-webkit-transition-property:-webkit-transform;-webkit-transition-timing-function:cubic-bezier(0.33,0.66,0.66,1);-webkit-transition-duration:0;-webkit-transform:"
						+ a + "0,0" + g;
				p[m + "ScrollbarWrapper"].appendChild(o);
				p[m + "ScrollbarIndicator"] = o
			}
			if (m == "h") {
				p.hScrollbarSize = p.hScrollbarWrapper.clientWidth;
				p.hScrollbarIndicatorSize = c.max(c.round(p.hScrollbarSize
						* p.hScrollbarSize / p.scrollerW), 8);
				p.hScrollbarIndicator.style.width = p.hScrollbarIndicatorSize
						+ "px";
				p.hScrollbarMaxScroll = p.hScrollbarSize
						- p.hScrollbarIndicatorSize;
				p.hScrollbarProp = p.hScrollbarMaxScroll / p.maxScrollX
			} else {
				p.vScrollbarSize = p.vScrollbarWrapper.clientHeight;
				p.vScrollbarIndicatorSize = c.max(c.round(p.vScrollbarSize
						* p.vScrollbarSize / p.scrollerH), 8);
				p.vScrollbarIndicator.style.height = p.vScrollbarIndicatorSize
						+ "px";
				p.vScrollbarMaxScroll = p.vScrollbarSize
						- p.vScrollbarIndicatorSize;
				p.vScrollbarProp = p.vScrollbarMaxScroll / p.maxScrollY
			}
			p._indicatorPos(m, true)
		},
		_resize : function() {
			var m = this;
			setTimeout(function() {
				m.refresh()
			}, 0)
		},
		_pos : function(m, p) {
			var o = this;
			o.x = o.hScroll ? m : 0;
			o.y = o.vScroll ? p : 0;
			o.scroller.style.webkitTransform = a + o.x + "px," + o.y + "px" + g;
			o._indicatorPos("h");
			o._indicatorPos("v")
		},
		_indicatorPos : function(m, p) {
			var o = this, q = m == "h" ? o.x : o.y;
			if (!o[m + "Scrollbar"]) {
				return
			}
			q = o[m + "ScrollbarProp"] * q;
			if (q < 0) {
				q = o.options.fixedScrollbar ? 0 : q + q * 3;
				if (o[m + "ScrollbarIndicatorSize"] + q < 9) {
					q = -o[m + "ScrollbarIndicatorSize"] + 8
				}
			} else {
				if (q > o[m + "ScrollbarMaxScroll"]) {
					q = o.options.fixedScrollbar ? o[m + "ScrollbarMaxScroll"]
							: q + (q - o[m + "ScrollbarMaxScroll"]) * 3;
					if (o[m + "ScrollbarIndicatorSize"]
							+ o[m + "ScrollbarMaxScroll"] - q < 9) {
						q = o[m + "ScrollbarIndicatorSize"]
								+ o[m + "ScrollbarMaxScroll"] - 8
					}
				}
			}
			o[m + "ScrollbarWrapper"].style.webkitTransitionDelay = "0";
			o[m + "ScrollbarWrapper"].style.opacity = p
					&& o.options.hideScrollbar ? "0" : "1";
			o[m + "ScrollbarIndicator"].style.webkitTransform = a
					+ (m == "h" ? q + "px,0" : "0," + q + "px") + g
		},
		_transitionTime : function(o) {
			var m = this;
			o += "ms";
			m.scroller.style.webkitTransitionDuration = o;
			if (m.hScrollbar) {
				m.hScrollbarIndicator.style.webkitTransitionDuration = o
			}
			if (m.vScrollbar) {
				m.vScrollbarIndicator.style.webkitTransitionDuration = o
			}
		},
		_start : function(q) {
			var p = this, m = h ? q.changedTouches[0] : q, o;
			p.moved = false;
			q.preventDefault();
			p.moved = false;
			p.distX = 0;
			p.distY = 0;
			p.absDistX = 0;
			p.absDistY = 0;
			p.dirX = 0;
			p.dirY = 0;
			p.returnTime = 0;
			p._transitionTime(0);
			if (p.options.momentum) {
				o = new WebKitCSSMatrix(window.getComputedStyle(p.scroller,
						null).webkitTransform);
				if (o.m41 != p.x || o.m42 != p.y) {
					p._unbind("webkitTransitionEnd");
					p._pos(o.m41, o.m42)
				}
			}
			p.scroller.style.webkitTransitionTimingFunction = "cubic-bezier(0.33,0.66,0.66,1)";
			if (p.hScrollbar) {
				p.hScrollbarIndicator.style.webkitTransitionTimingFunction = "cubic-bezier(0.33,0.66,0.66,1)"
			}
			if (p.vScrollbar) {
				p.vScrollbarIndicator.style.webkitTransitionTimingFunction = "cubic-bezier(0.33,0.66,0.66,1)"
			}
			p.startX = p.x;
			p.startY = p.y;
			p.pointX = m.pageX;
			p.pointY = m.pageY;
			p.startTime = q.timeStamp;
			if (p.options.onScrollStart) {
				p.options.onScrollStart.call(p)
			}
			p._bind(d);
			p._bind(f);
			p._bind(b)
		},
		_move : function(s) {
			if (h && s.touches.length > 1) {
				return
			}
			var q = this, o = h ? s.changedTouches[0] : s, p = o.pageX
					- q.pointX, m = o.pageY - q.pointY, t = q.x + p, r = q.y
					+ m;
			s.preventDefault();
			q.pointX = o.pageX;
			q.pointY = o.pageY;
			if (t > 0 || t < q.maxScrollX) {
				t = q.options.bounce ? q.x + (p / 2.4) : t >= 0
						|| q.maxScrollX >= 0 ? 0 : q.maxScrollX
			}
			if (r > 0 || r < q.maxScrollY) {
				r = q.options.bounce ? q.y + (m / 2.4) : r >= 0
						|| q.maxScrollY >= 0 ? 0 : q.maxScrollY
			}
			if (q.absDistX < 4 && q.absDistY < 4) {
				q.distX += p;
				q.distY += m;
				q.absDistX = c.abs(q.distX);
				q.absDistY = c.abs(q.distY);
				return
			}
			if (q.options.lockDirection) {
				if (q.absDistX > q.absDistY + 3) {
					r = q.y;
					m = 0
				} else {
					if (q.absDistY > q.absDistX + 3) {
						t = q.x;
						p = 0
					}
				}
			}
			q.moved = true;
			q._pos(t, r);
			q.dirX = p > 0 ? -1 : p < 0 ? 1 : 0;
			q.dirY = m > 0 ? -1 : m < 0 ? 1 : 0;
			if (s.timeStamp - q.startTime > 300) {
				q.startTime = s.timeStamp;
				q.startX = q.x;
				q.startY = q.y
			}
		},
		_end : function(t) {
			if (h && t.touches.length != 0) {
				return
			}
			var r = this, x = h ? t.changedTouches[0] : t, u, w, p = {
				dist : 0,
				time : 0
			}, m = {
				dist : 0,
				time : 0
			}, q = t.timeStamp - r.startTime, v = r.x, s = r.y, o;
			r._unbind(d);
			r._unbind(f);
			r._unbind(b);
			if (!r.moved) {
				if (h) {
					r.doubleTapTimer = null;
					u = x.target;
					while (u.nodeType != 1) {
						u = u.parentNode
					}
					w = document.createEvent("MouseEvents");
					w.initMouseEvent("click", true, true, t.view, 1, x.screenX,
							x.screenY, x.clientX, x.clientY, t.ctrlKey,
							t.altKey, t.shiftKey, t.metaKey, 0, null);
					w._fake = true;
					u.dispatchEvent(w)
				}
				r._resetPos();
				return
			}
			if (q < 300 && r.options.momentum) {
				p = v ? r._momentum(v - r.startX, q, -r.x, r.scrollerW
						- r.wrapperW + r.x, r.options.bounce ? r.wrapperW : 0)
						: p;
				m = s ? r
						._momentum(s - r.startY, q, -r.y,
								(r.maxScrollY < 0 ? r.scrollerH - r.wrapperH
										+ r.y : 0),
								r.options.bounce ? r.wrapperH : 0) : m;
				v = r.x + p.dist;
				s = r.y + m.dist;
				if ((r.x > 0 && v > 0)
						|| (r.x < r.maxScrollX && v < r.maxScrollX)) {
					p = {
						dist : 0,
						time : 0
					}
				}
				if ((r.y > 0 && s > 0)
						|| (r.y < r.maxScrollY && s < r.maxScrollY)) {
					m = {
						dist : 0,
						time : 0
					}
				}
			}
			if (p.dist || m.dist) {
				o = c.max(c.max(p.time, m.time), 10);
				r.scrollTo(v, s, o);
				return
			}
			r._resetPos(200)
		},
		_resetPos : function(p) {
			var m = this, q = m.x, o = m.y;
			if (m.x >= 0) {
				q = 0
			} else {
				if (m.x < m.maxScrollX) {
					q = m.maxScrollX
				}
			}
			if (m.y >= 0 || m.maxScrollY > 0) {
				o = 0
			} else {
				if (m.y < m.maxScrollY) {
					o = m.maxScrollY
				}
			}
			if (q == m.x && o == m.y) {
				if (m.moved) {
					if (m.options.onScrollEnd) {
						m.options.onScrollEnd.call(m)
					}
					m.moved = false
				}
				if (m.hScrollbar && m.options.hideScrollbar) {
					m.hScrollbarWrapper.style.webkitTransitionDelay = "300ms";
					m.hScrollbarWrapper.style.opacity = "0"
				}
				if (m.vScrollbar && m.options.hideScrollbar) {
					m.vScrollbarWrapper.style.webkitTransitionDelay = "300ms";
					m.vScrollbarWrapper.style.opacity = "0"
				}
				return
			}
			if (p) {
				m.scroller.style.webkitTransitionTimingFunction = "cubic-bezier(0.33,0.0,0.33,1)";
				if (m.hScrollbar) {
					m.hScrollbarIndicator.style.webkitTransitionTimingFunction = "cubic-bezier(0.33,0.0,0.33,1)"
				}
				if (m.vScrollbar) {
					m.vScrollbarIndicator.style.webkitTransitionTimingFunction = "cubic-bezier(0.33,0.0,0.33,1)"
				}
			}
			m.scrollTo(q, o, p || 0)
		},
		_transitionEnd : function(o) {
			var m = this;
			if (o) {
				o.stopPropagation()
			}
			m._unbind("webkitTransitionEnd");
			m._resetPos(m.returnTime);
			m.returnTime = 0
		},
		_momentum : function(v, p, t, m, x) {
			var s = this, u = 0.0006, q = c.abs(v) / p, o = (q * q) / (2 * u), w = 0, r = 0;
			if (v > 0 && o > t) {
				r = x / (6 / (o / q * u));
				t = t + r;
				s.returnTime = 800 / x * r + 100;
				q = q * t / o;
				o = t
			} else {
				if (v < 0 && o > m) {
					r = x / (6 / (o / q * u));
					m = m + r;
					s.returnTime = 800 / x * r + 100;
					q = q * m / o;
					o = m
				}
			}
			o = o * (v < 0 ? -1 : 1);
			w = q / u;
			return {
				dist : o,
				time : c.round(w)
			}
		},
		_offset : function(o, m) {
			var q = -o.offsetLeft, p = -o.offsetTop;
			if (!m) {
				return {
					x : q,
					y : p
				}
			}
			while (o = o.offsetParent) {
				q -= o.offsetLeft;
				p -= o.offsetTop
			}
			return {
				x : q,
				y : p
			}
		},
		_bind : function(o, m) {
			(m || this.scroller).addEventListener(o, this, false)
		},
		_unbind : function(o, m) {
			(m || this.scroller).removeEventListener(o, this, false)
		},
		destroy : function() {
			var m = this;
			m.hScrollbar = false;
			m.vScrollbar = false;
			m._scrollbar("h");
			m._scrollbar("v");
			m.scroller.style.webkitTransform = "";
			m._unbind("webkitTransitionEnd");
			m._unbind(j);
			m._unbind(e);
			m._unbind(d);
			m._unbind(f);
			m._unbind(b)
		},
		refresh : function() {
			var m = this;
			m.wrapperW = m.wrapper.clientWidth;
			m.wrapperH = m.wrapper.clientHeight;
			m.scrollerW = m.scroller.offsetWidth;
			m.scrollerH = m.scroller.offsetHeight;
			m.maxScrollX = m.wrapperW - m.scrollerW;
			m.maxScrollY = m.wrapperH - m.scrollerH;
			m.dirX = 0;
			m.dirY = 0;
			m._transitionTime(0);
			m.hScroll = m.options.hScroll && m.maxScrollX < 0;
			m.vScroll = m.options.vScroll
					&& (!m.options.bounceLock && !m.hScroll || m.scrollerH > m.wrapperH);
			m.hScrollbar = m.hScroll && m.options.hScrollbar;
			m.vScrollbar = m.vScroll && m.options.vScrollbar
					&& m.scrollerH > m.wrapperH;
			m._scrollbar("h");
			m._scrollbar("v");
			m._resetPos()
		},
		scrollTo : function(m, r, q, p) {
			var o = this;
			if (p) {
				m = o.x - m;
				r = o.y - r
			}
			q = !q
					|| (c.round(o.x) == c.round(m) && c.round(o.y) == c
							.round(r)) ? 0 : q;
			o.moved = true;
			if (q) {
				o._bind("webkitTransitionEnd")
			}
			o._transitionTime(q);
			o._pos(m, r);
			if (!q) {
				setTimeout(function() {
					o._transitionEnd()
				}, 0)
			}
		},
		scrollToElement : function(m, p) {
			var o = this, q;
			m = m.nodeType ? m : o.scroller.querySelector(m);
			if (!m) {
				return
			}
			q = o._offset(m);
			q.x = q.x > 0 ? 0 : q.x < o.maxScrollX ? o.maxScrollX : q.x;
			q.y = q.y > 0 ? 0 : q.y < o.maxScrollY ? o.maxScrollY : q.y;
			p = p === undefined ? c.max(c.abs(q.x) * 2, c.abs(q.y) * 2) : p;
			o.scrollTo(q.x, q.y, p)
		}
	};
	var i = "WebKitCSSMatrix" in window && "m11" in new WebKitCSSMatrix(), h = "ontouchstart" in window, l = (/iphone|ipad/gi)
			.test(navigator.appVersion), k = (/android/gi)
			.test(navigator.appVersion), j = "onorientationchange" in window ? "orientationchange"
			: "resize", e = h ? "touchstart" : "mousedown", d = h ? "touchmove"
			: "mousemove", f = h ? "touchend" : "mouseup", b = h ? "touchcancel"
			: "mouseup", a = "translate" + (i ? "3d(" : "("), g = i ? ",0)"
			: ")", c = Math;
	if (typeof exports !== "undefined") {
		exports.iScroll = n
	} else {
		window.iScroll = n
	}
})();