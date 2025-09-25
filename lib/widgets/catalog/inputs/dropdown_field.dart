import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';

/// Dropdown personalizable con múltiples opciones de diseño
class CustomDropdown<T> extends StatelessWidget {
  /// Label del dropdown
  final String? label;

  /// Hint cuando no hay selección
  final String? hint;

  /// Valor seleccionado
  final T? value;

  /// Lista de opciones
  final List<DropdownItem<T>> items;

  /// Función callback cuando cambia la selección
  final Function(T?)? onChanged;

  /// Función de validación
  final String? Function(T?)? validator;

  /// Si está habilitado
  final bool enabled;

  /// Color del borde
  final Color? borderColor;

  /// Color de fondo
  final Color? fillColor;

  /// Icono prefijo
  final IconData? prefixIcon;

  /// Texto de error
  final String? errorText;

  /// Si es dropdown expandido (ocupa todo el ancho)
  final bool isExpanded;

  const CustomDropdown({
    Key? key,
    this.label,
    this.hint,
    this.value,
    required this.items,
    this.onChanged,
    this.validator,
    this.enabled = true,
    this.borderColor,
    this.fillColor,
    this.prefixIcon,
    this.errorText,
    this.isExpanded = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: subtitle2.copyWith(
              color: textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
        ],
        DropdownButtonFormField<T>(
          value: value,
          hint: hint != null
              ? Text(
                  hint!,
                  style: body1.copyWith(color: textSecondary),
                )
              : null,
          items: items.map((item) {
            return DropdownMenuItem<T>(
              value: item.value,
              child: Row(
                children: [
                  if (item.icon != null) ...[
                    Icon(
                      item.icon,
                      size: 20.w,
                      color: item.iconColor ?? primaryColor,
                    ),
                    SizedBox(width: 8.w),
                  ],
                  Expanded(
                    child: Text(
                      item.text,
                      style: body1.copyWith(color: textPrimary),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: enabled ? onChanged : null,
          validator: validator,
          isExpanded: isExpanded,
          decoration: InputDecoration(
            filled: true,
            fillColor: fillColor ?? (enabled ? Colors.white : Colors.grey.shade100),
            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon, color: primaryColor, size: 20.w)
                : null,
            errorText: errorText,
            border: _buildBorder(),
            enabledBorder: _buildBorder(),
            focusedBorder: _buildBorder(focused: true),
            errorBorder: _buildBorder(error: true),
            focusedErrorBorder: _buildBorder(error: true, focused: true),
            disabledBorder: _buildBorder(disabled: true),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
          ),
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: enabled ? primaryColor : Colors.grey.shade400,
          ),
        ),
      ],
    );
  }

  InputBorder _buildBorder({bool focused = false, bool error = false, bool disabled = false}) {
    Color borderColor;

    if (error) {
      borderColor = errorColor;
    } else if (focused) {
      borderColor = primaryColor;
    } else if (disabled) {
      borderColor = Colors.grey.shade300;
    } else {
      borderColor = this.borderColor ?? Colors.grey.shade300;
    }

    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(
        color: borderColor,
        width: focused ? 2 : 1,
      ),
    );
  }
}

/// Dropdown con búsqueda integrada
class SearchableDropdown<T> extends StatefulWidget {
  final String? label;
  final String? hint;
  final T? value;
  final List<DropdownItem<T>> items;
  final Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final bool enabled;
  final String searchHint;

  const SearchableDropdown({
    Key? key,
    this.label,
    this.hint,
    this.value,
    required this.items,
    this.onChanged,
    this.validator,
    this.enabled = true,
    this.searchHint = 'Buscar...',
  }) : super(key: key);

  @override
  State<SearchableDropdown<T>> createState() => _SearchableDropdownState<T>();
}

class _SearchableDropdownState<T> extends State<SearchableDropdown<T>> {
  late TextEditingController _searchController;
  List<DropdownItem<T>> _filteredItems = [];
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _filteredItems = widget.items;
    _searchController.addListener(_filterItems);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = widget.items
          .where((item) => item.text.toLowerCase().contains(query))
          .toList();
    });
  }

  void _toggleDropdown() {
    setState(() {
      _isOpen = !_isOpen;
      if (!_isOpen) {
        _searchController.clear();
        _filteredItems = widget.items;
      }
    });
  }

