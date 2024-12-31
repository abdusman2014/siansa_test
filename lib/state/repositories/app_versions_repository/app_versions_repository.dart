import 'package:siansa_app/constants/datasets_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firestore = FirebaseFirestore.instance;

class AppVersionsRepository {
  Future<Map<String, dynamic>> getLatestVersionDoc() async {
    try {
      var appVersionsDoc = await FirebaseFirestore.instance
          .collection(DatasetsConstants.APP_VERSIONS_DATASET)
          .doc('latest')
          .get();

      Map<String, dynamic> data = appVersionsDoc.data() as Map<String, dynamic>;

      return data;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<Map<String, dynamic>> shouldUpdateApp() async {
    try {
      Map<String, dynamic> latestVersionData = await getLatestVersionDoc();

      return latestVersionData;
    } catch (e) {
      return {"error": e.toString()};
    }
  }
}
