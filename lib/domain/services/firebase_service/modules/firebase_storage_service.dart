import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // **************************************************
  // UPLOAD FILE TO STORAGE
  // **************************************************
  Future<String> uploadFile({
    required File file,
    required String folderPath,
  }) async {
    try {
      // Get the file name
      String fileName = basename(file.path);

      // Create a reference to the storage location
      Reference storageRef = _storage.ref().child('$folderPath/$fileName');

      // Upload the file to the storage location
      UploadTask uploadTask = storageRef.putFile(file);

      // Wait for the upload to complete
      TaskSnapshot taskSnapshot = await uploadTask;

      // Get the download URL after the file has been uploaded
      String downloadURL = await taskSnapshot.ref.getDownloadURL();

      return downloadURL;
    } catch (e) {
      print('Error uploading file: $e');
      throw Exception('File upload failed');
    }
  }

  // **************************************************
  // UPLOAD DATA (BYTES) TO STORAGE
  // **************************************************
  Future<String> uploadData({
    required List<int> data,
    required String folderPath,
    required String fileName,
  }) async {
    try {
      // Create a reference to the storage location
      Reference storageRef = _storage.ref().child('$folderPath/$fileName');

      // Upload the data to the storage location
      UploadTask uploadTask = storageRef.putData(data as Uint8List);

      // Wait for the upload to complete
      TaskSnapshot taskSnapshot = await uploadTask;

      // Get the download URL after the file has been uploaded
      String downloadURL = await taskSnapshot.ref.getDownloadURL();

      return downloadURL;
    } catch (e) {
      print('Error uploading data: $e');
      throw Exception('Data upload failed');
    }
  }

  // **************************************************
  // DOWNLOAD FILE FROM STORAGE
  // **************************************************
  Future<File> downloadFile({
    required String filePath,
    required String downloadLocation,
  }) async {
    try {
      // Create a reference to the storage location
      Reference storageRef = _storage.ref().child(filePath);

      // Download the file to the local device
      File downloadToFile = File(downloadLocation);
      await storageRef.writeToFile(downloadToFile);

      return downloadToFile;
    } catch (e) {
      print('Error downloading file: $e');
      throw Exception('File download failed');
    }
  }

  // **************************************************
  // GET DOWNLOAD URL FOR A FILE
  // **************************************************
  Future<String> getDownloadURL(String filePath) async {
    try {
      // Create a reference to the storage location
      Reference storageRef = _storage.ref().child(filePath);

      // Get the download URL for the file
      String downloadURL = await storageRef.getDownloadURL();

      return downloadURL;
    } catch (e) {
      print('Error getting download URL: $e');
      throw Exception('Failed to get download URL');
    }
  }

  // **************************************************
  // DELETE FILE FROM STORAGE
  // **************************************************
  Future<void> deleteFile(String filePath) async {
    try {
      // Create a reference to the storage location
      Reference storageRef = _storage.ref().child(filePath);

      // Delete the file from storage
      await storageRef.delete();
    } catch (e) {
      print('Error deleting file: $e');
      throw Exception('File deletion failed');
    }
  }

  // **************************************************
  // LIST ALL FILES IN A FOLDER
  // **************************************************
  Future<List<Reference>> listFiles(String folderPath) async {
    try {
      // Create a reference to the folder
      Reference folderRef = _storage.ref().child(folderPath);

      // List all files in the folder
      ListResult result = await folderRef.listAll();

      // Return the list of references (files and folders)
      return result.items;
    } catch (e) {
      print('Error listing files: $e');
      throw Exception('Failed to list files');
    }
  }

  // **************************************************
  // GET METADATA OF A FILE
  // **************************************************
  Future<FullMetadata> getFileMetadata(String filePath) async {
    try {
      // Create a reference to the storage location
      Reference storageRef = _storage.ref().child(filePath);

      // Get the metadata of the file
      FullMetadata metadata = await storageRef.getMetadata();

      return metadata;
    } catch (e) {
      print('Error getting file metadata: $e');
      throw Exception('Failed to get file metadata');
    }
  }

  // **************************************************
  // UPDATE FILE METADATA
  // **************************************************
  Future<void> updateFileMetadata({
    required String filePath,
    required SettableMetadata newMetadata,
  }) async {
    try {
      // Create a reference to the storage location
      Reference storageRef = _storage.ref().child(filePath);

      // Update the metadata of the file
      await storageRef.updateMetadata(newMetadata);
    } catch (e) {
      print('Error updating file metadata: $e');
      throw Exception('Failed to update file metadata');
    }
  }
}
