import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/cubit/base_cubit/base_page_cubit.dart';

class Elm13Cubit extends BasePageCubit {
  @override
List<Text>  getShareText(int currentPageIndex, List<ElmModelNew> elmList) {
    return whichPageToShareInTherteen(currentPageIndex, elmList13);
  }
}
