import 'package:flutter/material.dart';

import '../models/agent.dart';
import '../service/agent_data.dart';

class NormalTeamPage extends StatefulWidget {
  static const String id = "normal-team";

  @override
  State<NormalTeamPage> createState() => _NormalTeamPageState();
}

class _NormalTeamPageState extends State<NormalTeamPage> {
  List<Agent> agents = []; // Declare agents list at the class level
  List<Agent> random = []; // Declare random list at the class level

  @override
  void initState() {
    super.initState();
    _fetchAgents(); // Fetch agents when the page initializes
  }

  void _fetchAgents() async {
    List<Agent> fetchedAgents = await AgentData.getAgent();
    setState(() {
      agents = fetchedAgents;
      random = getAgents(agents); // Randomize the agents once
    });
  }

  List<Agent> getAgents(List<Agent> agents) {
    agents.shuffle();
    bool controller = false;
    bool initiator = false;
    bool sentinel = false;
    bool deul1 = false;
    bool deul2 = false;
    List<Agent> choosen = [];
    agents.forEach((element) {
      if (element.role == "Initiator" && initiator == false) {
        choosen.add(element);
        initiator = true;
      }
      if (element.role == "Sentinel" && sentinel == false) {
        choosen.add(element);
        sentinel = true;
      }
      if (element.role == "Controller" && controller == false) {
        choosen.add(element);
        controller = true;
      }
      if (element.role == "Duelist" && deul1 == false) {
        choosen.add(element);
        deul1 = true;
      } else if (element.role == "Duelist" && deul2 == false) {
        choosen.add(element);
        deul2 = true;
      }
    });
    return choosen;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return agents.isEmpty
        ? Container(
            color: Theme.of(context).colorScheme.background,
            child: const Center(child: CircularProgressIndicator()),
          ) // Show loading indicator if agents are not fetched yet
        : Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(),
            floatingActionButton: SizedBox(
              width: 70,
              height: 70,
              child: FloatingActionButton(
                onPressed: _randomizeAgents,
                child: const Icon(
                  Icons.shuffle,
                  color: Colors.black,
                  size: 60,
                ),
              ),
            ),
            body: Center(
                child: Stack(children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.55),
                child: Image.network(random[0].fullPhoto),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.3),
                child: Image.network(random[1].fullPhoto),
              ),
              Padding(
                padding: EdgeInsets.only(right: width * 0.55),
                child: Image.network(random[3].fullPhoto),
              ),
              Padding(
                padding: EdgeInsets.only(right: width * 0.3),
                child: Image.network(random[4].fullPhoto),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Image.network(random[2].fullPhoto),
              ),
            ])));
  }

  void _randomizeAgents() {
    setState(() {
      random = getAgents(agents);
    });
  }
}
