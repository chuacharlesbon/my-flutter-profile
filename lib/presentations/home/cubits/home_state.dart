// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'home_cubit.dart';

class ComponentA extends Equatable {
  final String? dataA;
  final String dataB;
  const ComponentA({
    this.dataA,
    this.dataB = "",
  });

  @override
  List<Object> get props => [
        if (dataA != null) dataA!,
        dataB,
      ];

  ComponentA copyWith({
    String? dataA,
    String? dataB,
  }) {
    return ComponentA(
      dataA: dataA ?? this.dataA,
      dataB: dataB ?? this.dataB,
    );
  }
}

class HomeState extends Equatable {
  final StateStatus status;
  final Map<String, dynamic> itemA;
  final List<dynamic> itemB;
  final ComponentA componentA;
  const HomeState({
    this.status = StateStatus.initial,
    this.itemA = const {},
    this.itemB = const [],
    this.componentA = const ComponentA()
  });

  @override
  List<Object> get props => [status, itemA, itemB, componentA];

  HomeState copyWith({
    StateStatus? status,
    Map<String, dynamic>? itemA,
    List<dynamic>? itemB,
    ComponentA? componentA,
  }) {
    return HomeState(
      status: status ?? this.status,
      itemA: itemA ?? this.itemA,
      itemB: itemB ?? this.itemB,
      componentA: componentA ?? this.componentA,
    );
  }

  @override
  bool get stringify => true;
}
