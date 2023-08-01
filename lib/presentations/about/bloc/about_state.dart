import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AboutState extends Equatable {}

class AboutLoadingState extends AboutState {
  @override
  List<Object?> get props => [];
  List<Object?> get props1 => [];
}

class AboutLoadedState<AboutModel, About2Model> extends AboutState {
  final AboutModel data1;
  final List<About2Model> data2;

  AboutLoadedState(this.data1, this.data2);

  @override
  List<Object?> get props => [data1];
  List<Object?> get props1 => [data2];
}

class AboutErrorState extends AboutState {
  final String error;

  AboutErrorState(this.error);

  @override
  List<Object?> get props => [error];
}