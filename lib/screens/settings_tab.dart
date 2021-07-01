import 'package:flutter/material.dart';

class SettingsTab extends StatefulWidget {
  static const routeName ='/settings-tab';
  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(String title, String description, bool currentValue, Function updateValue){
    return SwitchListTile(title: Text(title), value: currentValue,
              subtitle: Text(description),
              onChanged: updateValue,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top:50),
              child: ListView(
                              children:[ Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: Text('Adjust your meal selection',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                )
            ),
                  _buildSwitchListTile('Gluten-free', 'Only include gluten-free meals', _glutenFree, (newValue){
                    setState(() {
                      _glutenFree=newValue;
                    });
                  }),
                  _buildSwitchListTile('Lactose-free', 'Only include Lactose-free meals', _lactoseFree, (newValue){
                    setState(() {
                      _lactoseFree=newValue;
                    });
                  }),
                  _buildSwitchListTile('Vegetarian', 'Only include vegetarian meals', _vegetarian, (newValue){
                    setState(() {
                      _vegetarian=newValue;
                    });
                  }),
                  _buildSwitchListTile('Vegan', 'Only include vegan meals', _vegan, (newValue){
                    setState(() {
                      _vegan=newValue;
                    });
                  })
                ]
            ),
                              ]
              )
            
         
    ),
    floatingActionButton: 
    OutlineButton(
      child: Text(
                            'Apply Filters',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900]),
                          ),
      onPressed: (){
        setState(() {
          
        });
      }
      )
    );
  }
}
