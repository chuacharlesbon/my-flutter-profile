import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class AboutEvent extends Equatable {
  const AboutEvent();

  @override
  List<Object> get props => [];
  List<Object> get props1 => [];
}

class LoadAboutEvent extends AboutEvent {
  @override
  List<Object> get props => [];
  List<Object> get props1 => [];
}

class GetDataEvent extends AboutEvent {
    final String patronID;

  const GetDataEvent({
    required this.patronID
  });
}