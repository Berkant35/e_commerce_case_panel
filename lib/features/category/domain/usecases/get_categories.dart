import 'package:ECommercePanel/features/category/domain/repositories/category_repository.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../entities/category_entity.dart';

class GetCategories extends BaseUseCase<Future<List<CategoryEntity>>, void> {
  final CategoryRepository repository;

  GetCategories(this.repository);

  @override
  Future<Future<List<CategoryEntity>>> call(void params) async {
    return repository.getCategories();
  }
}
