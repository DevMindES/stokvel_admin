import 'package:stokvel_admin/pages/member_management/add_member_page.dart';

const rootRoute = "/";

const dashBoardPageName = "Dash Board";
const dashBoardPageRoute = "/dashboard";

const memberManagementPageName = "Member Management";
const memberManagementPageRoute = "/membermanagement";

<<<<<<< HEAD
const messageBoardPageName = "Message Board";
const messageBoardPageRoute = "/messageboard";

const stokvelManagementPageName = "Stokvel Management";
=======
const addMemberPageRoute = '/addmember';

const reviewMemberPageRoute = '/reviewmember';

const messageBoardPageName = "MessageBoard";
const messageBoardPageRoute = "/messageboard";

const allMessagesPageRoute = '/viewallmessages';

const stokvelManagementPageName = "StokvelManagement";
>>>>>>> c08873887012a571ecdfac18d0a596173c830005
const stokvelManagementPageRoute = "/stokvelmanagement";

const loginPageName = "Login";
const loginPageRoute = "/login";



class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItemRoutes = [
MenuItem(dashBoardPageName, dashBoardPageRoute),
MenuItem(memberManagementPageName, memberManagementPageRoute),
MenuItem(messageBoardPageName, messageBoardPageRoute),
MenuItem(stokvelManagementPageName, stokvelManagementPageRoute),
MenuItem(loginPageName, loginPageRoute)
];
