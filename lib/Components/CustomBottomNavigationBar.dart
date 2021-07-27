import 'package:flutter/material.dart';
class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  CustomBottomNavigationBar({
    this.defaultSelectedIndex=0,
    @required this.onChange,
  });

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedindex=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedindex=widget.defaultSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
        children: <Widget>[
          BuildNavBarItem(size,Icons.local_atm,0),
          BuildNavBarItem(size,Icons.contacts_outlined,1),
          BuildNavBarItem(size,Icons.chat_outlined,2),
          BuildNavBarItem(size,Icons.person_outlined,3),

        ]
    );
  }
  Widget BuildNavBarItem(Size size, IconData icon,int index) {
    return GestureDetector(
      onTap: (){
        widget.onChange(index);
        setState(() {
          _selectedindex=index;
        });
      },
      child: Container(
        height:60,
        width: size.width/4,
        decoration: index ==_selectedindex
        ?BoxDecoration(
          border: Border(
              top: BorderSide(width:4, color: Colors.yellow[800])
          ),
          color: Colors.white,
          // index == _selectedpageindex ?Colors.yellow[100]:Colors.white
        ): BoxDecoration(),
        child: Icon(
          icon,
          color: index ==_selectedindex?Colors.yellow[800]:Colors.grey,
        ),
      ),
    );
  }
}