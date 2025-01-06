import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/models/visitor.dart';
import '../providers/visitor_form_provider.dart';
import '../widgets/visitor_additional_details_form.dart';

class VisitorRegistrationForm extends ConsumerStatefulWidget {
  final void Function(Visitor visitor)? onSubmitted;

  const VisitorRegistrationForm({
    super.key,
    this.onSubmitted,
  });

  @override
  ConsumerState<VisitorRegistrationForm> createState() =>
      _VisitorRegistrationFormState();
}

class _VisitorRegistrationFormState
    extends ConsumerState<VisitorRegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _contactController = TextEditingController();
  final _vehicleController = TextEditingController();
  final _purposeController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _contactController.dispose();
    _vehicleController.dispose();
    _purposeController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter visitor name';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  String? _validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter address';
    }
    return null;
  }

  String? _validateContact(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter contact number';
    }
    if (value.length != 10) {
      return 'Contact number must be 10 digits';
    }
    return null;
  }

  String? _validatePurpose(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter purpose of visit';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter email address';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      caseSensitive: false,
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    if (value.length > 254) {
      return 'Email address is too long';
    }
    if (value.contains('..')) {
      return 'Invalid email format';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final visitor = Visitor(
        name: _nameController.text,
        address: _addressController.text,
        contactNumber: _contactController.text,
        email: _emailController.text,
        vehicleNumber:
            _vehicleController.text.isEmpty ? null : _vehicleController.text,
        purposeOfVisit: _purposeController.text,
        numberOfVisitors: 1,
        whomToMeet: '',
        department: '',
        documentType: '',
        entryTime: DateTime.now(),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('Additional Details'),
            ),
            body: SingleChildScrollView(
              child: VisitorAdditionalDetailsForm(
                visitor: visitor,
                onSubmitted: (updatedVisitor) {
                  ref
                      .read(visitorFormProvider.notifier)
                      .submitVisitor(updatedVisitor);
                  widget.onSubmitted?.call(updatedVisitor);
                },
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Visitor Registration',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Please fill in the visitor details',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 24),
            _buildInputField(
              controller: _nameController,
              label: 'Full Name',
              prefixIcon: Icons.person_outline,
              validator: _validateName,
            ),
            const SizedBox(height: 16),
            _buildInputField(
              controller: _addressController,
              label: 'Address',
              prefixIcon: Icons.location_on_outlined,
              validator: _validateAddress,
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            _buildInputField(
              controller: _contactController,
              label: 'Contact Number',
              prefixIcon: Icons.phone_outlined,
              validator: _validateContact,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
            ),
            const SizedBox(height: 16),
            _buildInputField(
              controller: _emailController,
              label: 'Email Address',
              prefixIcon: Icons.email_outlined,
              validator: _validateEmail,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              hintText: 'example@email.com',
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                labelText: 'Email Address',
                hintText: 'example@email.com',
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: AppTheme.primaryColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: AppTheme.cardBackgroundColor,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                helperText: 'Enter your valid email address',
                helperStyle: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
                suffixIcon: _emailController.text.isNotEmpty
                    ? Icon(
                        _validateEmail(_emailController.text) == null
                            ? Icons.check_circle
                            : Icons.error,
                        color: _validateEmail(_emailController.text) == null
                            ? Colors.green
                            : Colors.red,
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 16),
            _buildInputField(
              controller: _vehicleController,
              label: 'Vehicle Number (Optional)',
              prefixIcon: Icons.directions_car_outlined,
              validator: null,
            ),
            const SizedBox(height: 16),
            _buildInputField(
              controller: _purposeController,
              label: 'Purpose of Visit',
              prefixIcon: Icons.assignment_outlined,
              validator: _validatePurpose,
              maxLines: 2,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData prefixIcon,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    int? maxLines,
    String? hintText,
    TextInputAction? textInputAction,
    ValueChanged<String>? onChanged,
    InputDecoration? decoration,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.cardBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey[200]!,
          width: 1,
        ),
      ),
      child: TextFormField(
        controller: controller,
        decoration: decoration ??
            InputDecoration(
              labelText: label,
              hintText: hintText,
              prefixIcon: Icon(
                prefixIcon,
                color: AppTheme.primaryColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: AppTheme.cardBackgroundColor,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
        validator: validator,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        maxLines: maxLines ?? 1,
        textInputAction: textInputAction,
        onChanged: onChanged,
        style: const TextStyle(
          fontSize: 16,
        ),
        cursorColor: AppTheme.primaryColor,
      ),
    );
  }
}
