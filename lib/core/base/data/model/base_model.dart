import '../../domain/base_entity.dart';

/**
 * This class is the base model for all models in the application.
 * It extends the BaseEntity class, because all models should have properties.
 * BaseModel exists only to make it easier to create models and to show the
 * relationship between models and entities.
 * */
class BaseModel extends BaseEntity {
  BaseModel(super.properties);
}
