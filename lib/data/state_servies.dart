import 'package:nauru_mobile_app/data/upcoming_case.dart';

class StateService {

  static List<String> states = [
    'ANDAMAN AND NICOBAR ISLANDS'
  ];

  static List<UpcomingCase> statesObj = [];

  // static List<String> getSuggestions(String query) {
  //   List<String> matches = [];
  //   matches.addAll(states);
  //   matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
  //   return matches;
  // }
  static List<UpcomingCase> getSuggestions(String query) {
    List<UpcomingCase> matches = [];
    matches.addAll(statesObj);
    matches.retainWhere((s) => s.parties.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  static reloadData(data){
    states = data;
  }

  static reloadDataObj(data){
    statesObj = data;
  }


}
//https://api.textware.lk/nauru/v1/api/case/check
//{
//     "dateFrom":"2022-01-01",
//     "idList":[1]
// }