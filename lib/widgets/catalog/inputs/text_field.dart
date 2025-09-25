import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';

/// Campo de texto personalizable con múltiples variantes
/// Extiende la funcionalidad del TextField estándar
class CustomTextField extends StatefulWidget {
  /// Texto del label
  final String? label;

  /// Texto del hint
  final String? hintText;

  /// Controlador del texto
  final TextEditingController? controller;

  /// Función de validación
  final String? Function(String?)? validator;

  /// Función callback cuando cambia el texto
  final Function(String)? onChanged;

  /// Función callback cuando se completa la edición
  final Function(String)? onSubmitted;

  /// Tipo de teclado
  final TextInputType keyboardType;

  /// Acción del teclado
  final TextInputAction textInputAction;

  /// Si es campo de contraseña
  final bool isPassword;

  /// Si está habilitado
  final bool enabled;

  /// Número máximo de líneas
  final int maxLines;

  /// Icono prefijo
  final IconData? prefixIcon;

  /// Widget prefijo personalizado
  final Widget? prefix;

  /// Icono sufijo
  final IconData? suffixIcon;

  /// Widget sufijo personalizado
  final Widget? suffix;

  /// Función callback para el icono sufijo
  final VoidCallback? onSuffixPressed;

  /// Color del borde
  final Color? borderColor;

  /// Color de fondo
  final Color? fillColor;

  /// Texto de error
  final String? errorText;

  /// Si se muestra el contador de caracteres
  final bool showCharacterCount;

  /// Longitud máxima del texto
  final int? maxLength;

  const CustomTextField({
    Key? key,
    this.label,
    this.hintText,
    this.controller,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.isPassword = false,
    this.enabled = true,
    this.maxLines = 1,
    this.prefixIcon,
    this.prefix,
    this.suffixIcon,
    this.suffix,
    this.onSuffixPressed,
    this.borderColor,
    this.fillColor,
    this.errorText,
    this.showCharacterCount = false,
    this.maxLength,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _obscureText = widget.isPassword;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
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
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmitted,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          obscureText: widget.isPassword ? _obscureText : false,
          enabled: widget.enabled,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          focusNode: _focusNode,
          style: body1.copyWith(color: textPrimary),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: body1.copyWith(color: textSecondary),
            errorText: widget.errorText,
            filled: true,
            fillColor: widget.fillColor ?? (widget.enabled ? Colors.white : Colors.grey.shade100),
            prefixIcon: widget.prefix ?? (widget.prefixIcon != null
                ? Icon(widget.prefixIcon, color: primaryColor, size: 20.w)
                : null),
            suffixIcon: _buildSuffixIcon(),
            border: _buildBorder(),
            enabledBorder: _buildBorder(),
            focusedBorder: _buildBorder(focused: true),
            errorBorder: _buildBorder(error: true),
            focusedErrorBorder: _buildBorder(error: true, focused: true),
            disabledBorder: _buildBorder(disabled: true),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: widget.maxLines > 1 ? 16.h : 12.h,
            ),
            counterText: widget.showCharacterCount ? null : '',
          ),
        ),
      ],
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.isPassword) {
      return IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          color: textSecondary,
          size: 20.w,
        ),
        onPressed: () => setState(() => _obscureText = !_obscureText),
      );
    }

    if (widget.suffix != null) return widget.suffix;

    if (widget.suffixIcon != null) {
      return IconButton(
        icon: Icon(
          widget.suffixIcon,
          color: primaryColor,
          size: 20.w,
        ),
        onPressed: widget.onSuffixPressed,
      );
    }

    return null;
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
      borderColor = widget.borderColor ?? Colors.grey.shade300;
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

/// Campo de búsqueda con icono y funcionalidad de clear
class SearchField extends StatefulWidget {
  final String? hintText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextEditingController? controller;
  final bool enabled;
  final Color? fillColor;

  const SearchField({
    Key? key,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.controller,
    this.enabled = true,
    this.fillColor,
  }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _hasText = _controller.text.isNotEmpty;
    });
  }

  void _clearText() {
    _controller.clear();
    widget.onChanged?.call('');
    setState(() {
      _hasText = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: widget.fillColor ?? Colors.grey.shade100,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: TextField(
        controller: _controller,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        enabled: widget.enabled,
        style: body1.copyWith(color: textPrimary),
        decoration: InputDecoration(
          hintText: widget.hintText ?? 'Buscar...',
          hintStyle: body1.copyWith(color: textSecondary),
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: textSecondary,
            size: 20.w,
          ),
          suffixIcon: _hasText
              ? IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: textSecondary,
                    size: 20.w,
                  ),
                  onPressed: _clearText,
                )
              : null,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
        ),
      ),
    );
  }
}

