const rootRoute = "/";

const dashBoardPageName = "DashBoard";
const dashBoardPageRoute = "/dashboard";

const memberManagementPageName = "MemberManagement";
const memberManagementPageRoute = "/membermanagement";

const messageBoardPageName = "MessageBoard";
const messageBoardPageRoute = "/messageboard";

const stokvelManagementPageName = "StokvelManagement";
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