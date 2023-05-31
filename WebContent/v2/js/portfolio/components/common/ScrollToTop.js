import { useEffect } from 'react';
import { useSelector } from 'react-redux';
import {useLocation} from 'react-router-dom';

export default function ScrollToTop(){
  const {pathname} = useLocation();
  let {currentPage } = useSelector((state)=>state.paginationStore);

  useEffect(()=>{
    window.scrollTo(0, 0);
  }, [pathname, currentPage])

  return null;
}