import 'package:beems/constants.dart';
import 'package:flutter/material.dart';

class MenuRow extends StatefulWidget {
  final Function(String,String) updateScreen;

  MenuRow(this.updateScreen);

  @override
  _MenuRowState createState() => _MenuRowState();
}

class _MenuRowState extends State<MenuRow> {
  OverlayEntry? overlayEntry;
  String? activeMenu;
  List<String> insurance = [
    "Car Insurance",
    "Bike Insurance",
    "Health Insurance",
    Constants.commercialVehicle,
    Constants.groupHealthInsurance
  ];
  List<String> taxSavings = ["Term Insurance", "Health Insurance"];

  void showDropdown(BuildContext context, Offset offset, String menuTitle,
      List<String> items) {
    if (activeMenu == menuTitle) return;

    hideDropdown();
    activeMenu = menuTitle;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + 20,
        child: MouseRegion(
          onExit: (_) => hideDropdown(),
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: items
                    .map((item) => GestureDetector(
                          onTap: () {
                            if (item == "Car Insurance") {
                              widget.updateScreen("insuranceRequest","car");
                            }else if(item == "Bike Insurance"){
                              widget.updateScreen("insuranceRequest","bike");
                            }else if(item == "Health Insurance"){
                              widget.updateScreen("insuranceRequest","health");
                            }else if(item == Constants.termInsurance){
                              widget.updateScreen("insuranceRequest","term");
                            }else if(item == Constants.commercialVehicle){
                              widget.updateScreen("${Constants.commercialVehicle}","${Constants.commercialVehicle}");
                            }else if(item == Constants.groupHealthInsurance){
                              widget.updateScreen("${Constants.groupHealthInsurance}","${Constants.groupHealthInsurance}");
                            }

                            hideDropdown();
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            child: Text(item, style: TextStyle(fontSize: 16)),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry!);
  }

  void hideDropdown() {
    overlayEntry?.remove();
    overlayEntry = null;
    activeMenu = null;
  }

  Widget buildMenuItem(String title, List<String> dropdownItems) {
    return MouseRegion(
      onEnter: (event) {
        if (dropdownItems.isNotEmpty) {
          showDropdown(context, event.position, title, dropdownItems);
        } else {
          hideDropdown();
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                if (title.toLowerCase() == Constants.home.toLowerCase()) {
                  widget.updateScreen(Constants.home,'');
                }else if (title.toLowerCase() == Constants.contact.toLowerCase()){
                  widget.updateScreen(Constants.contact,'');
                }else if (title.toLowerCase() == Constants.aboutUS.toLowerCase()){
                  widget.updateScreen(Constants.aboutUS,'');
                }
              },
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            dropdownItems.isNotEmpty
                ? const Icon(Icons.arrow_drop_down_outlined,
                    color: Colors.white)
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildMenuItem("Home", []),
        buildMenuItem("Insurance", insurance),
        buildMenuItem("Tax Saving", taxSavings),
        buildMenuItem("About us", []),
        buildMenuItem("Contact", []),
      ],
    );
  }
}
