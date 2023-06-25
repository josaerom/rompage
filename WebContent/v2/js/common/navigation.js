const eventMenuFocus = ({ type, currentTarget, shiftKey }) => {
	if (shiftKey || type == 'mouseleave') {
		document.querySelector('header').classList.remove('on');
		currentTarget.classList.remove('on');
	} else {
		document.querySelector('header').classList.add('on');
		currentTarget.classList.add('on');
	}
}
/* PC */
document.querySelectorAll('.gnb .nav.pc > .nav-list').forEach((element) => {
	element.addEventListener('mouseover', eventMenuFocus, false);
	element.addEventListener('focusin', eventMenuFocus, false);
	element.addEventListener('focus', eventMenuFocus, false);
	element.addEventListener('keydown', eventMenuFocus, false);
	element.addEventListener('mouseleave', eventMenuFocus, false);
});

/*  PC focusout */
document.querySelectorAll('.gnb .nav.pc > .nav-list .nav-2depth-list .nav-last').forEach((element) => {
	element.addEventListener('focusout',({currentTarget})=>{
		document.querySelector('header').classList.remove('on');
		currentTarget.closest('.nav-list').classList.remove('on');
	});
});

/* MOBILE/TABLET */	
document.getElementById('hamburger').addEventListener('click', ({ currentTarget }) => {
	currentTarget.classList.toggle('on');
	document.querySelector('header').classList.toggle('on');
	document.getElementById('allMenu').classList.toggle('on');
})

document.querySelectorAll('.nav-2depth-btn').forEach((entry, idx) => {
	entry.addEventListener('click', function ({ currentTarget }) {
		currentTarget.classList.toggle('on');
		currentTarget.parentElement.querySelector('.nav-2depth-on').classList.toggle('on');
		if (document.querySelectorAll('.nav-2depth-btn').length - 1 == idx) {
			currentTarget.classList.toggle('nav-last');
		}
	})
})

function menuFocusout() {
	document.querySelector('header').classList.remove('on');
	document.querySelector('.header-on').classList.remove('on');
	document.getElementById('hamburger').classList.remove('on');
}
document.getElementById('content').addEventListener('focusin', menuFocusout);
document.getElementById('content').addEventListener('click', menuFocusout);