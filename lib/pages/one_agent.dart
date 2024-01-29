import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/agent.dart';
import '../service/agent_data.dart';

class OneAgent extends StatefulWidget {
  static const id = "one-agent";

  @override
  State<OneAgent> createState() => _OneAgentState();
}

class _OneAgentState extends State<OneAgent> {
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
    return agents.sublist(0, 1);
  }

  @override
  Widget build(BuildContext context) {
    return agents.isEmpty
        ? Container(
            color: Theme.of(context).colorScheme.background,
            child: Center(child: const CircularProgressIndicator()),
          ) // Show loading indicator if agents are not fetched yet
        : Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(),
            floatingActionButton: Container(
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
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 0.0),
                  child: Image.network(
                    random[0].fullPhoto,
                  ),
                ),
              ),
            )),
          );
  }

  void _randomizeAgents() {
    setState(() {
      random = getAgents(
          agents); // Update the random list when FloatingActionButton is pressed
    });
  }
}
