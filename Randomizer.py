import json
import random 

mapfile = "MapBasedAgents.json"
agentsfile ="agents.json"
# Read JSON data from the file
with open(mapfile, 'r') as json_file:
    mapbasedagents = json.load(json_file)
with open(agentsfile, 'r') as json_file:
    agents = json.load(json_file)




def randomize (mapbased , randomFifth , map):
  if(mapbased):
     data= mapbasedagents[map] 
  else:
     data = agents


  smokes = data['smokes']
  inits = data['initiators']
  sens= data['sentinels']
  duels = data['duelists']

  names  = ['smokes',
  'initiators',
  'sentinels',
  'duelists'
  ]
  smoker = smokes[ random.randint(0, len(smokes) -1)]
  initiator = inits[ random.randint(0, len(inits)-1)]
  sentinel = sens[ random.randint(0, len(sens)   -1)]
  d1 = random.randint(0, len(duels) -1)
  duelist = duels[d1]   

  team = [smoker , initiator , sentinel , duelist]
  list = data['duelists']
  if randomFifth : 
     list = data[ names[random.randint(0,len(names)-1)]  ]
  d2 =  random.randint(0, len(list) -1) 


  while(d1 == d2 or list[d2] in team ):
    d2 =  random.randint(0, len(list) -1) 

  fifth = list[d2]
  team.append(fifth)
  team2 = []

  j = random.randint(1,5)
  for i in range(0,5):
    team2.append(team[(j+i)%5])

  return team2