const rootRoute = "/";

const dashBoardPageName = "Dash Board";
const dashBoardPageRoute = "/dashboard";

const memberManagementPageName = "Member Management";
const memberManagementPageRoute = "/membermanagement";

const messageBoardPageName = "Message Board";
const messageBoardPageRoute = "/messageboard";

const stokvelManagementPageName = "Stokvel Management";
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