/// Campo de texto tipo chip con tags
class TagTextField extends StatefulWidget {
  final List<String> tags;
  final Function(List<String>)? onTagsChanged;
  final String? hintText;
  final int? maxTags;
  final Color? tagColor;

  const TagTextField({
    Key? key,
    required this.tags,
    this.onTagsChanged,
    this.hintText,
    this.maxTags,
    this.tagColor,
  }) : super(key: key);

  @override
  State<TagTextField> createState() => _TagTextFieldState();
}

class _TagTextFieldState extends State<TagTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _addTag(String tag) {
    if (tag.trim().isEmpty) return;
    if (widget.tags.contains(tag.trim())) return;
    if (widget.maxTags != null && widget.tags.length >= widget.maxTags!) return;

    final newTags = List<String>.from(widget.tags)..add(tag.trim());
    widget.onTagsChanged?.call(newTags);
    _controller.clear();
  }

  void _removeTag(int index) {
    final newTags = List<String>.from(widget.tags)..removeAt(index);
    widget.onTagsChanged?.call(newTags);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 48.h),
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          if (widget.tags.isNotEmpty) ...[
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: widget.tags.asMap().entries.map((entry) {
                return _buildTagChip(entry.key, entry.value);
              }).toList(),
            ),
            SizedBox(height: 8.h),
          ],
          TextField(
            controller: _controller,
            focusNode: _focusNode,
            onSubmitted: _addTag,
            decoration: InputDecoration(
              hintText: widget.hintText ?? 'Escribir y presionar Enter...',
              hintStyle: body2.copyWith(color: textSecondary),
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTagChip(int index, String tag) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: (widget.tagColor ?? primaryColor).withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            tag,
            style: caption.copyWith(
              color: widget.tagColor ?? primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 4.w),
          InkWell(
            onTap: () => _removeTag(index),
            child: Icon(
              Icons.close,
              size: 14.w,
              color: widget.tagColor ?? primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

/// Campo de texto con formato personalizado (teléfono, fecha, etc.)
class FormattedTextField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final TextFieldType fieldType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const FormattedTextField({
    Key? key,
    this.label,
    this.hintText,
    this.controller,
    required this.fieldType,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: label,
      hintText: hintText ?? _getHintForType(),
      controller: controller,
      keyboardType: _getKeyboardType(),
      prefixIcon: _getPrefixIcon(),
      validator: validator ?? _getValidatorForType(),
      onChanged: onChanged,
    );
  }

  String _getHintForType() {
    switch (fieldType) {
      case TextFieldType.email:
        return 'ejemplo@correo.com';
      case TextFieldType.phone:
        return '+1 234 567 890';
      case TextFieldType.url:
        return 'https://ejemplo.com';
      case TextFieldType.number:
        return '123';
    }
  }

  TextInputType _getKeyboardType() {
    switch (fieldType) {
      case TextFieldType.email:
        return TextInputType.emailAddress;
      case TextFieldType.phone:
        return TextInputType.phone;
      case TextFieldType.url:
        return TextInputType.url;
      case TextFieldType.number:
        return TextInputType.number;
    }
  }

  IconData _getPrefixIcon() {
    switch (fieldType) {
      case TextFieldType.email:
        return Icons.email_outlined;
      case TextFieldType.phone:
        return Icons.phone_outlined;
      case TextFieldType.url:
        return Icons.link_outlined;
      case TextFieldType.number:
        return Icons.numbers_outlined;
    }
  }

  String? Function(String?)? _getValidatorForType() {
    switch (fieldType) {
      case TextFieldType.email:
        return (value) {
          if (value == null || value.isEmpty) return 'Ingrese un email';
          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
            return 'Ingrese un email válido';
          }
          return null;
        };
      case TextFieldType.phone:
        return (value) {
          if (value == null || value.isEmpty) return 'Ingrese un teléfono';
          if (value.length < 10) return 'Teléfono debe tener al menos 10 dígitos';
          return null;
        };
      case TextFieldType.url:
        return (value) {
          if (value == null || value.isEmpty) return 'Ingrese una URL';
          final uri = Uri.tryParse(value);
          if (uri == null || !uri.hasAbsolutePath) {
            return 'Ingrese una URL válida';
          }
          return null;
        };
      case TextFieldType.number:
        return (value) {
          if (value == null || value.isEmpty) return 'Ingrese un número';
          if (double.tryParse(value) == null) return 'Ingrese un número válido';
          return null;
        };
    }
  }
}

/// Enums para tipos de campo
enum TextFieldType { email, phone, url, number }