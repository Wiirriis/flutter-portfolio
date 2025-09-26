import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import '../core/theme/colors.dart';
import '../core/theme/text_styles.dart';
import '../widgets/custom_appbar.dart';

class CVScreen extends StatefulWidget {
  const CVScreen({Key? key}) : super(key: key);

  @override
  State<CVScreen> createState() => _CVScreenState();
}

class _CVScreenState extends State<CVScreen> {
  String? localPath;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _loadPDF();
  }

  Future<void> _loadPDF() async {
    try {
      if (kIsWeb) {
        // Para web, mostraremos las imágenes del CV
        setState(() {
          isLoading = false;
        });
        return;
      }

      final byteData = await rootBundle.load('assets/cv_cesar_polanco.pdf');
      final buffer = byteData.buffer;
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      var filePath = '$tempPath/cv_cesar_polanco.pdf';

      await File(filePath).writeAsBytes(
        buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes)
      );

      setState(() {
        localPath = filePath;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Error al cargar el PDF: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppBar(
        title: 'CV/Resume',
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (errorMessage != null) {
      return _buildErrorWidget();
    }

    if (kIsWeb) {
      return _buildWebView();
    }

    return _buildPDFView();
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64.w,
              color: Colors.red,
            ),
            SizedBox(height: 16.h),
            Text(
              'Error',
              style: title2,
            ),
            SizedBox(height: 8.h),
            Text(
              errorMessage!,
              style: body1,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildWebView() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.w),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 800,
          ),
          child: Column(
            children: [
              // Página 1 del CV
              _buildCVPageImage('assets/cv_images/cv1.png', 1),
              SizedBox(height: 20.h),
              // Página 2 del CV
              _buildCVPageImage('assets/cv_images/cv2.png', 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCVPageImage(String imagePath, int pageNumber) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 4.h),
            blurRadius: 12.r,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Image.asset(
          imagePath,
          width: double.infinity,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            print('Error loading image: $imagePath');
            print('Error: $error');
            return Container(
              height: 600.h,
              color: cardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 48.w,
                    color: Colors.red,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Error al cargar página $pageNumber',
                    style: body1,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Ruta: $imagePath',
                    style: TextStyle(fontSize: 10.sp),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPDFView() {
    return PDFView(
      filePath: localPath!,
      enableSwipe: true,
      swipeHorizontal: false,
      autoSpacing: false,
      pageFling: false,
      onRender: (pages) {
        // PDF rendered successfully
      },
      onError: (error) {
        setState(() {
          errorMessage = 'Error al mostrar PDF: $error';
        });
      },
      onPageError: (page, error) {
        setState(() {
          errorMessage = 'Error en página $page: $error';
        });
      },
    );
  }

}