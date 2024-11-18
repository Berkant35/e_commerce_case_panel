import 'package:equatable/equatable.dart';

class CategoryEditableEntity with EquatableMixin {
  final int? id;
  String? name;
  String? slug;
  int? sortOrder;
  String? metaDescription;
  String? metaKeywords;
  int? displayShowcaseContent;
  int? showcaseContentDisplayType;
  int? displayShowcaseFooterContent;
  int? showcaseFooterContentDisplayType;
  int? isSearchable;

  CategoryEditableEntity({
    this.id,
    this.name,
    this.slug,
    this.sortOrder,
    this.metaDescription,
    this.metaKeywords,
    this.displayShowcaseContent,
    this.showcaseContentDisplayType,
    this.displayShowcaseFooterContent,
    this.showcaseFooterContentDisplayType,
    this.isSearchable,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    slug,
    sortOrder,
    metaDescription,
    metaKeywords,
    displayShowcaseContent,
    showcaseContentDisplayType,
    displayShowcaseFooterContent,
    showcaseFooterContentDisplayType,
    isSearchable,
  ];


}
