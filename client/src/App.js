import React, { useState, useEffect } from 'react';



const brimstone = process.env.PUBLIC_URL + '/icons/brimstone.jpeg'
const viper = process.env.PUBLIC_URL + '/icons/viper.jpeg'
const harbor = process.env.PUBLIC_URL + '/icons/harbor.jpeg'
const astra = process.env.PUBLIC_URL + '/icons/astra.jpeg'
const omen = process.env.PUBLIC_URL + '/icons/omen.jpeg'


const breach = process.env.PUBLIC_URL + '/icons/breach.jpeg'
const kay0 = process.env.PUBLIC_URL + '/icons/kay0.jpeg'
const skye = process.env.PUBLIC_URL + '/icons/skye.jpeg'
const sova = process.env.PUBLIC_URL + '/icons/sova.jpeg'
const fade = process.env.PUBLIC_URL + '/icons/fade.jpeg'



const chamber = process.env.PUBLIC_URL + '/icons/chamber.jpeg'
const cypher = process.env.PUBLIC_URL + '/icons/cypher.jpeg'
const sage = process.env.PUBLIC_URL + '/icons/sage.jpeg'
const killjoy = process.env.PUBLIC_URL + '/icons/killjoy.jpeg'
const deadlock = process.env.PUBLIC_URL + '/icons/deadlock.jpeg'

const neon = process.env.PUBLIC_URL + '/icons/neon.jpeg'
const jett = process.env.PUBLIC_URL + '/icons/jett.jpeg'
const raze = process.env.PUBLIC_URL + '/icons/raze.jpeg'
const yoru = process.env.PUBLIC_URL + '/icons/yoru.jpeg'
const reyna = process.env.PUBLIC_URL + '/icons/reyna.jpeg'
const iso = process.env.PUBLIC_URL + '/icons/iso.jpeg'
const phoenix = process.env.PUBLIC_URL + '/icons/pheonix.jpeg'

const pics = {
  "brimstone": brimstone,
  "viper": viper,
  "harbor": harbor,
  "astra": astra,
  "omen": omen,
  "breach": breach,
  "kay0": kay0,
  "skye": skye,
  "sova": sova,
  "fade": fade,
  "chamber": chamber,
  "cypher": cypher,
  "sage": sage,
  "killjoy": killjoy,
  "deadlock": deadlock,
  "neon": neon,
  "jett": jett,
  "raze": raze,
  "yoru": yoru,
  "reyna": reyna,
  "iso": iso,
  "phoenix": phoenix,
};
console.log(pics['jett'])
const data = {
  "smokes": [
    "astra",
    "brimstone",
    "viper",
    "harbor",
    "omen"
  ],
  "initiators": [
    "breach",
    "kay0",
    "skye",
    "sova",
    "fade"
  ],
  "sentinels": [
    "chamber",
    "cypher",
    "killjoy",
    "sage",
    "deadlock"
  ],
  "duelists": [
    "jett",
    "neon",
    "phoenix",
    "raze",
    "reyna",
    "yoru",
    "iso"
  ]
}


const generateAgent = () => {
  const agents = Object.keys(pics)
  const agent = agents[Math.floor(Math.random() * agents.length)]
  return agent
}

const generateTeam = (data) => {
  // const names = ['smokes', 'initiators', 'sentinels', 'duelists']

  const smokes = data['smokes'];
  const inits = data['initiators'];
  const sens = data['sentinels'];
  const duels = data['duelists'];

  const smoker = smokes[Math.floor(Math.random() * smokes.length)];
  const initiator = inits[Math.floor(Math.random() * inits.length)];
  const sentinel = sens[Math.floor(Math.random() * sens.length)];
  const d1 = Math.floor(Math.random() * duels.length);
  const duelist1 = duels[d1]
  const team = [smoker, initiator, sentinel, duelist1];


  let d2 = Math.floor(Math.random() * duels.length);


  while (d1 === d2 || duels[d2] in team) {
    d2 = Math.floor(Math.random() * duels.length);
  }

  const fifth = duels[d2];

  team.push(fifth)

  const team2 = [];
  const j = Math.floor(Math.random() * 5);

  for (let i = 0; i < 5; i++) {
    team2.push(team[(j + i) % 5]);
  }

  return team2;
}


function App() {
  const [optionMenu, setOptionMenu] = useState(true)
  const [showTeam, setShowTeam] = useState(false)

  const [showAgent, setShowAgent] = useState(false)
  const [team, setTeam] = useState([])
  const [Agent, setAgent] = useState('')


  const [reRender, setreRender] = useState(0)

  const handleRandomTeam = () => {
    setOptionMenu(false)
    setShowTeam(true)
  }
  const handleRandomAgent = () => {
    setOptionMenu(false)
    setShowAgent(true)
  }


  const handleRender = () => {
    setreRender(reRender + 1)
  }

  const handleCloseAgents = () => {
    setShowTeam(false)
    setShowAgent(false)
    setOptionMenu(true)
  }
  useEffect(() => {
    const fetchTeam = () => {
      setTeam(generateTeam(data))
      setAgent(generateAgent())
    }

    fetchTeam()
  }, [reRender])




  return (
    <>
      <div className='header'>Valorant Roulette</div>

      <div className="container" >

        {showTeam &&
          <div className='agents-container'>

            <div className='close' onClick={handleCloseAgents}>x</div>
            <div className='agents'>
              {team.map((agent) => {
                console.log(agent); // Optional: You can keep or remove the console.log as needed
                return (<div className='agent'>
                  <img src={pics[agent]} alt={`${agent}`}></img>

                  <span>{agent}</span>
                </div>); // Make sure to return the JSX element
              })

              }
            </div>
            <button className='generator' onClick={handleRender}>New Team</button>

          </div>

        }{
          showAgent &&
          <div className='agent-container'>
            <div className='close' onClick={handleCloseAgents}>x</div>
            <div className='agentmax' >

              <img src={pics[Agent]} className='image'></img>
              {Agent}</div>
            <button className='generator' onClick={handleRender}>New Agent</button>

          </div>


        }
        {optionMenu && <div className='option' onClick={handleRandomTeam}>Random Team </div>}
        {optionMenu && <div className='option' onClick={handleRandomAgent}>Random Agent </div>}


      </div >









    </>
  );
}

export default App;