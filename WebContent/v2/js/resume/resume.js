let quickWrapTop = document.querySelector('.quick-wrap').offsetTop;
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
  return [...document.querySelector('.quick-list').children].indexOf(target)
}

[...document.querySelectorAll('.collapse-btn')].forEach((btn) => {
  btn.addEventListener('click', (e) => {
    findSibling(e.target, 'section').classList.toggle('collapse');
  })
});

document.querySelector('.quick-collapse-btn').addEventListener('click', function () {
  document.querySelector('.quick-wrap').classList.toggle('collapse');
  document.querySelector('.quick-list').style.transform = `translateY(0)`;
})

document.querySelectorAll('.quick-list .quick-item button').forEach((entry) => {
  entry.addEventListener('click', function () {
    let top = document.getElementById(`${entry.dataset.link}`).offsetTop - 45;
    window.scrollTo({ top: top, behavior: 'smooth' });
    document.querySelector('.quick-wrap').classList.add('collapse');

  });
})

window.addEventListener('scroll', () => {
  if (window.scrollY >= quickWrapTop) document.querySelector('.quick-wrap').classList.add('on')
  else if (window.scrollY < quickWrapTop) document.querySelector('.quick-wrap').classList.remove('on')

  for (let target of anchorTarget) {
    if (window.scrollY < quickWrapTop) {
      removeOn(document.querySelector('button[data-link="section07"').parentElement)
    } else if (target.offsetHeight + target.offsetTop >= window.scrollY) {
      let targetPannel = findSibling(target, 'title');
      let targetTab = document.querySelector(`button[data-link="${targetPannel.id}"`);
      removeOn(targetTab.parentElement);
      targetTab.classList.add('on');
      let idx = Number(indexOfItem(targetTab.parentElement)) * 43;
      if (window.innerWidth < 767) document.querySelector('.quick-list').style.transform = `translateY(-${idx}px)`;
      return;
    }
  }
});

const observer = new ResizeObserver(entries => {
  for (let entry of entries) {
    const { width } = entry.contentRect;
    if (window.innerWidth >= 767) {
      document.querySelector('.quick-list').style.transform = `translateY(0)`;
    }
  }
})

observer.observe(document.querySelector('.quick-list'), { box: 'content-box' });