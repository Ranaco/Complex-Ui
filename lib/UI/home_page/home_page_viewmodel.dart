import 'package:stacked/stacked.dart';

class HomePageViewModel extends BaseViewModel {
  bool habitIndex = true;
  bool awardIndex = false;
  turnToHabitPage() {
    habitIndex
        ? {habitIndex = true, awardIndex = false}
        : {habitIndex = true, awardIndex = false};
    print(habitIndex.toString() + "  " + awardIndex.toString());
    notifyListeners();
  }

  turnToAwardPage() {
    awardIndex ? awardIndex = true : {habitIndex = true, awardIndex = false};
    print(awardIndex.toString() + "   " + habitIndex.toString());
    notifyListeners();
  }
}
