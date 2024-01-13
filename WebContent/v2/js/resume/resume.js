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

document.addEventListener('DOMContentLoaded', () => {
	document.querySelector('.top-banner').classList.add('active');	
})


class Title extends HTMLElement {
  connectedCallback(){	  
	  /*HTML : 
	  <div class="inner-wrap">
        <div class="title-motion" aria-hidden="true">
          <span>R</span><span>E</span><span>S</span><span>U</span><span>M</span><span>E</span>
        </div>
        <h1 class="sr-only">이력서</h1>
      </div>*/
	  
	  let innerWrap = this.makeDom();
	  let style = this.style();
	  
	  this.attachShadow({mode : 'open'});
	  this.shadowRoot.innerHTML = style;
	  this.shadowRoot.appendChild(innerWrap);
	  
	  this.didMount();
  }
  makeDom(){
	  let attrTitle = this.getAttribute('title');
	  let attrTitleEn = this.getAttribute('title-en');
	  
	  let innerWrap = document.createElement('div');
	  innerWrap.classList.add('inner-wrap');
	  
	  let titleMotion = document.createElement('div');
	  titleMotion.classList.add('title-motion');	  
	  titleMotion.setAttribute('aria-hidden', true);
	  
	  let srOnly = document.createElement('h1');
	  srOnly.classList.add('sr-only');
	  srOnly.innerHTML = attrTitle;
	  
	  [...attrTitleEn].forEach((at)=>{
		  let span = document.createElement('span');
		  span.innerHTML = at;
		  titleMotion.appendChild(span);
	  })
	  
	  innerWrap.appendChild(titleMotion);
	  innerWrap.appendChild(srOnly);
	  
	  return innerWrap;
  }
  didMount(){
	  setTimeout(()=>{
		  this.shadowRoot.querySelector('.title-motion').classList.add('active');
	  }, 300)
  }
  style(){
	  return `<style>
	   .inner-wrap {
		    position: relative;
		    width: 95%;
		    height: 100%;
		    margin: 0 auto;
		    display: table;
		    z-index: 10
		}
		
		 .inner-wrap .title-motion {
		    font-size: 50px;
		    display: table-cell;
		    vertical-align: middle;
		    color: #fff;
		    font-family: "Montserrat","AppleGothic","sans-serif","Helvetica";
		    font-weight: 300;
		    text-align: center
		}
		
		 .inner-wrap .title-motion span {
		    display: inline-block;
		    opacity: 0
		}
		
		 .inner-wrap .title-motion span:nth-child(1n) {
		    transform: translateY(30px);
		    transition: all 1.4s .1s
		}
		
		 .inner-wrap .title-motion span:nth-child(2n) {
		    transform: translateY(-10px);
		    transition: all 1.4s .2s
		}
		
		 .inner-wrap .title-motion span:nth-child(3n) {
		    transform: translateY(20px);
		    transition: all 1.4s .3s
		}
		
		 .inner-wrap .title-motion span:nth-child(4n) {
		    transform: translateY(10px);
		    transition: all 1.4s .4s
		}
		
		 .inner-wrap .title-motion span:nth-child(5n) {
		    transform: translateY(-20px);
		    transition: all 1.4s .5s
		}
		
		 .inner-wrap .title-motion span:nth-child(6n) {
		    transform: translateY(-10px);
		    transition: all 1.6s .6s
		}
		
		 .inner-wrap .title-motion.active span {
		    opacity: 1;
		    transform: translateY(0px)
		}
	  </style>`;
  }
}

customElements.define('custom-title', Title);
