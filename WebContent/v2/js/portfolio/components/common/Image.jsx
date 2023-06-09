import { useRef, useState, useEffect } from "react"
import { LOAD_IMG_EVENT_TYPE, onIntersection } from "../../../common/utils.js";

let observer = null;
const Image = ({ src, alt, ariaHidden }) => {
  const imgRef = useRef();
  const [isLoad, setIsLoad] = useState(false);

  useEffect(() => {
    const imgEl = imgRef.current;
    function loadImage() {
      setIsLoad(true)
    }

    imgEl && imgEl.addEventListener(LOAD_IMG_EVENT_TYPE, loadImage);
    
    return () => {
      imgEl && imgEl.removeEventListener(LOAD_IMG_EVENT_TYPE, loadImage);
      setIsLoad(true)
    };
  }, []);

  useEffect(() => {
    if (!observer) {
      observer = new IntersectionObserver(onIntersection);
    }
    imgRef.current && observer.observe(imgRef.current);
  }, []);

  return (
    <img
      ref={imgRef}
      src={isLoad ? src : ''}
      alt={alt}
      area-hidden={ariaHidden ? 'true' : 'false'}
      className="test"
    />
  )
}
export default Image;


