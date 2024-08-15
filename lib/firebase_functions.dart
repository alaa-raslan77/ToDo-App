import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/task_model.dart';
import 'package:todo_app/user_model.dart';

class FirebaseFunctions{

  static CollectionReference<TaskModel> getTaskCollection(){
    return FirebaseFirestore.instance.collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return   TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (task, _) {
        return task.toJson();

      },);
  }

  static CollectionReference<UserModel> getUsersCollection(){
    return FirebaseFirestore.instance.collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return   UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (user, _) {
        return user.toJson();

      },);
  }

  static addUser(UserModel userModel){
    var collection = getUsersCollection();
    var docRef = collection.doc(userModel.id);
    docRef.set(userModel);
  }

  static Future<void> addTask(TaskModel task){
    var colletion =getTaskCollection();
    var docRef= colletion.doc();
    task.id=docRef.id;
    return docRef.set(task);
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime date){
    var collection=getTaskCollection();
   return collection.where("userId",isEqualTo: FirebaseAuth.instance.currentUser!.uid).
   where("date",isEqualTo:DateUtils.dateOnly(date).microsecondsSinceEpoch).snapshots();
  }

  static Future<void> deleteTask(String id){
   return getTaskCollection().doc(id).delete();
  }

  static Future<void> updateTask(TaskModel taskModel){
    return getTaskCollection().doc(taskModel.id).update(taskModel.toJson());
  }

  static creatAccount(String email,String password,
      {required String userName,required String phone,required int age
      ,required Function onSuccess,required Function onError}
      )async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      credential.user?.sendEmailVerification();
      UserModel userModel=UserModel(
        id:credential.user!.uid ,
          userName: userName, phone: phone, age: age, email: email);
      addUser(userModel);
      onSuccess();

    } on FirebaseAuthException catch (e) {
      onError(e.message);
    } catch (e) {
      print(e);
      onError(e.toString());
    }
  }

  static login(String email,String password,
      {required Function onSuccess,required Function onError})async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      if(credential.user?.emailVerified==true){
        onSuccess();
      }
    } on FirebaseAuthException catch (e) {
      onError(e.toString());
    }
  }
}