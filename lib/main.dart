import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Item Selection List',
       theme: ThemeData(
        brightness: Brightness.dark, 
      ),
      home: ItemSelectionScreen(),
    );
  }
}
class ItemSelectionScreen extends StatefulWidget {
  const ItemSelectionScreen({super.key});

  @override
  State<ItemSelectionScreen> createState() => _ItemSelectionScreenState();
}

class _ItemSelectionScreenState extends State<ItemSelectionScreen> {
  List<String>Items = List.generate(15,(index) =>'Item ${index+1}');
  List<bool>SelectedItems =List.generate(15, (index) => false);
  int get selectedCount {
    return SelectedItems.where((isSelected) => isSelected).length;
  }
   void _onItemSelected(bool? value, int index) {
    setState(() {
      SelectedItems[index] = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Item Selection List")),
      ),
      body: Column(
        children: [
          Text('Selected Items : $selectedCount'),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                  itemCount: Items.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 50,
                       child: CheckboxListTile(
                        title: Text(Items[index]),
                        value: SelectedItems[index],
                        onChanged: (bool? value) {
                          _onItemSelected(value, index);
                        },
                      ),
                    );
                  },
                ),
          ),
        ],
        
      ),
    );
  }
}

