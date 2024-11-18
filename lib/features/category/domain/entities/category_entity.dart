import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String id;
  final String name;
  final String metaDescription;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.metaDescription,
  });

  @override
  List<Object?> get props => [id, name, metaDescription];
}
