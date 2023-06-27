/******/ (function() { // webpackBootstrap
/******/ 	"use strict";
/******/ 	var __webpack_modules__ = ({

/***/ "./WebContent/v2/js/common/utils.js":
/*!******************************************!*\
  !*** ./WebContent/v2/js/common/utils.js ***!
  \******************************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   LOAD_IMG_EVENT_TYPE: function() { return /* binding */ LOAD_IMG_EVENT_TYPE; },
/* harmony export */   ariaExpanded: function() { return /* binding */ ariaExpanded; },
/* harmony export */   lazyload: function() { return /* binding */ lazyload; },
/* harmony export */   onIntersection: function() { return /* binding */ onIntersection; },
/* harmony export */   pictureLazyload: function() { return /* binding */ pictureLazyload; },
/* harmony export */   scrollEvt: function() { return /* binding */ scrollEvt; }
/* harmony export */ });
var observer = null;
function lazyload(imgEl) {
  function loadImage() {
    imgEl.src = imgEl.dataset.src;
  }
  imgEl && imgEl.addEventListener(LOAD_IMG_EVENT_TYPE, loadImage);
  if (!observer) {
    observer = new IntersectionObserver(onIntersection);
  }
  imgEl && observer.observe(imgEl);
}
function pictureLazyload(imgEl) {
  function loadImage() {
    imgEl.srcset = imgEl.dataset.srcset;
    imgEl.nextElementSibling.srcset = imgEl.dataset.srcset;
  }
  imgEl && imgEl.addEventListener(LOAD_IMG_EVENT_TYPE, loadImage);
  if (!observer) {
    observer = new IntersectionObserver(onIntersection);
  }
  imgEl && observer.observe(imgEl);
}
var LOAD_IMG_EVENT_TYPE = "loadImage";
function onIntersection(entries, io) {
  entries.forEach(function (entry) {
    if (entry.isIntersecting) {
      io.unobserve(entry.target);
      entry.target.dispatchEvent(new CustomEvent(LOAD_IMG_EVENT_TYPE));
    }
  });
}
document.querySelectorAll('img.lazyload').forEach(function (entry) {
  lazyload(entry);
});
/*document.querySelectorAll('picture.lazyload').forEach((entry)=>{
  pictureLazyload(entry);
})*/

function ariaExpanded(target) {
  var expandVal = target.getAttribute('aria-expanded');
  if (expandVal == 'true') {
    target.setAttribute('aria-expanded', false);
  } else {
    target.setAttribute('aria-expanded', true);
  }
}
function scrollEvt() {
  var handleScroll = function handleScroll() {
    var scrollY = window.scrollY;
    if (scrollY > 500) {
      document.querySelector('.scroll-wrap').classList.add('active');
    } else {
      document.querySelector('.scroll-wrap').classList.remove('active');
    }
  };
  document.querySelector('.scroll-wrap .top-btn button').addEventListener('click', function () {
    window.scrollTo({
      top: 0,
      behavior: 'smooth'
    });
  });
  window.addEventListener('scroll', handleScroll);
}

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	/* webpack/runtime/define property getters */
/******/ 	!function() {
/******/ 		// define getter functions for harmony exports
/******/ 		__webpack_require__.d = function(exports, definition) {
/******/ 			for(var key in definition) {
/******/ 				if(__webpack_require__.o(definition, key) && !__webpack_require__.o(exports, key)) {
/******/ 					Object.defineProperty(exports, key, { enumerable: true, get: definition[key] });
/******/ 				}
/******/ 			}
/******/ 		};
/******/ 	}();
/******/ 	
/******/ 	/* webpack/runtime/hasOwnProperty shorthand */
/******/ 	!function() {
/******/ 		__webpack_require__.o = function(obj, prop) { return Object.prototype.hasOwnProperty.call(obj, prop); }
/******/ 	}();
/******/ 	
/******/ 	/* webpack/runtime/make namespace object */
/******/ 	!function() {
/******/ 		// define __esModule on exports
/******/ 		__webpack_require__.r = function(exports) {
/******/ 			if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 				Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 			}
/******/ 			Object.defineProperty(exports, '__esModule', { value: true });
/******/ 		};
/******/ 	}();
/******/ 	
/************************************************************************/
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be isolated against other modules in the chunk.
!function() {
/*!***********************************************!*\
  !*** ./WebContent/v2/js/common/navigation.js ***!
  \***********************************************/
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _utils_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./utils.js */ "./WebContent/v2/js/common/utils.js");

