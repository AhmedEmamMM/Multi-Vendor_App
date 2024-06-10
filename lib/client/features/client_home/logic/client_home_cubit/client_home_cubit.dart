import 'package:four_apps_in_one_multi_user_app/auth_gate/imports/imports.dart';
import 'package:four_apps_in_one_multi_user_app/client/features/client_home/data/models/category_model.dart';
import 'package:four_apps_in_one_multi_user_app/global_core/helpers/helpers.dart';
import '../../data/models/restauran_model.dart';

part 'client_home_state.dart';

class ClientHomeCubit extends Cubit<ClientHomeState> {
  final ClientHomeRepo clientHomeRepo;
  ClientHomeCubit(this.clientHomeRepo) : super(ClientHomeInitial());

  void getRestaurantsAndCategoires() async {
    emit(GetAllRestaurantsAndCategoriesLoading());
    try {
      // get all restrant from the repo
      List<Restaurant> restaurants = await clientHomeRepo.getAllRestaurants();
      // get all categories from the repo
      List<Category> categories = await clientHomeRepo.getAllCategories();
      // in the list above the more Category is not the last item so i want to make it last item in the list
      // first i will get it by find it 
      Category moreMategory = Helpers.findCategoryByName(categories, "More");
      // then remove is from the list 
      categories.remove(moreMategory);
      // then add the more category to the list so it will it be the last item
      categories.add(moreMategory);
      emit(GetAllRestaurantsAndCategoriesSuccess(restaurants, categories));
    } catch (e) {
      emit(GetAllRestaurantsAndCategoriesFaliuer(e.toString()));
    }
  }
}
