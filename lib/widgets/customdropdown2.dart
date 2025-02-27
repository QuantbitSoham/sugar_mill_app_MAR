import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton2 extends StatelessWidget {
  final List<String> items;
  final String? value;
  final String hintText;
  final String labelText;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final InputDecoration? searchInputDecoration;
  final Widget? searchInnerWidget;
  final double? searchInnerWidgetHeight;
  final TextEditingController? searchController;
  final IconData? prefixIcon;

  const CustomDropdownButton2({
    super.key,
    required this.items,
    required this.hintText,
    required this.onChanged,
    this.value,
    this.searchInputDecoration,
    this.searchInnerWidget,
    this.searchInnerWidgetHeight,
    this.searchController,
    this.prefixIcon,
    required this.labelText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      popupProps: PopupProps.bottomSheet(
        fit: FlexFit.tight,
        showSearchBox: true,
        showSelectedItems: true,
        searchFieldProps: TextFieldProps(
          controller: searchController,
          decoration: searchInputDecoration ??
              InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'Search',
                hintText: 'Search here ..',
                prefixIcon: const Icon(Icons.search),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(color: Colors.grey, width: 2),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(color: Colors.black45, width: 2),
                ),
              ),
        ),
        itemBuilder: (BuildContext context, String? item, bool isSelected) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1.0,
                        ),
                        color: isSelected ? Colors.blueAccent : Colors.transparent,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: ListTile(
                      title: Text(
                        item ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: isSelected ? Colors.blue : Colors.black,
                        ),
                      ),
                      selected: isSelected,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                color: Colors.black45,
              ),
            ],
          );
        },
      ),
      items: items,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          labelText: labelText,
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12.0), // Adjusted padding to remove extra space
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(
                  color: Colors.blue, width: 2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(
                  color: Colors.grey, width: 2)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(
                  color: Colors.black45, width: 2)),
        ),
      ),
      onChanged: onChanged,
      selectedItem: value,
      validator: validator,
    );
  }
}