var eventMenuFocus = function eventMenuFocus(_ref) {
  var type = _ref.type,
    currentTarget = _ref.currentTarget,
    shiftKey = _ref.shiftKey;
  if (shiftKey || type == 'mouseleave') {
    document.querySelector('header').classList.remove('on');
    currentTarget.classList.remove('on');
  } else {
    document.querySelector('header').classList.add('on');
    currentTarget.classList.add('on');
  }
};
/* PC */
document.querySelectorAll('.gnb .nav.pc > .nav-list').forEach(function (element) {
  element.addEventListener('mouseover', eventMenuFocus, false);
  element.addEventListener('focusin', eventMenuFocus, false);
  element.addEventListener('focus', eventMenuFocus, false);
  element.addEventListener('keydown', eventMenuFocus, false);
  element.addEventListener('mouseleave', eventMenuFocus, false);
});

/*  PC focusout */
document.querySelectorAll('.gnb .nav.pc > .nav-list .nav-2depth-list .nav-last').forEach(function (element) {
  element.addEventListener('focusout', function (_ref2) {
    var currentTarget = _ref2.currentTarget;
    document.querySelector('header').classList.remove('on');
    currentTarget.closest('.nav-list').classList.remove('on');
  });
});

/* MOBILE/TABLET */
document.getElementById('hamburger').addEventListener('click', function (_ref3) {
  var currentTarget = _ref3.currentTarget;
  currentTarget.classList.toggle('on');
  document.querySelector('header').classList.toggle('on');
  document.getElementById('allMenu').classList.toggle('on');
  (0,_utils_js__WEBPACK_IMPORTED_MODULE_0__.ariaExpanded)(currentTarget);
});
document.querySelectorAll('.nav-2depth-btn').forEach(function (entry, idx) {
  entry.addEventListener('click', function (_ref4) {
    var currentTarget = _ref4.currentTarget;
    currentTarget.classList.toggle('on');
    currentTarget.parentElement.querySelector('.nav-2depth-on').classList.toggle('on');
    if (document.querySelectorAll('.nav-2depth-btn').length - 1 == idx) {
      currentTarget.classList.toggle('nav-last');
    }
    (0,_utils_js__WEBPACK_IMPORTED_MODULE_0__.ariaExpanded)(currentTarget);
  });
});
function menuFocusout() {
  document.querySelector('header').classList.remove('on');
  document.querySelector('.header-on').classList.remove('on');
  document.getElementById('hamburger').classList.remove('on');
}
document.getElementById('content').addEventListener('focusin', menuFocusout);
document.getElementById('content').addEventListener('click', menuFocusout);
(0,_utils_js__WEBPACK_IMPORTED_MODULE_0__.scrollEvt)();
}();
/******/ })()
;
//# sourceMappingURL=data:application/json;charset=utf-8;base64,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Q1UsYUFBYSxDQUFDLFFBQVEsQ0FBQyxDQUFDQyxTQUFTLENBQUNFLE1BQU0sQ0FBQyxJQUFJLENBQUM7RUFDdkRiLFFBQVEsQ0FBQ1UsYUFBYSxDQUFDLFlBQVksQ0FBQyxDQUFDQyxTQUFTLENBQUNFLE1BQU0sQ0FBQyxJQUFJLENBQUM7RUFDM0RiLFFBQVEsQ0FBQ3lCLGNBQWMsQ0FBQyxXQUFXLENBQUMsQ0FBQ2QsU0FBUyxDQUFDRSxNQUFNLENBQUMsSUFBSSxDQUFDO0FBQzVEO0FBRUFiLFFBQVEsQ0FBQ3lCLGNBQWMsQ0FBQyxTQUFTLENBQUMsQ0FBQzFDLGdCQUFnQixDQUFDLFNBQVMsRUFBRWlELFlBQVksQ0FBQztBQUM1RWhDLFFBQVEsQ0FBQ3lCLGNBQWMsQ0FBQyxTQUFTLENBQUMsQ0FBQzFDLGdCQUFnQixDQUFDLE9BQU8sRUFBRWlELFlBQVksQ0FBQztBQUUxRTFCLG9EQUFTLENBQUMsQ0FBQyxDIiwic291cmNlcyI6WyJ3ZWJwYWNrOi8vcm9tcGFnZS8uL1dlYkNvbnRlbnQvdjIvanMvY29tbW9uL3V0aWxzLmpzIiwid2VicGFjazovL3JvbXBhZ2Uvd2VicGFjay9ib290c3RyYXAiLCJ3ZWJwYWNrOi8vcm9tcGFnZS93ZWJwYWNrL3J1bnRpbWUvZGVmaW5lIHByb3BlcnR5IGdldHRlcnMiLCJ3ZWJwYWNrOi8vcm9tcGFnZS93ZWJwYWNrL3J1bnRpbWUvaGFzT3duUHJvcGVydHkgc2hvcnRoYW5kIiwid2VicGFjazovL3JvbXBhZ2Uvd2VicGFjay9ydW50aW1lL21ha2UgbmFtZXNwYWNlIG9iamVjdCIsIndlYnBhY2s6Ly9yb21wYWdlLy4vV2ViQ29udGVudC92Mi9qcy9jb21tb24vbmF2aWdhdGlvbi5qcyJdLCJzb3VyY2VzQ29udGVudCI6WyJsZXQgb2JzZXJ2ZXIgPSBudWxsO1xyXG5cclxuZXhwb3J0IGZ1bmN0aW9uIGxhenlsb2FkKGltZ0VsKSB7XHJcbiAgZnVuY3Rpb24gbG9hZEltYWdlKCkge1xyXG4gICAgaW1nRWwuc3JjID0gaW1nRWwuZGF0YXNldC5zcmM7XHJcbiAgfVxyXG4gIGltZ0VsICYmIGltZ0VsLmFkZEV2ZW50TGlzdGVuZXIoTE9BRF9JTUdfRVZFTlRfVFlQRSwgbG9hZEltYWdlKTtcclxuXHJcbiAgaWYgKCFvYnNlcnZlcikge1xyXG4gICAgb2JzZXJ2ZXIgPSBuZXcgSW50ZXJzZWN0aW9uT2JzZXJ2ZXIob25JbnRlcnNlY3Rpb24pO1xyXG4gIH1cclxuICBpbWdFbCAmJiBvYnNlcnZlci5vYnNlcnZlKGltZ0VsKTtcclxufVxyXG5cclxuZXhwb3J0IGZ1bmN0aW9uIHBpY3R1cmVMYXp5bG9hZChpbWdFbCkge1xyXG4gIGZ1bmN0aW9uIGxvYWRJbWFnZSgpIHtcclxuXHRpbWdFbC5zcmNzZXQgPSBpbWdFbC5kYXRhc2V0LnNyY3NldDtcclxuICAgIGltZ0VsLm5leHRFbGVtZW50U2libGluZy5zcmNzZXQgPSBpbWdFbC5kYXRhc2V0LnNyY3NldDtcclxuXHJcbiAgfVxyXG4gIGltZ0VsICYmIGltZ0VsLmFkZEV2ZW50TGlzdGVuZXIoTE9BRF9JTUdfRVZFTlRfVFlQRSwgbG9hZEltYWdlKTtcclxuXHJcbiAgaWYgKCFvYnNlcnZlcikge1xyXG4gICAgb2JzZXJ2ZXIgPSBuZXcgSW50ZXJzZWN0aW9uT2JzZXJ2ZXIob25JbnRlcnNlY3Rpb24pO1xyXG4gIH1cclxuICBpbWdFbCAmJiBvYnNlcnZlci5vYnNlcnZlKGltZ0VsKTtcclxufVxyXG5cclxuZXhwb3J0IGNvbnN0IExPQURfSU1HX0VWRU5UX1RZUEUgPSBcImxvYWRJbWFnZVwiO1xyXG5cclxuZXhwb3J0IGZ1bmN0aW9uIG9uSW50ZXJzZWN0aW9uKGVudHJpZXMsIGlvKSB7XHJcbiAgZW50cmllcy5mb3JFYWNoKGVudHJ5ID0+IHtcclxuICAgIGlmIChlbnRyeS5pc0ludGVyc2VjdGluZykge1xyXG4gICAgICBpby51bm9ic2VydmUoZW50cnkudGFyZ2V0KTtcclxuICAgICAgZW50cnkudGFyZ2V0LmRpc3BhdGNoRXZlbnQobmV3IEN1c3RvbUV2ZW50KExPQURfSU1HX0VWRU5UX1RZUEUpKTtcclxuICAgIH1cclxuICB9KTtcclxufVxyXG5cclxuZG9jdW1lbnQucXVlcnlTZWxlY3RvckFsbCgnaW1nLmxhenlsb2FkJykuZm9yRWFjaCgoZW50cnkpPT57XHJcbiAgbGF6eWxvYWQoZW50cnkpO1xyXG59KVxyXG4vKmRvY3VtZW50LnF1ZXJ5U2VsZWN0b3JBbGwoJ3BpY3R1cmUubGF6eWxvYWQnKS5mb3JFYWNoKChlbnRyeSk9PntcclxuICBwaWN0dXJlTGF6eWxvYWQoZW50cnkpO1xyXG59KSovXHJcblxyXG5cclxuZXhwb3J0IGZ1bmN0aW9uIGFyaWFFeHBhbmRlZCh0YXJnZXQpIHtcclxuXHRsZXQgZXhwYW5kVmFsID0gdGFyZ2V0LmdldEF0dHJpYnV0ZSgnYXJpYS1leHBhbmRlZCcpO1xyXG5cdGlmKGV4cGFuZFZhbCA9PSAndHJ1ZScpe1xyXG5cdFx0dGFyZ2V0LnNldEF0dHJpYnV0ZSgnYXJpYS1leHBhbmRlZCcsIGZhbHNlKTtcclxuXHR9ZWxzZXtcclxuXHRcdHRhcmdldC5zZXRBdHRyaWJ1dGUoJ2FyaWEtZXhwYW5kZWQnLCB0cnVlKTtcdFx0XHJcblx0fVxyXG59XHJcblxyXG5leHBvcnQgZnVuY3Rpb24gc2Nyb2xsRXZ0KCl7XHJcblx0Y29uc3QgaGFuZGxlU2Nyb2xsID0gKCkgPT4ge1xyXG5cdCAgICB2YXIgc2Nyb2xsWSA9IHdpbmRvdy5zY3JvbGxZO1xyXG5cdCAgICBpZiAoc2Nyb2xsWSA+IDUwMCkge1xyXG5cdCAgICAgIGRvY3VtZW50LnF1ZXJ5U2VsZWN0b3IoJy5zY3JvbGwtd3JhcCcpLmNsYXNzTGlzdC5hZGQoJ2FjdGl2ZScpXHJcblx0ICAgIH0gZWxzZSB7XHJcblx0ICAgICAgZG9jdW1lbnQucXVlcnlTZWxlY3RvcignLnNjcm9sbC13cmFwJykuY2xhc3NMaXN0LnJlbW92ZSgnYWN0aXZlJylcclxuXHQgICAgfVxyXG5cdCAgfVxyXG5cdCAgXHJcblx0ZG9jdW1lbnQucXVlcnlTZWxlY3RvcignLnNjcm9sbC13cmFwIC50b3AtYnRuIGJ1dHRvbicpLmFkZEV2ZW50TGlzdGVuZXIoJ2NsaWNrJywgKCkgPT4ge1xyXG5cdFx0d2luZG93LnNjcm9sbFRvKHt0b3A6MCwgYmVoYXZpb3IgOiAnc21vb3RoJ30pXHJcblx0fSlcclxuXHR3aW5kb3cuYWRkRXZlbnRMaXN0ZW5lcignc2Nyb2xsJywgaGFuZGxlU2Nyb2xsKTtcclxufVxyXG4iLCIvLyBUaGUgbW9kdWxlIGNhY2hlXG52YXIgX193ZWJwYWNrX21vZHVsZV9jYWNoZV9fID0ge307XG5cbi8vIFRoZSByZXF1aXJlIGZ1bmN0aW9uXG5mdW5jdGlvbiBfX3dlYnBhY2tfcmVxdWlyZV9fKG1vZHVsZUlkKSB7XG5cdC8vIENoZWNrIGlmIG1vZHVsZSBpcyBpbiBjYWNoZVxuXHR2YXIgY2FjaGVkTW9kdWxlID0gX193ZWJwYWNrX21vZHVsZV9jYWNoZV9fW21vZHVsZUlkXTtcblx0aWYgKGNhY2hlZE1vZHVsZSAhPT0gdW5kZWZpbmVkKSB7XG5cdFx0cmV0dXJuIGNhY2hlZE1vZHVsZS5leHBvcnRzO1xuXHR9XG5cdC8vIENyZWF0ZSBhIG5ldyBtb2R1bGUgKGFuZCBwdXQgaXQgaW50byB0aGUgY2FjaGUpXG5cdHZhciBtb2R1bGUgPSBfX3dlYnBhY2tfbW9kdWxlX2NhY2hlX19bbW9kdWxlSWRdID0ge1xuXHRcdC8vIG5vIG1vZHVsZS5pZCBuZWVkZWRcblx0XHQvLyBubyBtb2R1bGUubG9hZGVkIG5lZWRlZFxuXHRcdGV4cG9ydHM6IHt9XG5cdH07XG5cblx0Ly8gRXhlY3V0ZSB0aGUgbW9kdWxlIGZ1bmN0aW9uXG5cdF9fd2VicGFja19tb2R1bGVzX19bbW9kdWxlSWRdKG1vZHVsZSwgbW9kdWxlLmV4cG9ydHMsIF9fd2VicGFja19yZXF1aXJlX18pO1xuXG5cdC8vIFJldHVybiB0aGUgZXhwb3J0cyBvZiB0aGUgbW9kdWxlXG5cdHJldHVybiBtb2R1bGUuZXhwb3J0cztcbn1cblxuIiwiLy8gZGVmaW5lIGdldHRlciBmdW5jdGlvbnMgZm9yIGhhcm1vbnkgZXhwb3J0c1xuX193ZWJwYWNrX3JlcXVpcmVfXy5kID0gZnVuY3Rpb24oZXhwb3J0cywgZGVmaW5pdGlvbikge1xuXHRmb3IodmFyIGtleSBpbiBkZWZpbml0aW9uKSB7XG5cdFx0aWYoX193ZWJwYWNrX3JlcXVpcmVfXy5vKGRlZmluaXRpb24sIGtleSkgJiYgIV9fd2VicGFja19yZXF1aXJlX18ubyhleHBvcnRzLCBrZXkpKSB7XG5cdFx0XHRPYmplY3QuZGVmaW5lUHJvcGVydHkoZXhwb3J0cywga2V5LCB7IGVudW1lcmFibGU6IHRydWUsIGdldDogZGVmaW5pdGlvbltrZXldIH0pO1xuXHRcdH1cblx0fVxufTsiLCJfX3dlYnBhY2tfcmVxdWlyZV9fLm8gPSBmdW5jdGlvbihvYmosIHByb3ApIHsgcmV0dXJuIE9iamVjdC5wcm90b3R5cGUuaGFzT3duUHJvcGVydHkuY2FsbChvYmosIHByb3ApOyB9IiwiLy8gZGVmaW5lIF9fZXNNb2R1bGUgb24gZXhwb3J0c1xuX193ZWJwYWNrX3JlcXVpcmVfXy5yID0gZnVuY3Rpb24oZXhwb3J0cykge1xuXHRpZih0eXBlb2YgU3ltYm9sICE9PSAndW5kZWZpbmVkJyAmJiBTeW1ib2wudG9TdHJpbmdUYWcpIHtcblx0XHRPYmplY3QuZGVmaW5lUHJvcGVydHkoZXhwb3J0cywgU3ltYm9sLnRvU3RyaW5nVGFnLCB7IHZhbHVlOiAnTW9kdWxlJyB9KTtcblx0fVxuXHRPYmplY3QuZGVmaW5lUHJvcGVydHkoZXhwb3J0cywgJ19fZXNNb2R1bGUnLCB7IHZhbHVlOiB0cnVlIH0pO1xufTsiLCJpbXBvcnQge2FyaWFFeHBhbmRlZCwgc2Nyb2xsRXZ0fSBmcm9tICcuL3V0aWxzLmpzJ1xyXG5cclxuXHJcbmNvbnN0IGV2ZW50TWVudUZvY3VzID0gKHsgdHlwZSwgY3VycmVudFRhcmdldCwgc2hpZnRLZXkgfSkgPT4ge1xyXG5cdGlmIChzaGlmdEtleSB8fCB0eXBlID09ICdtb3VzZWxlYXZlJykge1xyXG5cdFx0ZG9jdW1lbnQucXVlcnlTZWxlY3RvcignaGVhZGVyJykuY2xhc3NMaXN0LnJlbW92ZSgnb24nKTtcclxuXHRcdGN1cnJlbnRUYXJnZXQuY2xhc3NMaXN0LnJlbW92ZSgnb24nKTtcclxuXHR9IGVsc2Uge1xyXG5cdFx0ZG9jdW1lbnQucXVlcnlTZWxlY3RvcignaGVhZGVyJykuY2xhc3NMaXN0LmFkZCgnb24nKTtcclxuXHRcdGN1cnJlbnRUYXJnZXQuY2xhc3NMaXN0LmFkZCgnb24nKTtcclxuXHR9XHJcbn1cclxuLyogUEMgKi9cclxuZG9jdW1lbnQucXVlcnlTZWxlY3RvckFsbCgnLmduYiAubmF2LnBjID4gLm5hdi1saXN0JykuZm9yRWFjaCgoZWxlbWVudCkgPT4ge1xyXG5cdGVsZW1lbnQuYWRkRXZlbnRMaXN0ZW5lcignbW91c2VvdmVyJywgZXZlbnRNZW51Rm9jdXMsIGZhbHNlKTtcclxuXHRlbGVtZW50LmFkZEV2ZW50TGlzdGVuZXIoJ2ZvY3VzaW4nLCBldmVudE1lbnVGb2N1cywgZmFsc2UpO1xyXG5cdGVsZW1lbnQuYWRkRXZlbnRMaXN0ZW5lcignZm9jdXMnLCBldmVudE1lbnVGb2N1cywgZmFsc2UpO1xyXG5cdGVsZW1lbnQuYWRkRXZlbnRMaXN0ZW5lcigna2V5ZG93bicsIGV2ZW50TWVudUZvY3VzLCBmYWxzZSk7XHJcblx0ZWxlbWVudC5hZGRFdmVudExpc3RlbmVyKCdtb3VzZWxlYXZlJywgZXZlbnRNZW51Rm9jdXMsIGZhbHNlKTtcclxufSk7XHJcblxyXG4vKiAgUEMgZm9jdXNvdXQgKi9cclxuZG9jdW1lbnQucXVlcnlTZWxlY3RvckFsbCgnLmduYiAubmF2LnBjID4gLm5hdi1saXN0IC5uYXYtMmRlcHRoLWxpc3QgLm5hdi1sYXN0JykuZm9yRWFjaCgoZWxlbWVudCkgPT4ge1xyXG5cdGVsZW1lbnQuYWRkRXZlbnRMaXN0ZW5lcignZm9jdXNvdXQnLCh7Y3VycmVudFRhcmdldH0pPT57XHJcblx0XHRkb2N1bWVudC5xdWVyeVNlbGVjdG9yKCdoZWFkZXInKS5jbGFzc0xpc3QucmVtb3ZlKCdvbicpO1xyXG5cdFx0Y3VycmVudFRhcmdldC5jbG9zZXN0KCcubmF2LWxpc3QnKS5jbGFzc0xpc3QucmVtb3ZlKCdvbicpO1xyXG5cdH0pO1xyXG59KTtcclxuXHJcbi8qIE1PQklMRS9UQUJMRVQgKi9cdFxyXG5kb2N1bWVudC5nZXRFbGVtZW50QnlJZCgnaGFtYnVyZ2VyJykuYWRkRXZlbnRMaXN0ZW5lcignY2xpY2snLCAoeyBjdXJyZW50VGFyZ2V0IH0pID0+IHtcclxuXHRjdXJyZW50VGFyZ2V0LmNsYXNzTGlzdC50b2dnbGUoJ29uJyk7XHJcblx0ZG9jdW1lbnQucXVlcnlTZWxlY3RvcignaGVhZGVyJykuY2xhc3NMaXN0LnRvZ2dsZSgnb24nKTtcclxuXHRkb2N1bWVudC5nZXRFbGVtZW50QnlJZCgnYWxsTWVudScpLmNsYXNzTGlzdC50b2dnbGUoJ29uJyk7XHJcblx0YXJpYUV4cGFuZGVkKGN1cnJlbnRUYXJnZXQpO1xyXG59KVxyXG5cclxuZG9jdW1lbnQucXVlcnlTZWxlY3RvckFsbCgnLm5hdi0yZGVwdGgtYnRuJykuZm9yRWFjaCgoZW50cnksIGlkeCkgPT4ge1xyXG5cdGVudHJ5LmFkZEV2ZW50TGlzdGVuZXIoJ2NsaWNrJywgZnVuY3Rpb24gKHsgY3VycmVudFRhcmdldCB9KSB7XHJcblx0XHRjdXJyZW50VGFyZ2V0LmNsYXNzTGlzdC50b2dnbGUoJ29uJyk7XHJcblx0XHRjdXJyZW50VGFyZ2V0LnBhcmVudEVsZW1lbnQucXVlcnlTZWxlY3RvcignLm5hdi0yZGVwdGgtb24nKS5jbGFzc0xpc3QudG9nZ2xlKCdvbicpO1xyXG5cdFx0aWYgKGRvY3VtZW50LnF1ZXJ5U2VsZWN0b3JBbGwoJy5uYXYtMmRlcHRoLWJ0bicpLmxlbmd0aCAtIDEgPT0gaWR4KSB7XHJcblx0XHRcdGN1cnJlbnRUYXJnZXQuY2xhc3NMaXN0LnRvZ2dsZSgnbmF2LWxhc3QnKTtcclxuXHRcdH1cclxuXHRcdGFyaWFFeHBhbmRlZChjdXJyZW50VGFyZ2V0KTtcclxuXHR9KVxyXG59KVxyXG5cclxuZnVuY3Rpb24gbWVudUZvY3Vzb3V0KCkge1xyXG5cdGRvY3VtZW50LnF1ZXJ5U2VsZWN0b3IoJ2hlYWRlcicpLmNsYXNzTGlzdC5yZW1vdmUoJ29uJyk7XHJcblx0ZG9jdW1lbnQucXVlcnlTZWxlY3RvcignLmhlYWRlci1vbicpLmNsYXNzTGlzdC5yZW1vdmUoJ29uJyk7XHJcblx0ZG9jdW1lbnQuZ2V0RWxlbWVudEJ5SWQoJ2hhbWJ1cmdlcicpLmNsYXNzTGlzdC5yZW1vdmUoJ29uJyk7XHJcbn1cclxuXHJcbmRvY3VtZW50LmdldEVsZW1lbnRCeUlkKCdjb250ZW50JykuYWRkRXZlbnRMaXN0ZW5lcignZm9jdXNpbicsIG1lbnVGb2N1c291dCk7XHJcbmRvY3VtZW50LmdldEVsZW1lbnRCeUlkKCdjb250ZW50JykuYWRkRXZlbnRMaXN0ZW5lcignY2xpY2snLCBtZW51Rm9jdXNvdXQpO1xyXG5cclxuc2Nyb2xsRXZ0KCk7XHJcblxyXG4iXSwibmFtZXMiOlsib2JzZXJ2ZXIiLCJsYXp5bG9hZCIsImltZ0VsIiwibG9hZEltYWdlIiwic3JjIiwiZGF0YXNldCIsImFkZEV2ZW50TGlzdGVuZXIiLCJMT0FEX0lNR19FVkVOVF9UWVBFIiwiSW50ZXJzZWN0aW9uT2JzZXJ2ZXIiLCJvbkludGVyc2VjdGlvbiIsIm9ic2VydmUiLCJwaWN0dXJlTGF6eWxvYWQiLCJzcmNzZXQiLCJuZXh0RWxlbWVudFNpYmxpbmciLCJlbnRyaWVzIiwiaW8iLCJmb3JFYWNoIiwiZW50cnkiLCJpc0ludGVyc2VjdGluZyIsInVub2JzZXJ2ZSIsInRhcmdldCIsImRpc3BhdGNoRXZlbnQiLCJDdXN0b21FdmVudCIsImRvY3VtZW50IiwicXVlcnlTZWxlY3RvckFsbCIsImFyaWFFeHBhbmRlZCIsImV4cGFuZFZhbCIsImdldEF0dHJpYnV0ZSIsInNldEF0dHJpYnV0ZSIsInNjcm9sbEV2dCIsImhhbmRsZVNjcm9sbCIsInNjcm9sbFkiLCJ3aW5kb3ciLCJxdWVyeVNlbGVjdG9yIiwiY2xhc3NMaXN0IiwiYWRkIiwicmVtb3ZlIiwic2Nyb2xsVG8iLCJ0b3AiLCJiZWhhdmlvciIsImV2ZW50TWVudUZvY3VzIiwiX3JlZiIsInR5cGUiLCJjdXJyZW50VGFyZ2V0Iiwic2hpZnRLZXkiLCJlbGVtZW50IiwiX3JlZjIiLCJjbG9zZXN0IiwiZ2V0RWxlbWVudEJ5SWQiLCJfcmVmMyIsInRvZ2dsZSIsImlkeCIsIl9yZWY0IiwicGFyZW50RWxlbWVudCIsImxlbmd0aCIsIm1lbnVGb2N1c291dCJdLCJzb3VyY2VSb290IjoiIn0=