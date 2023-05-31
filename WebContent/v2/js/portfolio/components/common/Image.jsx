import { useEffect } from "react";
import { useState } from "react";
import { useRef } from "react"

const Image = ({ src, alt, ariaHidden }) => {
  const imgRef = useRef();
  const [isLoad, setIsLoad] = useState(false);

  useEffect(() => {
    function loadImage() {
      setIsLoad(true);
    }

    const imgEl = imgRef.current;
    imgEl && imgEl.addEventListener(LOAD_IMG_EVENT_TYPE, loadImage);
    return () => {
      imgEl && imgEl.removeEventListener(LOAD_IMG_EVENT_TYPE, loadImage);
    };
  }, []);

  useEffect(() => {
    if (!observer && "IntersectionObserver" in window) {
      observer = new IntersectionObserver(onIntersection, {
        // 확인을 위해 이미지 절반이 나타날 때 로딩한다.
        threshold: 0.5
      });
      imgRef.current && observer.observe(imgRef.current);
    } else if(!"IntersectionObserver" in window) {
      loadImage()
    }
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

let observer = null;
const LOAD_IMG_EVENT_TYPE = "loadImage";

function onIntersection(entries, io) {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      io.unobserve(entry.target);
      entry.target.dispatchEvent(new CustomEvent(LOAD_IMG_EVENT_TYPE));
    }
  });
}
