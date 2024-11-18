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

  Map<String,dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'sort_order': sortOrder,
      'meta_description': metaDescription,
      'meta_keywords': metaKeywords,
      'display_showcase_content': displayShowcaseContent,
      'showcase_content_display_type': showcaseContentDisplayType,
      'display_showcase_footer_content': displayShowcaseFooterContent,
      'showcase_footer_content_display_type': showcaseFooterContentDisplayType,
      'is_searchable': isSearchable,
    };
  }

  //copyWith method

  CategoryEditableEntity copyWith({
    int? id,
    String? name,
    String? slug,
    int? sortOrder,
    String? metaDescription,
    String? metaKeywords,
    int? displayShowcaseContent,
    int? showcaseContentDisplayType,
    int? displayShowcaseFooterContent,
    int? showcaseFooterContentDisplayType,
    int? isSearchable,
  }) {
    return CategoryEditableEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      sortOrder: sortOrder ?? this.sortOrder,
      metaDescription: metaDescription ?? this.metaDescription,
      metaKeywords: metaKeywords ?? this.metaKeywords,
      displayShowcaseContent: displayShowcaseContent ?? this.displayShowcaseContent,
      showcaseContentDisplayType: showcaseContentDisplayType ?? this.showcaseContentDisplayType,
      displayShowcaseFooterContent: displayShowcaseFooterContent ?? this.displayShowcaseFooterContent,
      showcaseFooterContentDisplayType: showcaseFooterContentDisplayType ?? this.showcaseFooterContentDisplayType,
      isSearchable: isSearchable ?? this.isSearchable,
    );
  }

}
