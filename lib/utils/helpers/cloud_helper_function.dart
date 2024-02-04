import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HCloudHelperFuction{


  // single records
  static Widget? checkSignleRecordState<T>(AsyncSnapshot<T> snapshot){
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (!snapshot.hasData || snapshot.data == null) {
      return Center(
        child: Text('No Product Found'),
      );
    }
    if (snapshot.hasError) {
      return Center(
        child: Text('Something went wrong'),
      );
    }
    return null;
  }

  // multiple records

static Widget? checkMultipleRecordState<T>({required AsyncSnapshot<List<T>> snapshot,Widget? loader,Widget? nothingFound,Widget? error}){
  if (snapshot.connectionState == ConnectionState.waiting) {
    if(loader!= null)return loader;
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
  if (!snapshot.hasData || snapshot.data == null||snapshot.data!.isEmpty) {
   if(nothingFound!=null)return nothingFound;
    return Center(
      child: Text('No Data Found'),
    );
  }
  if (snapshot.hasError) {
    if(error!=null)return error;
    return Center(
      child: Text('Something went wrong'),
    );
  }
  return null;
}
}