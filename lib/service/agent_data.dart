import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/agent.dart';

class AgentData {
  static Future<List<Agent>> getAgent() async {
    final response =
        await http.get(Uri.parse('https://valorant-api.com/v1/agents'));

    if (response.statusCode == 200) {
      List<Agent> agents = [];
      // If the server returns a 200 OK response, parse the JSON.
      Map<String, dynamic> data = jsonDecode(response.body);
      Set<String> roles = Set();
      data["data"].forEach((element) {
        if (element["bustPortrait"] != null) {
          agents.add(Agent(
            name: element["displayName"],
            photo: element["displayIconSmall"],
            fullPhoto: element["bustPortrait"],
            role: element["role"]["displayName"],
          ));
          roles.add(element["role"]["displayIcon"]);
        }
      });
      print(roles);

      return agents;
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load data');
    }
  }
}
