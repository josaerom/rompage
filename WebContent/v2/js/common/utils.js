let observer = null;

export function lazyload(imgEl) {
  function loadImage() {
    imgEl.src = imgEl.dataset.src;
  }
  imgEl && imgEl.addEventListener(LOAD_IMG_EVENT_TYPE, loadImage);

  if (!observer) {
    observer = new IntersectionObserver(onIntersection);
  }
  imgEl && observer.observe(imgEl);
}

export function pictureLazyload(imgEl) {
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

export const LOAD_IMG_EVENT_TYPE = "loadImage";

export function onIntersection(entries, io) {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      io.unobserve(entry.target);
      entry.target.dispatchEvent(new CustomEvent(LOAD_IMG_EVENT_TYPE));
    }
  });
}

document.querySelectorAll('img.lazyload').forEach((entry)=>{
  lazyload(entry);
})
/*document.querySelectorAll('picture.lazyload').forEach((entry)=>{
  pictureLazyload(entry);
})*/


export function ariaExpanded(target) {
	let expandVal = target.getAttribute('aria-expanded');
	if(expandVal == 'true'){
		target.setAttribute('aria-expanded', false);
	}else{
		target.setAttribute('aria-expanded', true);		
	}
}

export function scrollEvt(){
	const handleScroll = () => {
	    var scrollY = window.scrollY;
	    if (scrollY > 500) {
	      document.querySelector('.scroll-wrap').classList.add('active')
	    } else {
	      document.querySelector('.scroll-wrap').classList.remove('active')
	    }
	  }
	  
	document.querySelector('.scroll-wrap .top-btn button').addEventListener('click', () => {
		window.scrollTo({top:0, behavior : 'smooth'})
	})
	window.addEventListener('scroll', handleScroll);
}
