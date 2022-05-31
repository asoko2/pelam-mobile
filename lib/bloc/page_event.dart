part of 'page_bloc.dart';

@immutable
abstract class PageEvent {}

class GoToSignInPage extends PageEvent {}

class GoToSignUpPage extends PageEvent {}

class GoToHomePage extends PageEvent {}
