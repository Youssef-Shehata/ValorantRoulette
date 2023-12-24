import React, { useState, useEffect } from 'react';
// const jett = process.env.PUBLIC_URL + '/icons/jett.jpeg'
// const raze = process.env.PUBLIC_URL + '/icons/raze.jpeg'
// const portal = process.env.PUBLIC_URL + '/icons/portal.jpeg'
// const yoru = process.env.PUBLIC_URL + '/icons/yoru.jpeg'
// const reyna = process.env.PUBLIC_URL + '/icons/Reyna.jpeg'
// const kj = process.env.PUBLIC_URL + '/icons/kj.jpeg'



function App() {
  const [optionMenu, setOptionMenu] = useState(true)


  const handleRandomTeam = () => {
    setOptionMenu(false)
  }
  const handleKeyDown = () => {
    setOptionMenu(true)
  }

  useEffect(() => {



    window.addEventListener('keydown', handleKeyDown())
    return () => {
      window.removeEventListener('keydown', handleKeyDown())
    }
  }, [])
  return (
    <>
      <div className='header'>Valorant Roulette</div>

      <div className="container" >


        {optionMenu && <div className='option' onClick={handleRandomTeam}>Random Team </div>}
        {optionMenu && <div className='option' onClick={handleRandomTeam}>Random Agent </div>}


      </div>









    </>
  );
}

export default App;