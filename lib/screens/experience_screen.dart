import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/theme/colors.dart';
import '../core/theme/text_styles.dart';
import '../widgets/custom_appbar.dart';

// Importar componentes del catálogo
import '../widgets/catalog/spinners/circular_spinner.dart';
import '../widgets/catalog/spinners/text_spinner.dart';
import '../widgets/catalog/spinners/breathing_spinner.dart';
import '../widgets/catalog/spinners/linear_progress.dart';
import '../widgets/catalog/buttons/primary_button.dart';
import '../widgets/catalog/buttons/outline_button.dart';
import '../widgets/catalog/buttons/icon_text_button.dart';
import '../widgets/catalog/cards/info_card.dart';
import '../widgets/catalog/cards/feature_card.dart';
import '../widgets/catalog/inputs/text_field.dart';
import '../widgets/catalog/inputs/dropdown_field.dart';
import '../widgets/catalog/indicators/badges.dart';
import '../widgets/catalog/indicators/progress_indicators.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({Key? key}) : super(key: key);

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  int _selectedCategoryIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  final List<ComponentCategory> _categories = [
    ComponentCategory(
      title: 'Spinners & Loading',
      icon: Icons.refresh,
      description: 'Indicadores de carga y progreso',
    ),
    ComponentCategory(
      title: 'Buttons',
      icon: Icons.smart_button,
      description: 'Botones interactivos y acciones',
    ),
    ComponentCategory(
      title: 'Cards',
      icon: Icons.credit_card,
      description: 'Tarjetas de contenido',
    ),
    ComponentCategory(
      title: 'Input Fields',
      icon: Icons.text_fields,
      description: 'Campos de entrada y formularios',
    ),
    ComponentCategory(
      title: 'Indicators & Badges',
      icon: Icons.notification_important,
      description: 'Badges, etiquetas y estados',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppBar(
        title: 'Catálogo de Componentes',
        showBackButton: true,
      ),
      body: Column(
        children: [
          _buildCategorySelector(),
          Expanded(
            child: _buildComponentShowcase(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.all(16.w),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Buscar componentes...',
          prefixIcon: Icon(Icons.search, color: primaryColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: primaryColor, width: 2),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: (value) => setState(() {}),
      ),
    );
  }

  Widget _buildCategorySelector() {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Wrap(
        spacing: 12.w,
        runSpacing: 8.h,
        children: _categories.asMap().entries.map((entry) {
          final index = entry.key;
          final category = entry.value;
          final isSelected = index == _selectedCategoryIndex;

          return GestureDetector(
            onTap: () => setState(() => _selectedCategoryIndex = index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: isSelected ? primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: isSelected ? primaryColor : Colors.grey.shade300,
                  width: isSelected ? 2 : 1,
                ),
                boxShadow: isSelected ? [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.3),
                    offset: Offset(0, 2.h),
                    blurRadius: 6.r,
                  ),
                ] : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: Offset(0, 1.h),
                    blurRadius: 2.r,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    category.icon,
                    color: isSelected ? Colors.white : primaryColor,
                    size: 18.w,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    category.title,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildComponentShowcase() {
    switch (_selectedCategoryIndex) {
      case 0: // Spinners & Loading
        return _buildSpinnersShowcase();
      case 1: // Buttons
        return _buildButtonsShowcase();
      case 2: // Cards
        return _buildCardsShowcase();
      case 3: // Input Fields
        return _buildInputsShowcase();
      case 4: // Indicators & Badges
        return _buildIndicatorsShowcase();
      default:
        return _buildSpinnersShowcase();
    }
  }

  Widget _buildSpinnersShowcase() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Spinners Circulares'),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildComponentCard(
                'Basic Spinner',
                CircularSpinner(),
              ),
              _buildComponentCard(
                'With Background',
                CircularSpinner(showBackground: true),
              ),
              _buildComponentCard(
                'Custom Color',
                CircularSpinner(color: Colors.green),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          _buildSectionHeader('Spinner con Texto'),
          SizedBox(height: 16.h),
          Center(
            child: TextSpinner(
              text: 'Cargando componentes...',
              textBelow: false,
            ),
          ),
          SizedBox(height: 24.h),
          _buildSectionHeader('Breathing Spinner'),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BreathingSpinner(),
              BreathingSpinnerMultiple(),
              BreathingDots(),
            ],
          ),
          SizedBox(height: 24.h),
          _buildSectionHeader('Progreso Lineal'),
          SizedBox(height: 16.h),
          Column(
            children: [
              LinearProgress(value: 0.7, showPercentage: true),
              SizedBox(height: 16.h),
              LinearProgressWithLabel(
                value: 0.45,
                label: 'Descarga en progreso',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtonsShowcase() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Botones Primarios'),
          SizedBox(height: 16.h),
          Column(
            children: [
              PrimaryButton(text: 'Botón Primario', onPressed: () {}),
              SizedBox(height: 12.h),
              PrimaryButton(
                text: 'Con Icono',
                icon: Icons.star,
                onPressed: () {},
              ),
              SizedBox(height: 12.h),
              PrimaryButton(
                text: 'Cargando...',
                loading: true,
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 24.h),
          _buildSectionHeader('Botones Outline'),
          SizedBox(height: 16.h),
          Column(
            children: [
              OutlineButton(text: 'Botón Outline', onPressed: () {}),
              SizedBox(height: 12.h),
              OutlineButton(
                text: 'Con Icono',
                icon: Icons.download,
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 24.h),
          _buildSectionHeader('Botones con Icono y Texto'),
          SizedBox(height: 16.h),
          Wrap(
            spacing: 12.w,
            runSpacing: 12.h,
            children: [
              IconTextButton(
                text: 'Compartir',
                icon: Icons.share,
                onPressed: () {},
              ),
              IconTextButton(
                text: 'Favorito',
                icon: Icons.favorite,
                iconPosition: IconPosition.right,
                onPressed: () {},
              ),
              CircularIconButton(
                icon: Icons.add,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardsShowcase() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Tarjetas Informativas'),
          SizedBox(height: 16.h),
          InfoCard(
            title: 'Desarrollo Flutter',
            content: 'Creación de apps móviles multiplataforma con Flutter y Dart',
            icon: Icons.phone_android,
            onTap: () {},
          ),
          SizedBox(height: 16.h),
          _buildSectionHeader('Tarjetas de Estadísticas'),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: StatsCard(
                  number: '25+',
                  label: 'Proyectos',
                  icon: Icons.work,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: StatsCard(
                  number: '5K+',
                  label: 'Usuarios',
                  icon: Icons.people,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          _buildSectionHeader('Tarjetas con Gradiente'),
          SizedBox(height: 16.h),
          GradientCard(
            title: 'Premium Feature',
            subtitle: 'Accede a funciones avanzadas con nuestra suscripción premium',
            icon: Icons.star,
            onTap: () {},
          ),
          SizedBox(height: 16.h),
          _buildSectionHeader('Tarjetas de Características'),
          SizedBox(height: 16.h),
          FeatureCard(
            title: 'Diseño Responsivo',
            description: 'Interfaces que se adaptan a cualquier tamaño de pantalla',
            icon: Icons.devices,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildInputsShowcase() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Campos de Texto'),
          SizedBox(height: 16.h),
          CustomTextField(
            label: 'Nombre completo',
            hintText: 'Ingresa tu nombre',
            prefixIcon: Icons.person,
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            label: 'Contraseña',
            hintText: 'Ingresa tu contraseña',
            isPassword: true,
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            label: 'Comentarios',
            hintText: 'Escribe tus comentarios...',
            maxLines: 3,
          ),
          SizedBox(height: 24.h),
          _buildSectionHeader('Campo de Búsqueda'),
          _buildSearchBar(),
          SizedBox(height: 16.h),
          SearchField(hintText: 'Buscar productos...'),
          SizedBox(height: 24.h),
          _buildSectionHeader('Dropdowns'),
          SizedBox(height: 16.h),
          CustomDropdown<String>(
            label: 'País',
            hint: 'Selecciona tu país',
            items: [
              DropdownItem(value: 'gt', text: 'Guatemala', icon: Icons.flag),
              DropdownItem(value: 'mx', text: 'México', icon: Icons.flag),
              DropdownItem(value: 'cr', text: 'Costa Rica', icon: Icons.flag),
            ],
            onChanged: (value) {},
          ),
          SizedBox(height: 24.h),
          _buildSectionHeader('Campos Formateados'),
          SizedBox(height: 16.h),
          FormattedTextField(
            label: 'Email',
            fieldType: TextFieldType.email,
          ),
          SizedBox(height: 16.h),
          FormattedTextField(
            label: 'Teléfono',
            fieldType: TextFieldType.phone,
          ),
        ],
      ),
    );
  }

  Widget _buildIndicatorsShowcase() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Badges Básicos'),
          SizedBox(height: 16.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              CustomBadge(text: 'Nuevo', type: BadgeType.primary),
              CustomBadge(text: 'Éxito', type: BadgeType.success),
              CustomBadge(text: 'Advertencia', type: BadgeType.warning),
              CustomBadge(text: 'Error', type: BadgeType.error),
              CustomBadge(text: 'Info', type: BadgeType.info),
            ],
          ),
          SizedBox(height: 24.h),
          _buildSectionHeader('Badge Contador'),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CounterBadge(
                count: 5,
                child: Icon(Icons.notifications, size: 32.w),
              ),
              CounterBadge(
                count: 23,
                maxCount: 9,
                child: Icon(Icons.message, size: 32.w),
              ),
              CounterBadge(
                count: 0,
                showZero: true,
                child: Icon(Icons.shopping_cart, size: 32.w),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          _buildSectionHeader('Status Badges'),
          SizedBox(height: 16.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatusBadge(text: 'En línea', status: BadgeStatus.active, pulsing: true),
              SizedBox(height: 8.h),
              StatusBadge(text: 'Inactivo', status: BadgeStatus.inactive),
              SizedBox(height: 8.h),
              StatusBadge(text: 'Pendiente', status: BadgeStatus.pending),
            ],
          ),
          SizedBox(height: 24.h),
          _buildSectionHeader('Progreso por Steps'),
          SizedBox(height: 16.h),
          StepProgress(
            currentStep: 2,
            steps: [
              ProgressStep(title: 'Inicio', icon: Icons.start),
              ProgressStep(title: 'Proceso', icon: Icons.settings),
              ProgressStep(title: 'Revisión', icon: Icons.check_circle),
              ProgressStep(title: 'Finalizado', icon: Icons.done),
            ],
          ),
          SizedBox(height: 24.h),
          _buildSectionHeader('Skeleton Loading'),
          SizedBox(height: 16.h),
          SkeletonList(itemCount: 3),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: title2.copyWith(
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
    );
  }

  Widget _buildComponentCard(String title, Widget component) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          component,
          SizedBox(height: 8.h),
          Text(
            title,
            style: caption.copyWith(
              color: textSecondary,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class ComponentCategory {
  final String title;
  final IconData icon;
  final String description;

  ComponentCategory({
    required this.title,
    required this.icon,
    required this.description,
  });
}