import 'package:dental_proj/Widgets/teeth_down_data_widget.dart';
import 'package:dental_proj/Widgets/teeth_up_data_widget.dart';
import 'package:flutter/material.dart';


class TheethScreen extends StatelessWidget {
  const TheethScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Image Click Example'),
        ),
        body: Center(
          child: Stack(
            children: [
              TeethUpDataWidget(),
              TeethDownDataWidget(),
            ],
          ),
        ));
  }
}
