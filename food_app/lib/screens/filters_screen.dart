import 'package:flutter/material.dart';
import 'package:food_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filter';

  final Function saveFilters;
  final Map<String, bool> currentFilter;

  FiltersScreen(this.saveFilters, this.currentFilter);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool gluten_free = false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactose_free = false;

  Widget buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  initState() {
    super.initState();
    gluten_free = widget.currentFilter['gluten'];
    lactose_free = widget.currentFilter['lactose'];
    vegan = widget.currentFilter['vegan'];
    vegetarian = widget.currentFilter['vegetarian'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filter'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                Map<String, bool> _filters = {
                  'gluten': gluten_free,
                  'lactose': lactose_free,
                  'vegan': vegan,
                  'vegetarian': vegetarian
                };
                widget.saveFilters(_filters);
              },
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust Meal selection',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                buildSwitchListTile(
                    'Gluten-free', 'Only include gluten free', gluten_free,
                    (updateValue) {
                  setState(() {
                    gluten_free = updateValue;
                  });
                }),
                buildSwitchListTile(
                    'Lactose-free', 'Only include Lactose free', lactose_free,
                    (updateValue) {
                  setState(() {
                    lactose_free = updateValue;
                  });
                }),
                buildSwitchListTile(
                    'Vegetarian', 'Only include vegetarian free', vegetarian,
                    (updateValue) {
                  setState(() {
                    vegetarian = updateValue;
                  });
                }),
                buildSwitchListTile('Vegan', 'Only include vegan free', vegan,
                    (updateValue) {
                  setState(() {
                    vegan = updateValue;
                  });
                })
              ],
            ))
          ],
        ));
  }
}
