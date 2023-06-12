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