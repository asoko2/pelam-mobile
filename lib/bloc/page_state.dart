part of 'page_bloc.dart';

@immutable
abstract class PageState {}

class PageInitial extends PageState {}

class OnSignInPage extends PageState {}

class OnSignUpPage extends PageState {}

class OnHomePage extends PageState {}
