import '../data/models/additvies_model.dart';
import '../../../../global_core/constants/constants.dart';
import '../../../../global_core/helpers/helpers.dart';
import '../../../../auth_gate/imports/imports.dart';
import '../../../../global_core/providers/cart_provider.dart';
import '../data/models/food_model.dart';
import 'widgets/custom_icon_button.dart';

class FoodDetails extends StatefulWidget {
  final Food food;
  final Map<Additives, bool> selectedAdditives = {};
  FoodDetails({super.key, required this.food}) {
    //initializa Selected Addons to be false
    for (Additives additive in food.additives!) {
      selectedAdditives[additive] = false;
    }
  }

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  void addToCart(Food food, Map<Additives, bool> selectedAddons) {
    // close the current food page to go back to menu
    Navigator.pop(context);

    // format the seltected addons
    List<Additives> currentlySelectedAdditives = [];
    for (Additives additive in widget.food.additives!) {
      if (widget.selectedAdditives[additive] == true) {
        currentlySelectedAdditives.add(additive);
      }
    }
    // add to cart
    context.read<CartProvider>().addToCart(food, currentlySelectedAdditives);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: heightOfTheScreen(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: heightOfTheScreen(context) * 0.41,
                    width: widthOfTheScreen(context),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade500,
                        borderRadius: BorderRadius.only(
                          bottomLeft:
                              Radius.circular(widthOfTheScreen(context) * 0.28),
                          bottomRight:
                              Radius.circular(widthOfTheScreen(context) * 0.28),
                        )),
                  ),
                  Positioned(
                    top: height * 0.143,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.0250),
                      padding: const EdgeInsets.all(3),
                      height: height * 0.25,
                      width: width * 0.95,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Container(
                        height: height * 0.25,
                        width: width * 0.90,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    widget.food.imageUrl.toString()),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50.0, left: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIconButton(
                          iconData: Icons.arrow_back,
                          onTap: () => Navigator.pop(context),
                        ),
                        CustomIconButton(
                          iconData: Icons.favorite_outline,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // food title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.food.name!,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$ ${widget.food.price}',
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                    // rating and number of orders
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                              child: Text(
                            '⭐ ${widget.food.rating}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )),
                        ),
                        25.horizontalSpace,
                        Container(
                          height: 35,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                              child: Text(
                            '+ 300   orderd ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )),
                        ),
                      ],
                    ),
                    15.verticalSpace,
                    // details heading
                    const Text(
                      'Details',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: kSecondary,
                      ),
                    ),
                    // food discribtion
                    Text(
                      widget.food.description.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    12.verticalSpace,
                    const Divider(color: kSecondary),
                    12.verticalSpace,
                    const Text(
                      "Additives",
                      style: TextStyle(
                        color: kSecondary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    20.verticalSpace,
                    //additives
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: kSecondary, width: 2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: widget.food.additives!.length,
                        itemBuilder: (context, index) {
                          Additives additive = widget.food.additives![index];
                          return CheckboxListTile(
                              title: Text(additive.title!),
                              subtitle: Text(
                                "\$ ${additive.price}",
                                style: const TextStyle(color: Colors.white),
                              ),
                              value: widget.selectedAdditives[additive],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAdditives[additive] = value!;
                                });
                              });
                        },
                      ),
                    ),
                    25.verticalSpace,
                    // add to the cart button
                    MyButton(
                      backGroudcolor: Colors.grey.shade300,
                      child: const Text(
                        'Add to cart',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () =>
                          addToCart(widget.food, widget.selectedAdditives),
                    ),
                  ],
                ),
              ),
              50.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
