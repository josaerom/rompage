/**
 * keen-slider 5.5.0
 * The HTML touch slider carousel with the most native feeling you will get.
 * https://keen-slider.io
 * Copyright 2020-2021 Eric Beyer <contact@ericbeyer.de>
 * License: MIT
 * Released on: 2021-06-07
 */
	


!function(t, e) {
    "object" == typeof exports && "undefined" != typeof module ? module.exports = e() : "function" == typeof define && define.amd ? define(e) : (t = "undefined" != typeof globalThis ? globalThis : t || self).KeenSlider = e(jQuery)
}(this, (function($) {
    "use strict";
    function t(t, e, n) {
        return e in t ? Object.defineProperty(t, e, {
            value: n,
            enumerable: !0,
            configurable: !0,
            writable: !0
        }) : t[e] = n,
        t
    }
    function e(t, e) {
        var n = Object.keys(t);
        if (Object.getOwnPropertySymbols) {
            var r = Object.getOwnPropertySymbols(t);
            e && (r = r.filter((function(e) {
                return Object.getOwnPropertyDescriptor(t, e).enumerable
            }
            ))),
            n.push.apply(n, r)
        }
        return n
    }
    function n(n) {
        for (var r = 1; r < arguments.length; r++) {
            var i = null != arguments[r] ? arguments[r] : {};
            r % 2 ? e(Object(i), !0).forEach((function(e) {
                t(n, e, i[e])
            }
            )) : Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(i)) : e(Object(i)).forEach((function(t) {
                Object.defineProperty(n, t, Object.getOwnPropertyDescriptor(i, t))
            }
            ))
        }
        return n
    }
    function r(t) {
        return function(t) {
            if (Array.isArray(t))
                return i(t)
        }(t) || function(t) {
            if ("undefined" != typeof Symbol && Symbol.iterator in Object(t))
                return Array.from(t)
        }(t) || function(t, e) {
            if (!t)
                return;
            if ("string" == typeof t)
                return i(t, e);
            var n = Object.prototype.toString.call(t).slice(8, -1);
            "Object" === n && t.constructor && (n = t.constructor.name);
            if ("Map" === n || "Set" === n)
                return Array.from(t);
            if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n))
                return i(t, e)
        }(t) || function() {
            throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
        }()
    }
    function i(t, e) {
        (null == e || e > t.length) && (e = t.length);
        for (var n = 0, r = new Array(e); n < e; n++)
            r[n] = t[n];
        return r
    }
    function o(t) {
        return Array.prototype.slice.call(t)
    }
    function a(t) {
        var e = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : document;
        return "function" == typeof t ? o(t()) : "string" == typeof t ? o(e.querySelectorAll(t)) : t instanceof HTMLElement != !1 ? [t] : t instanceof NodeList != !1 ? t : []
    }
    function u(t, e, n) {
        return Math.min(Math.max(t, e), n)
    }
    return Math.sign || (Math.sign = function(t) {
        return (t > 0) - (t < 0) || +t
    }
    ),
    function(t) {
        var e, i, o, c, f, s, l, d, h, v, p, m, b, g, w, y, M, O, S, j, A, x, k, P, E, T, D, C, L, V, X, Y, z, H, I = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, q = "data-keen-slider-moves", F = "data-keen-slider-v", W = [], _ = null, K = !1, N = !1, R = 0, U = [];
        function $(t, e, n) {
            var r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : {};
            t.addEventListener(e, n, r),
            W.push([t, e, n, r])
        }
        function B(t) {
            if (O && S === Z(t) && ft()) {
                var n = et(t).x;
                if (!rt(t) && P)
                    return J(t);
                P && (Kt(),
                j = n,
                P = !1),
                t.cancelable && t.preventDefault();
                var r = j - n;
                E += Math.abs(r),
                !T && E > 5 && (T = !0,
                e.setAttribute(q, !0)),
                Yt(k(r, Gt) * (lt() ? -1 : 1), t.timeStamp),
                j = n
            }
        }
        function G(t) {
            O || !ft() || nt(t.target) || (O = !0,
            P = !0,
            S = Z(t),
            T = !1,
            E = 0,
            rt(t),
            pt(),
            M = v,
            j = et(t).x,
            Yt(0, t.timeStamp),
            ut("dragStart"))
        }
        function J(t) {
            O && S === Z(t, !0) && ft() && (e.removeAttribute(q),
            O = !1,
            gt(),
            ut("dragEnd"))
        }
        function Q(t) {
            return t.changedTouches
        }
        function Z(t) {
            var e = arguments.length > 1 && void 0 !== arguments[1] && arguments[1]
              , n = e ? Q(t) : tt(t);
            return n ? n[0] ? n[0].identifier : "error" : "default"
        }
        function tt(t) {
            return t.targetTouches
        }
        function et(t) {
            var e = tt(t);
            return {
                x: ht() ? e ? e[0].screenY : t.pageY : e ? e[0].screenX : t.pageX,
                timestamp: t.timeStamp
            }
        }
        function nt(t) {
            return t.hasAttribute(y.preventEvent)
        }
        function rt(t) {
            var e = tt(t);
            if (!e)
                return !0;
            var n = e[0]
              , r = ht() ? n.clientY : n.clientX
              , i = ht() ? n.clientX : n.clientY
              , o = void 0 !== A && void 0 !== x && Math.abs(x - i) <= Math.abs(A - r);
            return A = r,
            x = i,
            o
        }
        function it(t) {
            ft() && O && t.preventDefault()
        }
        function ot() {
            $(window, "orientationchange", Dt),
            $(window, "resize", (function() {
                return Tt()
            }
            )),
            $(e, "dragstart", (function(t) {
                ft() && t.preventDefault()
            }
            )),
            $(e, "mousedown", G),
            $(y.cancelOnLeave ? e : window, "mousemove", B),
            y.cancelOnLeave && $(e, "mouseleave", J),
            $(window, "mouseup", J),
            $(e, "touchstart", G, {
                passive: !0
            }),
            $(e, "touchmove", B, {
                passive: !1
            }),
            $(e, "touchend", J, {
                passive: !0
            }),
            $(e, "touchcancel", J, {
                passive: !0
            }),
            $(window, "wheel", it, {
                passive: !1
            })
        }
        function at() {
            W.forEach((function(t) {
                t[0].removeEventListener(t[1], t[2], t[3])
            }
            )),
            W = []
        }
        function ut(t) {
            y[t] && y[t](Gt)
        }
        function ct() {
            return y.centered
        }
        function ft() {
            return void 0 !== i ? i : y.controls
        }
        function st() {
            return y.loop && o > 1
        }
        function lt() {
            return y.rtl
        }
        function dt() {
            return !y.loop && y.rubberband
        }
        function ht() {
            return !!y.vertical
        }
        function vt() {
            D = window.requestAnimationFrame(mt)
        }
        function pt() {
            D && (window.cancelAnimationFrame(D),
            D = null),
            C = null
        }
        function mt(t) {
            C || (C = t);
            var e = t - C
              , n = bt(e);
            if (e >= V)
                return Yt(L - Y, !1),
                H ? H() : void ut("afterChange");
            var r = zt(n);
            if (0 === r || st() || dt() || z) {
                if (0 !== r && dt() && !z)
                    return St();
                Y += n,
                Yt(n, !1),
                vt()
            } else
                Yt(n - r, !1)
        }
        function bt(t) {
            return L * X(t / V) - Y
        }
        function gt() {
            switch (ut("beforeChange"),
            y.mode) {
            case "free":
                Mt();
                break;
            case "free-snap":
                Ot();
                break;
            case "snap":
            default:
                wt()
            }
        }
        function wt() {
            yt((1 === l && 0 !== p ? M : v) + Math.sign(p))
        }
        function yt(t, e) {
            var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : y.duration
              , r = arguments.length > 3 && void 0 !== arguments[3] && arguments[3]
              , i = arguments.length > 4 && void 0 !== arguments[4] && arguments[4]
              , o = function(t) {
                return 1 + --t * t * t * t * t
            };
            jt(Ft(t = qt(t, r, i)), n, o, e)
        }
        function Mt() {
            if (0 === b)
                return !(!zt(0) || st()) && yt(v);
            var t = y.friction / Math.pow(Math.abs(b), -.5);
            jt(Math.pow(b, 2) / t * Math.sign(b), 6 * Math.abs(b / t), (function(t) {
                return 1 - Math.pow(1 - t, 5)
            }
            ))
        }
        function Ot() {
            if (0 === b)
                return yt(v);
            var t = y.friction / Math.pow(Math.abs(b), -.5)
              , e = Math.pow(b, 2) / t * Math.sign(b)
              , n = 6 * Math.abs(b / t)
              , r = (R + e) / (s / l);
            jt((-1 === p ? Math.floor(r) : Math.ceil(r)) * (s / l) - R, n, (function(t) {
                return 1 - Math.pow(1 - t, 5)
            }
            ))
        }
        function St() {
            if (pt(),
            0 === b)
                return yt(v, !0);
            var t = .04 / Math.pow(Math.abs(b), -.5)
              , e = Math.pow(b, 2) / t * Math.sign(b)
              , n = function(t) {
                return --t * t * t + 1
            }
              , r = b;
            jt(e, 3 * Math.abs(r / t), n, !0, (function() {
                jt(Ft(qt(v)), 500, n, !0)
            }
            ))
        }
        function jt(t, e, n, r, i) {
            pt(),
            L = t,
            Y = 0,
            V = e,
            X = n,
            z = r,
            H = i,
            C = null,
            vt()
        }
        function At(n) {
            var r = a(t);
            r.length && (e = r[0],
            Tt(n),
            ot(),
            ut("mounted"))
        }
        function xt() {
            var t, e = I.breakpoints || [];
            for (var r in e)
                window.matchMedia(r).matches && (t = r);
            if (t === _)
                return !0;
            var i = (_ = t) ? e[_] : I;
            i.breakpoints && _ && delete i.breakpoints,
            y = n(n(n({}, Bt), I), i),
            K = !0,
            h = null,
            ut("optionsChanged"),
            Et()
        }
        function kt(t) {
            if ("function" == typeof t)
                return t();
            var e = y.autoAdjustSlidesPerView;
            e || (o = Math.max(t, o));
            var n = st() && e ? o - 1 : o;
            return u(t, 1, Math.max(n, 1))
        }
        function Pt() {
            xt(),
            N = !0,
            ut("created")
        }
        function Et(t, e) {
            t && (I = t),
            e && (_ = null),
            Ct(),
            At(e)
        }
        function Tt(t) {
            var n = window.innerWidth;
            if (xt() && (n !== h || t)) {
                h = n;
                var r = y.slides;
                "number" == typeof r ? (f = null,
                o = r) : (f = a(r, e),
                o = f ? f.length : 0);
                var i = y.dragSpeed;
                k = "function" == typeof i ? i : function(t) {
                    return t * i
                }
                ,
                s = ht() ? e.offsetHeight : e.offsetWidth,
                l = kt(y.slidesPerView),
                d = u(y.spacing, 0, s / (l - 1) - 1),
                s += d,
                c = ct() ? (s / 2 - s / l / 2) / s : 0,
                Vt();
                var p = !N || K && y.resetSlide ? y.initial : v;
                $t(st() ? p : Ht(p)),
                ht() && e.setAttribute(F, !0),
                K = !1
            }
        }
        function Dt(t) {
            Tt(),
            setTimeout(Tt, 500),
            setTimeout(Tt, 2e3)
        }
        function Ct() {
            at(),
            Xt(),
            e && e.hasAttribute(F) && e.removeAttribute(F),
            ut("destroyed")
        }
        function Lt() {
            f && f.forEach((function(t, e) {
            	var n = g[e].distance * s - (lt() ? -e : e) * (s / l - d / l - d / l * (l - 1))
                  , r = ht() ? 0 : n
                  , i = ht() ? n : 0
                  , o = "translate3d(".concat(r, "px, ").concat(i, "px, 0)");
                t.style.transform = o,
                t.style["-webkit-transform"] = o
            }
            ))
        }
        function Vt() {
            f && f.forEach((function(t) {
                var e = "calc(".concat(100 / l, "% - ").concat(d / l * (l - 1), "px)");
                ht() ? (t.style["min-height"] = e,
                t.style["max-height"] = e) : (t.style["min-width"] = e,
                t.style["max-width"] = e)
            }
            ))
        }
        function Xt() {
            if (f) {
                var t = ["transform", "-webkit-transform"];
                t = [].concat(r(t), ht ? ["min-height", "max-height"] : ["min-width", "max-width"]),
                f.forEach((function(e) {
                    t.forEach((function(t) {
                        e.style.removeProperty(t)
                    }
                    ))
                }
                ))
            }
        }
        function Yt(t) {
            var e = !(arguments.length > 1 && void 0 !== arguments[1]) || arguments[1]
              , n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : Date.now();
            _t(t, n),
            e && (t = Rt(t)),
            R += t,
            Nt()
        }
        function zt(t) {
            var e = s * (o - 1 * (ct() ? 1 : l)) / l
              , n = R + t;
            return n > e ? n - e : n < 0 ? n : 0
        }
        function Ht(t) {
            return u(t, 0, o - 1 - (ct() ? 0 : l - 1))
        }
        function It() {
            var t = Math.abs(w)
              , e = R < 0 ? 1 - t : t;
            return {
                direction: p,
                progressTrack: e,
                progressSlides: e * o / (o - 1),
                positions: g,
                position: R,
                speed: b,
                relativeSlide: (v % o + o) % o,
                absoluteSlide: v,
                size: o,
                slidesPerView: l,
                widthOrHeight: s
            }
        }
        function qt(t) {
            var e = arguments.length > 1 && void 0 !== arguments[1] && arguments[1]
              , n = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
            return st() ? e ? Wt(t, n) : t : Ht(t)
        }
        function Ft(t) {
            return -(-s / l * t + R)
        }
        function Wt(t, e) {
            var n = (v % o + o) % o
              , r = n < (t = (t % o + o) % o) ? -n - o + t : -(n - t)
              , i = n > t ? o - n + t : t - n
              , a = e ? Math.abs(r) <= i ? r : i : t < n ? r : i;
            return v + a
        }
        function _t(t, e) {
            clearTimeout(m);
            var n = Math.sign(t);
            if (n !== p && Kt(),
            p = n,
            U.push({
                distance: t,
                time: e
            }),
            m = setTimeout((function() {
                U = [],
                b = 0
            }
            ), 50),
            (U = U.slice(-6)).length <= 1 || 0 === p)
                return b = 0;
            var r = U.slice(0, -1).reduce((function(t, e) {
                return t + e.distance
            }
            ), 0)
              , i = U[U.length - 1].time
              , o = U[0].time;
            b = u(r / (i - o), -10, 10)
        }
        function Kt() {
            U = []
        }
        function Nt() {
            w = st() ? R % (s * o / l) / (s * o / l) : R / (s * o / l),
            Ut();
            for (var t = [], e = 0; e < o; e++) {
                var n = (1 / o * e - (w < 0 && st() ? w + 1 : w)) * o / l + c;
                st() && (n += n > (o - 1) / l ? -o / l : n < -o / l + 1 ? o / l : 0);
                var r = 1 / l
                  , i = n + r
                  , a = i < r ? i / r : i > 1 ? 1 - (i - 1) * l / 1 : 1;
                t.push({
                    portion: a < 0 || a > 1 ? 0 : a,
                    distance: lt() ? -1 * n + 1 - r : n
                })
            }
            g = t,
            Lt(),
            ut("move")
        }
        function Rt(t) {
            if (st())
                return t;
            var e = zt(t);
            if (!dt())
                return t - e;
            if (0 === e)
                return t;
            var n;
            return t * (n = e / s,
            (1 - Math.abs(n)) * (1 - Math.abs(n)))
        }
        function Ut() {
            var t = Math.round(R / (s / l));
            t !== v && (!st() && (t < 0 || t > o - 1) || (v = t,
            ut("slideChanged")))
        }
        function $t(t) {
            ut("beforeChange"),
            Yt(Ft(t), !1),
            ut("afterChange")
        }
        
        var interval = 0;
		var nextTab = true;
        var Bt = {
            autoAdjustSlidesPerView: !0,
            centered: !1,
            breakpoints: null,
            controls: !0,
            dragSpeed: 1,
            friction: .0025,
            loop: !1,
            initial: 0,
            duration: 500,
            preventEvent: "data-keen-slider-pe",
            slides: ".keen-slider__slide",
            vertical: !1,
            resetSlide: !1,
            slidesPerView: 1,
            spacing: 0,
            mode: "snap",
            rtl: (document.querySelector('html').getAttribute('dir') == 'rtl') ? !0 : !1,
            rubberband: !0,
            cancelOnLeave: !0,
            autoplaySpeed : 3000,
            prevArrow: '<button class="slick-prev" aria-label="Previous" type="button"><span class="visually-hidden">Previous</span></button>',
			nextArrow: '<button class="slick-next" aria-label="Next" type="button"><span class="visually-hidden">Next</span></button>',
        }
          , Gt = {
            controls: function(t) {
                i = t
            },
            destroy: Ct,
            refresh: function(t) {
                Et(t, !0)
            },
            next: function() {
                yt(v + 1, !0)
            },
            prev: function() {
                yt(v - 1, !0)
            },
            moveToSlide: function(t, e) {
                yt(t, !0, e)
            },
            moveToSlideRelative: function(t) {
                var e = arguments.length > 1 && void 0 !== arguments[1] && arguments[1]
                  , n = arguments.length > 2 ? arguments[2] : void 0;
                yt(t, !0, n, !0, e)
            },
            resize: function() {
                Tt(!0)
            },
            details: function() {
                return It()
            },
            options: function() {
                var t = n({}, y);
                return delete t.breakpoints,
                t
            },
            settings : function(_this, instance){
            	if (window.NodeList && !NodeList.prototype.forEach) {
            		NodeList.prototype.forEach = Array.prototype.forEach;
            	}
            	
            	var keenSliderWrap = _this.querySelector('.keen-slider-wrap');
            	keenSliderWrap.classList.add('active');
            	keenSliderWrap.classList.add('slick-initialized');
            	keenSliderWrap.classList.add('slick-slider');
            	keenSliderWrap.setAttribute('aria-live', 'polite');
            	            	
            	/* arrow */
            	if(instance.options().arrows){
        			keenSliderBuildArrows(_this, instance.options());
        			_this.querySelector(".slick-prev").addEventListener("click", function () {
						clearInterval(interval);
						instance.prev();
						!(_this.querySelector(".slide-pause").className.indexOf('play') > -1) && instance.autoplay(true, instance);
					});
					_this.querySelector(".slick-next").addEventListener("click", function () {
						clearInterval(interval);
						instance.next();
						!(_this.querySelector(".slide-pause").className.indexOf('play') > -1) && instance.autoplay(true, instance);
					});
            	}
				/*// arrow*/
				
				
            	if(instance.options().dots){
            		
            		/* dot */
            		var dots_wrapper = _this.querySelector(".keen-slider-dot-wrap");
            		if(!!instance.options().appendDots){
            			dots_wrapper = instance.options().appendDots;
            		}
					var slides = _this.querySelectorAll(".keen-slider__slide");
					var dots_ul = document.createElement('ul');
					var totalCnt  = instance.details().size;
					
					dots_ul.classList.add('slick-dots');
					
					slides.forEach(function (t, idx) {
						/* slide */
						_this.querySelector('.keen-slider').setAttribute('role', 'listbox');
						
						t.classList.remove('hide');
						t.setAttribute('id', _this.querySelector('.keen-slider').getAttribute('id')+'-'+idx)
						t.setAttribute('data-slick-index', idx);
						t.setAttribute('role', 'option');
						t.setAttribute('aria-hidden', false);
						t.setAttribute('aria-describedby', _this.querySelector('.keen-slider').getAttribute('id')+'Tab-'+idx);
						/*// slide */
						
						var dots_li = document.createElement('li');		      
						var dot = document.createElement("button");
						dots_ul.setAttribute('role','tablist');
						dots_ul.appendChild(dots_li);
						dots_li.appendChild(dot);
						dots_li.setAttribute('role','presentation');
						dot.classList.add("dot")
						dot.type = 'button';
						
						dot.setAttribute('id',_this.querySelector('.keen-slider').getAttribute('id')+'Tab-'+idx);
						
						dot.setAttribute('role','tab');
						dot.setAttribute('aria-controls',_this.querySelector('.keen-slider').getAttribute('id')+'-'+idx);
						var dotsText = idx + 1 +' of '+ totalCnt;
						if(keenSliderWrap.dataset.waMsg != undefined){
							dotsText = keenSliderWrap.dataset.waMsg.replace('\#1', (idx + 1) + ' of '+ totalCnt);
						}
						dot.textContent = dotsText;
						dots_wrapper.appendChild(dots_ul)
						dot.addEventListener("click", function () {
							instance.moveToSlide(idx)
						})
					});
					/*// dot */
					
					/* play/pause button */
					if(_this.querySelector('.slide-pause') != null){
						_this.querySelector('.slide-pause').classList.add('active');
						_this.querySelector('.slide-pause').addEventListener('click', function(e){
							e.preventDefault();
							if (this.classList.contains('pause')) {
								this.classList.remove('pause');
								this.classList.add('play');
								this.innerText  = this.dataset.titlePlay;
								instance.autoplay(false, instance);
							} else {
								this.classList.remove('play');
								this.classList.add('pause');
								this.innerText = this.dataset.titleStop;
								instance.autoplay(true, instance);
							}
						});		
					}
							
					/*// play/pause button */
            	}else{
					var slides = _this.querySelectorAll(".keen-slider__slide");
					
					slides.forEach(function (t, idx) {
						t.classList.remove('hide');
						t.setAttribute('id', _this.querySelector('.keen-slider').getAttribute('id')+'-'+idx)
					});
            	}
            	
            	if(instance.options().autoplay){
            		instance.autoplay(true, instance);
            	}
            	
				instance.updateClasses(_this, instance);								
            },
            updateClasses : function(_this, instance){
            	if (window.NodeList && !NodeList.prototype.forEach) {
            		NodeList.prototype.forEach = Array.prototype.forEach;
            	}
            	
            	var slide = instance.details().relativeSlide;            	
            	/* arrow */
            	if(instance.options().arrows && !instance.options().loop){
            		var arrowLeft = _this.querySelector(".slick-prev");
    				var arrowRight = _this.querySelector(".slick-next");
    				if(!!_this.querySelector(".slick-prev")){
    					slide === 0 ? arrowLeft.classList.add("slick-disabled") : arrowLeft.classList.remove("slick-disabled");
        				slide === instance.details().size - 1 ? arrowRight.classList.add("slick-disabled") : arrowRight.classList.remove("slick-disabled");
    				}    				
            	}				
				/*// arrow */
				
				/* slide */
				var slideContents = _this.querySelectorAll('.carousel-box');
				slideContents.forEach(function(slider, idx){
					if(idx === slide ){
						slider.setAttribute('tabindex', '0');						
						slider.classList.add('slick-current');
						slider.setAttribute('aria-hidden', false);
						slider.querySelectorAll('a, button').forEach(function(btn, idx){
							btn.setAttribute('tabindex', 0);
						});
					}else{
						slider.setAttribute('tabindex', '-1');
						slider.classList.remove('slick-current');
						slider.setAttribute('aria-hidden', true);
						slider.querySelectorAll('a, button').forEach(function(btn, idx){
							btn.setAttribute('tabindex', -1);
						});
					}
				});
				/*// slide */
				
				/* dot */
				if(instance.options().dots){
					var dots = _this.querySelectorAll(".dot");
					dots.forEach(function (dot, idx) {
						if(idx === slide){
							dot.parentElement.classList.add("slick-active")
							dot.setAttribute('aria-selected', true);
						} else{
							dot.parentElement.classList.remove("slick-active")
							dot.setAttribute('aria-selected', false);
						}
					});
				}
				/*// dot */
            }, 
            autoplay : function(run, instance, _this) {            	
				clearInterval(interval);
				interval = setInterval(function(){					
					if (run && instance) {
						if(!instance.options().loop){
							if(instance.details().relativeSlide == (instance.details().size -1)){
								nextTab = false;
							}else if(instance.details().relativeSlide == 0){
								nextTab = true;
							}
						}						
						nextTab ? instance.next() : instance.prev();
					}
				}, instance.options().autoplaySpeed)
			}
        };
        return Pt(),
        Gt
        
        
    }
}
));


function keenSliderBuildArrows(_this,options){
	var sliderWrap = $(_this).find('.keen-slider-wrap');
	sliderWrap.prepend(options.prevArrow).append(options.nextArrow);
	sliderWrap.find('.slick-next').addClass('slick-arrow');
	sliderWrap.find('.slick-prev').addClass('slick-arrow');
}
/* LGEITF-520 End */