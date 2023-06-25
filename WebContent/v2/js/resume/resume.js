let dq_quickWrap = document.querySelector('.quick-wrap');
let dq_quickList = document.querySelector('.quick-list');
let quickWrapTop = dq_quickWrap.offsetTop;
let anchorTarget = document.querySelectorAll('[id*=tabpanel]');

function removeOn(target) {
  [...target.parentElement.children].forEach((sibling) => {
    sibling != target && sibling.firstElementChild.classList.remove('on')
  })
};

function findSibling(target, className) {
  let sibling = [...target.parentElement.children].find((sibling) => {
    return sibling.classList.contains(className)
  })
  return sibling;
};

function indexOfItem(target) {
  return [...dq_quickList.children].indexOf(target)
}

document.querySelectorAll('.collapse-btn').forEach((btn) => {
  btn.addEventListener('click', (e) => {
    findSibling(e.target, 'section').classList.toggle('collapse');
  })
});

document.querySelector('.quick-collapse-btn').addEventListener('click', function () {
  dq_quickWrap.classList.toggle('collapse');
  dq_quickList.style.transform = `translateY(0)`;
})

document.querySelectorAll('.quick-list .quick-item button').forEach((entry) => {
  entry.addEventListener('click', function () {
    let top = document.getElementById(`${entry.dataset.link}`).offsetTop - 45;
    window.scrollTo({ top: top, behavior: 'smooth' });
    dq_quickWrap.classList.add('collapse');

  });
})

window.addEventListener('scroll', () => {
  if (window.scrollY >= quickWrapTop) dq_quickWrap.classList.add('on')
  else if (window.scrollY < quickWrapTop) dq_quickWrap.classList.remove('on')

  for (let target of anchorTarget) {
    if (window.scrollY < quickWrapTop) {
      removeOn(document.querySelector('button[data-link="section07"').parentElement);
      dq_quickWrap.classList.add('collapse');
    } else if (target.offsetHeight + target.offsetTop >= window.scrollY) {
      let targetPannel = findSibling(target, 'title');
      let targetTab = document.querySelector(`button[data-link="${targetPannel.id}"`);
      removeOn(targetTab.parentElement);
      targetTab.classList.add('on');
      let idx = Number(indexOfItem(targetTab.parentElement)) * 43;
      if (window.innerWidth < 767 && dq_quickWrap.classList.contains('collapse')) dq_quickList.style.transform = `translateY(-${idx}px)`;
      return;
    }
  }
});

document.querySelector('.all-collapse').addEventListener('click', function({target}){
    target.classList.toggle('collapse');
    document.querySelectorAll('.section').forEach((section)=>{    
    if(target.classList.contains('collapse')) section.classList.add('collapse')
        else if(!target.classList.contains('collapse')) section.classList.remove('collapse')
})
})

const observer = new ResizeObserver(entries => {
  for (let entry of entries) {
    const { width } = entry.contentRect;
    if (window.innerWidth >= 767) {
      dq_quickList.style.transform = `translateY(0)`;
    }
  }
})

observer.observe(dq_quickList, { box: 'content-box' });