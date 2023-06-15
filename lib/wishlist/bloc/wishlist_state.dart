part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistSuccessState extends WishlistState {}

class WishlistErrorState extends WishlistState {}
