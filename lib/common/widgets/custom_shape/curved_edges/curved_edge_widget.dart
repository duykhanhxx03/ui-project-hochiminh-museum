import 'package:ui_project_hochiminh_museum/common/widgets/custom_shape/curved_edges/curved_edges.dart';
import 'package:flutter/material.dart';

class TCurvedEdgeWidget extends StatelessWidget {
  const TCurvedEdgeWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: TCustomCurvedEdges(), child: child);
  }
}
