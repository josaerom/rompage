import { useState, useEffect } from "react";

const Top = () => {
    const [buttonVislble, setButtonVislble] = useState(false);
    useEffect(() => {
        window.addEventListener('scroll', handleScroll);
        return () => {
            window.removeEventListener('scroll', handleScroll);
        }
    })

    const handleScroll = () => {
        document.documentElement.scrollTop > 400 ? setButtonVislble(true) : setButtonVislble(false)
    }
    const handleGoToTop = () => {
        window.scrollTo({
            top : 0,
            behavior : 'smooth',
        });
        setButtonVislble(false);
    }
    
    return (
        <div className={"scroll-wrap" + (buttonVislble ? ' active' : '')}>
            <div className="top-btn"><button type="button" aria-label="제일 위로 이동" onClick={handleGoToTop}>TOP</button></div>
        </div>
    )
}

export default Top;