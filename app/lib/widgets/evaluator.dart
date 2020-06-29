import 'package:ArcGraph/models/evaluations/dimensionToEvaluate.dart';
import 'package:ArcGraph/models/evaluations/hability.dart';
import 'package:ArcGraph/widgets/hability_view.dart';
import 'package:flutter/material.dart';

class Evaluator extends StatefulWidget {
  final List<Hability> habilities;

  Evaluator(this.habilities);

  @override
  _EvaluatorState createState() => _EvaluatorState(this.habilities);
}

class _EvaluatorState extends State<Evaluator> {
  final List<Hability> habilities;
  List<HabilityView> habilitiesView;

  _EvaluatorState(this.habilities) {
    habilitiesView = habilities.map((e) => HabilityView(e, false)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return habilitiesView.isEmpty
        ? Text("Nenhuma habilidade cadastrada")
        : SingleChildScrollView(
            child: Container(
              child: ExpansionPanelList(
                expansionCallback: (panelIndex, isExpanded) {
                  setState(() {
                    this.habilitiesView[panelIndex].isExpanded = !isExpanded;
                  });
                },
                children: habilitiesView.map<ExpansionPanel>(
                  (HabilityView habilityView) {
                    return ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return Text(habilityView.hability.name);
                      },
                      body: Container(
                        child: Column(
                          children: habilityView.hability.dimensions.map<Row>(
                            (DimensionToEvaluate dimensionToEvaluate) {
                              return Row(
                                children: [
                                  Text(dimensionToEvaluate.name),
                                  Expanded(
                                    child: Slider(
                                      value: 0,
                                      min: 0,
                                      max: 100,
                                      onChanged: (value) {},
                                    ),
                                  ),
                                ],
                              );
                            },
                          ).toList(),
                        ),
                      ),
                      isExpanded: habilityView.isExpanded,
                      canTapOnHeader: true,
                    );
                  },
                ).toList(),
              ),
            ),
          );
  }
}

// class Evaluator extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return habilitiesView.isEmpty
//         ? Text("Nenhuma habilidade cadastrada")
//         : SingleChildScrollView(
//             child: Container(
//               child: ExpansionPanelList(
//                 expansionCallback: (panelIndex, isExpanded) {
//                   setState(() {
//                   this.habilitiesView[panelIndex].isExpanded = isExpanded;
//                   });
//                 },
//                 children: habilitiesView.map<ExpansionPanel>(
//                   (HabilityView habilityView) {
//                     return ExpansionPanel(
//                         headerBuilder: (context, isExpanded) {
//                           return Text(habilityView.hability.name);
//                         },
//                         body: Container(
//                           child: Text(
//                             habilityView.hability.dimensions[0].name,
//                           ),
//                         ),
//                         isExpanded: habilityView.isExpanded,
//                         canTapOnHeader: true,);
//                   },
//                 ).toList(),
//               ),
//             ),
//           );
//     // : ListView.builder(
//     //     itemBuilder: (ctx, index) {
//     //       return Card(
//     //         child: ExpansionPanelList(
//     //           children: [
//     //             ExpansionPanel(
//     //               headerBuilder: (context, isExpanded) {
//     //                 return Text(habilities[index].name);
//     //               },
//     //               body: Container(
//     //                 child: Text("oi"),
//     //               ),
//     //               canTapOnHeader: true,
//     //             ),
//     //           ],
//     //         ),
//     //       );
//     //     },
//     //     itemCount: habilities.length,
//     //   );
//   }
// }
