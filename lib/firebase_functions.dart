import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/task_model.dart';

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

  static Future<void> addTask(TaskModel task){
    var colletion =getTaskCollection();
    var docRef= colletion.doc();
    task.id=docRef.id;
    return docRef.set(task);
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime date){
    var collection=getTaskCollection();
   return collection.where("date",isEqualTo:DateUtils.dateOnly(date).microsecondsSinceEpoch).snapshots();
  }

  static Future<void> deleteTask(String id){
   return getTaskCollection().doc(id).delete();
  }
  static Future<void> updateTask(TaskModel taskModel){
    return getTaskCollection().doc(taskModel.id).update(taskModel.toJson());

  }
}