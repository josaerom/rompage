import { useEffect, useState } from "react";

const Header = ({ title, ariaTitle, didMount }) => {
  let [scrollY, setScrollY] = useState('');

  useEffect(() => {
    window.addEventListener('scroll', handleScroll);
    return () => {
      window.removeEventListener('scroll', handleScroll);
    }
  }, [])

  const handleScroll = () => {
    var scrollY = window.scrollY;
    if (scrollY > 200) {
      setScrollY('on')
    } else {
      setScrollY('')
    }
  }

  return (
    <section className={`top-banner ${didMount ? 'active' : ''} ${scrollY}`} >
      <div className="top-banner-bg">
        <div className="inner-wrap">
          <div className={"title-motion" + (didMount ? ' active' : '')} aria-hidden="true">
            {Array.from(title?.toUpperCase()).map((at, i) => <span key={at+i}>{at}</span>)}
          </div>
          <h1 className="sr-only">{ariaTitle}</h1>
        </div>
      </div>
    </section>
  )
}

export default Header;