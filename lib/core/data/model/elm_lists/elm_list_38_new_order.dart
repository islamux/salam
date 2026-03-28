// ElmList38 - إليه يرجع الأمر كله
import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';

List<ElmModelNewOrder> elmList38NewOrder = <ElmModelNewOrder>[
  ElmModelNewOrder(
    titles: [
      "إليه يرجع الأمر كله فاعبده وتوكل عليه",
    ],
    texts: [
      "ما أمرنا أن نعبده إلا بعد أن طمأننا أن الأمر كله عائد إليه، ولكن للاسف ما قدرناه حق قدره، وما عبدناه حق عبادته، وما شكرناه حق شكره، وما هيأنا جوابا لكل سؤال.",
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
    ],
  ),
  ElmModelNewOrder(
    texts: [
      "لم ندخل الاخرة في حساباتنا اليومية، ولم نحسن الظن به، ولم نتوكل عليه حق التوكل.",
      "عشنا الوهم المريح مع عدونا الاول. هذه هي الحقيقة المرة، هذا هو (حالنا) المأساوي، هذا واقعنا المرير.",
    ],
    order: [
      EnOrder.texts,
      EnOrder.texts,
    ],
  ),
];
