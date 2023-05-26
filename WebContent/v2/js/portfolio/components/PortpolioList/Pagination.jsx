import { useSelector } from "react-redux";

const Pagination = () => {

  let { currentPage } = useSelector((state) => state);

  const postsPrePage = 6;
  const indexOfLast = currentPage * postsPrePage;
	const indexOfFirst = indexOfLast - postsPrePage;	
  console.log('currentPage >>>> ' + currentPage)
  console.log('indexOfFirst >>>> ' + indexOfFirst)
  console.log('indexOfLast >>>> ' + indexOfLast)

  return (
    <>페이지네이션</>
  )
}

export default Pagination;