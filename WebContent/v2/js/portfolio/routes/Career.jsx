import { useEffect, useState } from "react";
import Header from "../components/common/Header.jsx"

const Career = () => {
  let [didMount, setDidMount] = useState(false);

  useEffect(() => {
    setDidMount(true);
    return () => {
      setDidMount(false);
    }
  }, [])

  return (
    <>
      <Header title="career" ariaTitle="경력 기술서" didMount={didMount} />
    </>
  )
}
export default Career;
