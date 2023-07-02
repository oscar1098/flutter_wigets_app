import 'package:flutter/material.dart';

class UiControlScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView();

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UIControlsViewState extends State<_UIControlsView> {

  bool isDeveloper = true;
  Transportation selectedtransportation = Transportation.car;
  bool wnatsBreakfast = false;
  bool wnatsLunch = false;
  bool wnatsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            title: const Text('Developer Mode'),
            subtitle: const Text('Controles adicionales'),
            value: isDeveloper,
            onChanged: (value) => setState(() {
                  isDeveloper = !isDeveloper;
                })),

        ExpansionTile(
          title: const Text('Vehiculo de transporte'),
          subtitle: Text('$selectedtransportation'),
          children: [
            RadioListTile(
              title: const Text('By car'),
              subtitle: const Text('Viaja por carro'),
              value: Transportation.car,
              groupValue: selectedtransportation,
              onChanged: (value) => setState(() {
                selectedtransportation = Transportation.car;
              }),
            ),
            RadioListTile(
              title: const Text('By Boat'),
              subtitle: const Text('Viaja por barco'),
              value: Transportation.boat,
              groupValue: selectedtransportation,
              onChanged: (value) => setState(() {
                selectedtransportation = Transportation.boat;
              }),
            ),
            RadioListTile(
              title: const Text('By plane'),
              subtitle: const Text('Viaja por avion'),
              value: Transportation.plane,
              groupValue: selectedtransportation,
              onChanged: (value) => setState(() {
                selectedtransportation = Transportation.plane;
              }),
            ),
            RadioListTile(
              title: const Text('By Submarine'),
              subtitle: const Text('Viaja por submarino'),
              value: Transportation.submarine,
              groupValue: selectedtransportation,
              onChanged: (value) => setState(() {
                selectedtransportation = Transportation.submarine;
              }),
            ),
          ],
        ),

        CheckboxListTile(
          title: const Text('¿Desayuno?'),
          value: wnatsBreakfast, 
          onChanged: (value) => setState(() {
            wnatsBreakfast = !wnatsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('¿Almuerzo?'),
          value: wnatsLunch, 
          onChanged: (value) => setState(() {
            wnatsLunch = !wnatsLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('¿Cenar?'),
          value: wnatsDinner, 
          onChanged: (value) => setState(() {
            wnatsDinner = !wnatsDinner;
          }),
        ),
        
      ],
    );
  }
}
