import 'package:flutter/material.dart';
import 'MenuTab/Burgers.dart';
import 'MenuTab/Drinks.dart';
import 'MenuTab/Meals.dart';
import '../blocs/menu_bloc_provider.dart';
import '../widgets/item_holder.dart';

class MenuTab extends StatelessWidget {
  // bloc.fetch menu

  Widget build(BuildContext context) {
    // Listen to menu stream
    final menuBloc = MenuBlocProvider.of(context);
    menuBloc.fetchMenu();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange[600],
          child: Icon(
            Icons.shopping_bag,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/cart');
          },
        ),
        appBar: AppBar(
          leading: Container(),
          backgroundColor: Colors.orange[600],
          title: Text('BurgerX'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.lunch_dining)),
              Tab(icon: Icon(Icons.local_bar)),
              Tab(icon: Icon(Icons.fastfood))
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildBurgerTab(menuBloc),
            buildDrinksrTab(menuBloc),
            buildMealsTab(menuBloc),
          ],
        ),
      ),
    );
  }

  Widget buildBurgerTab(MenuBloc menuBloc) {
    return StreamBuilder(
      stream: menuBloc.items,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Column(
                    children: [
                      ItemHolder(),
                      ItemHolder(),
                      ItemHolder(),
                      ItemHolder(),
                    ],
                  ),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          );
        }
        final items =
            snapshot.data.where((i) => i['category'] == 'burger').toList();

        return Burgers(items: items);
      },
    );
  }

  Widget buildDrinksrTab(MenuBloc menuBloc) {
    return StreamBuilder(
      stream: menuBloc.items,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Column(
                    children: [
                      ItemHolder(),
                      ItemHolder(),
                      ItemHolder(),
                      ItemHolder(),
                    ],
                  ),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          );
        }
        final items =
            snapshot.data.where((i) => i['category'] == 'drinks').toList();

        return Drinks(items: items);
      },
    );
  }

  Widget buildMealsTab(MenuBloc menuBloc) {
    return StreamBuilder(
      stream: menuBloc.items,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Column(
                    children: [
                      ItemHolder(),
                      ItemHolder(),
                      ItemHolder(),
                      ItemHolder(),
                    ],
                  ),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          );
        }
        final items =
            snapshot.data.where((i) => i['category'] == 'meals').toList();

        return Meals(items: items);
      },
    );
  }
}
