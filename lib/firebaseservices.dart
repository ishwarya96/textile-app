import 'package:my_dress_app/catgorymodel.dart';
import 'package:my_dress_app/firebase.dart';
import 'package:my_dress_app/firebaseconst.dart';
import 'package:my_dress_app/string.dart';

class FirestorServices {
  static getProducts(Category) {
    return firestore
        .collection(productsCollection)
        .where('p_category', isEqualTo: Category)
        .snapshots();
  }

  static getCart(uid) {
    return firestore
        .collection(cartCollection)
        .where("added_by", isEqualTo: uid)
        .snapshots();
  }

  static deleteDocument(docId) {
    return firestore.collection(cartCollection).doc(docId).delete();
  }

  static getAllOrders() {
    return firestore
        .collection(ordersCollection)
        .where('order_by', isEqualTo: currentUser!.uid)
        .snapshots();
  }

  static getWishlists() {
    return firestore
        .collection(productsCollection)
        .where('p_wishlist', arrayContains: currentUser!.uid)
        .snapshots();
  }

  static allproducts() {
    return firestore.collection(productsCollection).snapshots();
  }

  static getFeaturedProucts() {
    return firestore
        .collection(productsCollection)
        .where('is_featured', isEqualTo: true)
        .get();
  }
}
