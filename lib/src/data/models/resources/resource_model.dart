
// class ResourceModel<T extends IResourceModel> implements IResourceModel {
//   final T model;
//   ResourceModel({
//     @required this.model,
//   });

//   factory ResourceModel.forMenus(MenuModel model) {
//     return ResourceModel<T>(model: model);
//   }

//   @override
//   Map<String, Object> toFirebaseJson() {
//     return model.toFirebaseJson();
//   }
// }

// class One implements IResourceModel {
//   final String name;

//   One({this.name});

//   @override
//   Map<String, Object> toFirebaseJson() {
//     return {
//       'name': name,
//     };
//   }
// }

// void main() {
//   final one = ResourceModel<One>(model: One(name: 'hi'));
//   print(one.model.name);
//   print(one.toFirebaseJson());
// }
