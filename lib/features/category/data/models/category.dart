import 'package:ECommercePanel/features/category/domain/entities/category_editable_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/category_entity.dart';

part 'category.g.dart';

@JsonSerializable()
class Category with EquatableMixin {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'slug')
  String? slug;
  @JsonKey(name: 'sortOrder')
  int? sortOrder;
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'distributorCode')
  String? distributorCode;
  @JsonKey(name: 'percent')
  int? percent;
  @JsonKey(name: 'displayShowcaseContent')
  int? displayShowcaseContent;
  @JsonKey(name: 'showcaseContentDisplayType')
  int? showcaseContentDisplayType;
  @JsonKey(name: 'displayShowcaseFooterContent')
  int? displayShowcaseFooterContent;
  @JsonKey(name: 'showcaseFooterContentDisplayType')
  int? showcaseFooterContentDisplayType;
  @JsonKey(name: 'hasChildren')
  int? hasChildren;
  @JsonKey(name: 'metaDescription')
  String? metaDescription;
  @JsonKey(name: 'metaKeywords')
  String? metaKeywords;
  @JsonKey(name: 'isCombine')
  int? isCombine;
  @JsonKey(name: 'isSearchable')
  int? isSearchable;
  @JsonKey(name: 'createdAt')
  String? createdAt;

  Category({
    this.id,
    this.name,
    this.slug,
    this.sortOrder,
    this.status,
    this.distributorCode,
    this.percent,
    this.displayShowcaseContent,
    this.showcaseContentDisplayType,
    this.displayShowcaseFooterContent,
    this.showcaseFooterContentDisplayType,
    this.hasChildren,
    this.metaDescription,
    this.metaKeywords,
    this.isCombine,
    this.isSearchable,
    this.createdAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  CategoryEditableEntity toCategoryEditableEntity() {
    return CategoryEditableEntity(
      id: id,
      name: name,
      metaDescription: metaDescription,
      metaKeywords: metaKeywords,
      displayShowcaseContent: displayShowcaseContent,
      showcaseContentDisplayType: showcaseContentDisplayType,
      displayShowcaseFooterContent: displayShowcaseFooterContent,
      showcaseFooterContentDisplayType: showcaseFooterContentDisplayType,
      isSearchable: isSearchable,
    );
  }

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id.toString(),
      name: name ?? "",
      metaDescription: metaDescription ?? "",
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        sortOrder,
        status,
        distributorCode,
        percent,
        displayShowcaseContent,
        showcaseContentDisplayType,
        displayShowcaseFooterContent,
        showcaseFooterContentDisplayType,
        hasChildren,
        metaDescription,
        metaKeywords,
        isCombine,
        isSearchable,
        createdAt
      ];

  Category copyWith({
    int? id,
    String? name,
    String? slug,
    int? sortOrder,
    int? status,
    String? distributorCode,
    int? percent,
    int? displayShowcaseContent,
    int? showcaseContentDisplayType,
    int? displayShowcaseFooterContent,
    int? showcaseFooterContentDisplayType,
    int? hasChildren,
    String? metaDescription,
    String? metaKeywords,
    int? isCombine,
    int? isSearchable,
    String? createdAt,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      sortOrder: sortOrder ?? this.sortOrder,
      status: status ?? this.status,
      distributorCode: distributorCode ?? this.distributorCode,
      percent: percent ?? this.percent,
      displayShowcaseContent:
          displayShowcaseContent ?? this.displayShowcaseContent,
      showcaseContentDisplayType:
          showcaseContentDisplayType ?? this.showcaseContentDisplayType,
      displayShowcaseFooterContent:
          displayShowcaseFooterContent ?? this.displayShowcaseFooterContent,
      showcaseFooterContentDisplayType: showcaseFooterContentDisplayType ??
          this.showcaseFooterContentDisplayType,
      hasChildren: hasChildren ?? this.hasChildren,
      metaDescription: metaDescription ?? this.metaDescription,
      metaKeywords: metaKeywords ?? this.metaKeywords,
      isCombine: isCombine ?? this.isCombine,
      isSearchable: isSearchable ?? this.isSearchable,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
