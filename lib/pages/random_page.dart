import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/agent.dart';
import '../service/agent_data.dart';

class RandomPage extends StatefulWidget {
  static const id = 'random-page';

  @override
  State<RandomPage> createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
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
    return agents.sublist(0, 5);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
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
