import 'package:test_project/widgets/common_widgets.dart';

class GraphQl_Query {
  static String getData(int pageLimit) {
    return """
  {
  users(limit: $pageLimit) {
    id
    email
    password
    name
    role
    avatar
    creationAt
    updatedAt
  }
}
""";
  }

  static String sendUserData(String userEmail, String userName, String userPassword, String imageUrl) {
    return """ 
mutation {
  addUser(
    data: {
      email: "$userEmail"
      name: "$userName"
      password: "$userPassword"
      avatar: "$imageUrl"
    }
  ) {
    id
    email
    password
    name
    role
    avatar
    creationAt
    updatedAt
  }
}
""";
  }

  static String deleteUserData(String userId) {
    CommonWidgets.printFunction("user id $userId");
    return """ 
mutation {
  deleteUser(id: $userId)
}
""";
  }
}
