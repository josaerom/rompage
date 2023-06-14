let quickWrapTop = document.querySelector('.quick-wrap').offsetTop;
let anchorTarget = document.querySelectorAll('[id*=tabpanel]');
let removeOn = (target) => [...target.parentElement.children].forEach((sibling) => { 
  sibling != target && sibling.classList.remove('on') 
});

window.addEventListener('scroll', () => {
  if (window.scrollY >= quickWrapTop) { document.querySelector('.quick-wrap').classList.add('on') }
  else if (window.scrollY < quickWrapTop) { console.log('aaa'); document.querySelector('.quick-wrap').classList.remove('on') }

  for (let target of anchorTarget) {
    if (window.scrollY < quickWrapTop) {
      removeOn(document.querySelector('a[href="#section07"'))
    } else if (target.offsetHeight + target.offsetTop >= window.scrollY) {
      let id = target.previousElementSibling.id; console.log(id);
      removeOn(document.querySelector('a[href="#' + id + '"'))
      document.querySelector('a[href="#' + id + '"').classList.add('on')
      return;
    }
  }
});