  void _selectItem(DropdownItem<T> item) {
    widget.onChanged?.call(item.value);
    _toggleDropdown();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: subtitle2.copyWith(
              color: textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
        ],
        GestureDetector(
          onTap: widget.enabled ? _toggleDropdown : null,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: widget.enabled ? Colors.white : Colors.grey.shade100,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.value != null
                        ? widget.items
                            .firstWhere((item) => item.value == widget.value)
                            .text
                        : (widget.hint ?? 'Seleccionar...'),
                    style: body1.copyWith(
                      color: widget.value != null ? textPrimary : textSecondary,
                    ),
                  ),
                ),
                Icon(
                  _isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: widget.enabled ? primaryColor : Colors.grey.shade400,
                ),
              ],
            ),
          ),
        ),
        if (_isOpen) ...[
          SizedBox(height: 4.h),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0, 4.h),
                  blurRadius: 8.r,
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: widget.searchHint,
                      hintStyle: body2.copyWith(color: textSecondary),
                      prefixIcon: Icon(Icons.search, size: 20.w),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
                    ),
                  ),
                ),
                Divider(height: 1, color: Colors.grey.shade300),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 200.h),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = _filteredItems[index];
                      return ListTile(
                        leading: item.icon != null
                            ? Icon(
                                item.icon,
                                color: item.iconColor ?? primaryColor,
                                size: 20.w,
                              )
                            : null,
                        title: Text(
                          item.text,
                          style: body1.copyWith(color: textPrimary),
                        ),
                        onTap: () => _selectItem(item),
                        selected: widget.value == item.value,
                        selectedTileColor: primaryColor.withOpacity(0.1),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

/// Dropdown con múltiple selección
class MultiSelectDropdown<T> extends StatefulWidget {
  final String? label;
  final String? hint;
  final List<T> selectedValues;
  final List<DropdownItem<T>> items;
  final Function(List<T>)? onChanged;
  final bool enabled;
  final int? maxSelection;

  const MultiSelectDropdown({
    Key? key,
    this.label,
    this.hint,
    required this.selectedValues,
    required this.items,
    this.onChanged,
    this.enabled = true,
    this.maxSelection,
  }) : super(key: key);

  @override
  State<MultiSelectDropdown<T>> createState() => _MultiSelectDropdownState<T>();
}

class _MultiSelectDropdownState<T> extends State<MultiSelectDropdown<T>> {
  bool _isOpen = false;

  void _toggleDropdown() {
    setState(() {
      _isOpen = !_isOpen;
    });
  }

  void _toggleItem(T value) {
    List<T> newSelected = List.from(widget.selectedValues);

    if (newSelected.contains(value)) {
      newSelected.remove(value);
    } else {
      if (widget.maxSelection == null ||
          newSelected.length < widget.maxSelection!) {
        newSelected.add(value);
      }
    }

    widget.onChanged?.call(newSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: subtitle2.copyWith(
              color: textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
        ],
        GestureDetector(
          onTap: widget.enabled ? _toggleDropdown : null,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: widget.enabled ? Colors.white : Colors.grey.shade100,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: widget.selectedValues.isNotEmpty
                      ? Wrap(
                          spacing: 4.w,
                          runSpacing: 4.h,
                          children: widget.selectedValues.map((value) {
                            final item = widget.items
                                .firstWhere((item) => item.value == value);
                            return Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 2.h,
                              ),
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Text(
                                item.text,
                                style: caption.copyWith(color: primaryColor),
                              ),
                            );
                          }).toList(),
                        )
                      : Text(
                          widget.hint ?? 'Seleccionar...',
                          style: body1.copyWith(color: textSecondary),
                        ),
                ),
                Icon(
                  _isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: widget.enabled ? primaryColor : Colors.grey.shade400,
                ),
              ],
            ),
          ),
        ),
        if (_isOpen) ...[
          SizedBox(height: 4.h),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0, 4.h),
                  blurRadius: 8.r,
                ),
              ],
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 200.h),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  final item = widget.items[index];
                  final isSelected = widget.selectedValues.contains(item.value);

                  return CheckboxListTile(
                    value: isSelected,
                    onChanged: widget.enabled ? (_) => _toggleItem(item.value) : null,
                    title: Text(
                      item.text,
                      style: body1.copyWith(color: textPrimary),
                    ),
                    secondary: item.icon != null
                        ? Icon(
                            item.icon,
                            color: item.iconColor ?? primaryColor,
                            size: 20.w,
                          )
                        : null,
                    activeColor: primaryColor,
                    controlAffinity: ListTileControlAffinity.leading,
                  );
                },
              ),
            ),
          ),
        ],
      ],
    );
  }
}

/// Modelo para elementos del dropdown
class DropdownItem<T> {
  final T value;
  final String text;
  final IconData? icon;
  final Color? iconColor;

  const DropdownItem({
    required this.value,
    required this.text,
    this.icon,
    this.iconColor,
  });
}