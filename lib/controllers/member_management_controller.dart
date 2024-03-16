import 'package:get/get.dart';
import 'package:stokvel_admin/helpers/member.dart';
import 'package:stokvel_admin/helpers/stokvel.dart'; 


class MemberManagementController extends GetxController {

  Rx<Stokvel?> selectedStokvel = Rx<Stokvel?>(null);
  RxList<Member> membersToShow = <Member>[].obs;

  final List<Stokvel> stokvels = [
    Stokvel(
      name: 'Stokvel A',
      members: [
        Member(id: '1', name: 'Member 1', status: 'Active', debt: '100'),
        Member(id: '2', name: 'Member 2', status: 'Pending', debt: ''),
        Member(id: '3', name: 'Member 3', status: 'Active', debt: '300'),
      ],
    ),
    Stokvel(
      name: 'Stokvel B',
      members: [
        Member(id: '4', name: 'Member 1', status: 'Active', debt: '150'),
        Member(id: '5', name: 'Member 2', status: 'Active', debt: '200'),
        Member(id: '6', name: 'Member 3', status: 'Active', debt: '250'),
        Member(id: '7', name: 'Member 4', status: 'Active', debt: '350'),
      ],
    ),
    Stokvel(
      name: 'Stokvel C',
      members: [
        Member(id: '8', name: 'Member 1', status: 'Active', debt: '120'),
        Member(id: '9', name: 'Member 2', status: 'Pending', debt: ''),
        Member(id: '10', name: 'Member 3', status: 'Active', debt: '220'),
        Member(id: '11', name: 'Member 4', status: 'Active', debt: '320'),
        Member(id: '12', name: 'Member 5', status: 'Pending', debt: ''),
        // Add more members as needed
      ],
    ),
    // Add more Stokvel instances as needed
  ];

  @override
  void onInit() {
    super.onInit();
    selectedStokvel.value = stokvels.first; // Default to the first stokvel
    membersToShow.assignAll(selectedStokvel.value!.members);
  }

  void onStokvelChanged(String stokvelName) {
    Stokvel? foundStokvel = stokvels.firstWhereOrNull((s) => s.name == stokvelName);
    if (foundStokvel != null) {
      selectedStokvel.value = foundStokvel;
      membersToShow.assignAll(foundStokvel.members);
    }
  }

  void addMember(Member member) {
    selectedStokvel.value?.members.add(member);
    updateMembersToShow();
  }

  void removeMember(String memberId) {
    selectedStokvel.value?.members.removeWhere((m) => m.id == memberId);
    updateMembersToShow();
  }

  void updateMembersToShow() {
    membersToShow.assignAll(selectedStokvel.value?.members ?? []);
  }


  // Member Review:

  void acceptMember() {
    // Implement your logic for accepting a member here
    // Possibly updating data in Firestore and then navigating back
    Get.back(); // This navigates back to the previous screen
  }

  void declineMember() {
    // Implement your logic for declining a member here
    // Possibly updating data in Firestore and then navigating back
    Get.back(); // This navigates back to the previous screen
  }

  void cancelReview() {
    Get.back(); // Navigate back without making changes
  }

  // Future: Implement methods for updating member information and handling member review actions
}
