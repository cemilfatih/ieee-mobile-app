import 'package:flutter/foundation.dart';
import 'package:kartal/kartal.dart';
import '../../enums/FirebaseCollectionsEnum.dart';
import '../../enums/PlatformEnum.dart';
import '../../models/appVersionModel.dart';
import '../../utility/versionManager.dart';

class splashLogic {



  var isRequiredForceUpdate ;


  Future<bool> checkAppVersion() async {
    try {
      final databaseVersion = await getVersionFromDatabase();
      final clientVersion = ''.version;

      if (databaseVersion == null || databaseVersion.isEmpty) {
        isRequiredForceUpdate == true;
        "empty database version";
      }

      final checkisNeedForceUpdate = VersionManager(
          databaseVersion: databaseVersion!,
          deviceVersion: clientVersion);


      if (checkisNeedForceUpdate.isNeedForUpdate()) {
        isRequiredForceUpdate = true;
      } else {
        isRequiredForceUpdate = false;
      }

      return isRequiredForceUpdate;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<String?> getVersionFromDatabase() async {
    if (kIsWeb) return null;

    final response = await FirebaseCollections.version.reference.withConverter<versionModel>(
        fromFirestore: (snapshot, _) => versionModel().fromFirebase(snapshot),
        toFirestore: (model, _) => model.toJson())
        .doc(PlatformEnum.versionName)
        .get();


    return response
        .data()
        ?.number;
  }

  Future<String?> getCode() async {

    final response = await FirebaseCollections.version.reference.withConverter<splashCodeModel>(
        fromFirestore: (snapshot , _) => splashCodeModel().fromFirebase(snapshot),
        toFirestore: (snapshot, _) => snapshot.toJson())
        .doc("passcode")
        .get();

    return response.data()!.code;
  }
}
