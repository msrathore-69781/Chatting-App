// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';

// List<CameraDescription>? cameras;

// class CameraScreen extends StatefulWidget {
//   const CameraScreen({super.key});

//   @override
//   State<CameraScreen> createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   late CameraController _cameraController;
//   late Future<void> cameraValue;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _cameraController = CameraController(cameras!.first, ResolutionPreset.high);
//     cameraValue = _cameraController.initialize();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           FutureBuilder(
//             future: cameraValue,
//             builder: (context, snapshot) {
//               //if the camera is initialized properly
//               if (snapshot.connectionState == ConnectionState.done) {
//                 return CameraPreview(_cameraController);
//               } else {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//             },
//           ),
//           Positioned(
//             bottom: 0.0,
//             child: Padding(
//               padding: const EdgeInsets.only(top: 5,bottom:5 ),
//               child: Container(
//                 color: Colors.black,
//                 width: MediaQuery.of(context).size.width,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         IconButton(
//                             onPressed: () {},
//                             icon: Icon(
//                               Icons.flash_off,
//                               color: Colors.white,
//                               size: 28,
//                             )),
//                         InkWell(
//                           onTap: () {
                            
//                           },
//                           child: IconButton(
//                               onPressed: () {},
//                               icon: Icon(
//                                 Icons.panorama_fish_eye,
//                                 color: Colors.white,
//                                 size: 70,
//                               )),
//                         ),
//                         IconButton(
//                             onPressed: () {},
//                             icon: Icon(
//                               Icons.flip_camera_ios,
//                               color: Colors.white,
//                               size: 28,
//                             ))
//                       ],
            
//                     ),
//                     SizedBox(height: 4,),
//                     Text("Hold for Video, tap for the video ",style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,)
//                   ],
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
