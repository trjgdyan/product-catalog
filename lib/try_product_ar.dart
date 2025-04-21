import 'package:flutter/material.dart';
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:ar_flutter_plugin/models/ar_anchor.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';

import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/datatypes/config_planedetection.dart';




class TryProductAR extends StatefulWidget {
  const TryProductAR({super.key});

  @override
  State<TryProductAR> createState() => _TryProductARState();
}

class _TryProductARState extends State<TryProductAR> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Coba Produk AR")),
      body: ARView(
        onARViewCreated: onARViewCreated,
        planeDetectionConfig: PlaneDetectionConfig.horizontal,
      ),
    );
  }

  void onARViewCreated(
    ARSessionManager sessionManager,
    ARObjectManager objectManager,
    ARAnchorManager anchorManager,
    ARLocationManager locationManager,
  ) async {
    arSessionManager = sessionManager;
    arObjectManager = objectManager;

    arSessionManager.onInitialize(
      showFeaturePoints: false,
      showPlanes: true,
      // customPlaneTexturePath: "assets/images/plane_texture.png",
    );
    arObjectManager.onInitialize();

    // Tambahkan model ke scene
    var newNode = ARNode(
      type: NodeType.localGLTF2,
      uri: "assets/model/batik1.glb", 
      scale: Vector3(0.5, 0.5, 0.5),
      position: Vector3(0.0, 0.0, -1.0),
      rotation: Vector4(0.0, 0.0, 0.0, 0.0),
    );

    await arObjectManager.addNode(newNode);
  }

  @override
  void dispose() {
    arSessionManager.dispose();
    super.dispose();
  }
}
