import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../domain/entities/pet_entity.dart';

class PetFormModal extends StatefulWidget {
  final PetEntity? pet;

  const PetFormModal({super.key, this.pet});

  @override
  State<PetFormModal> createState() => _PetFormModalState();
}

class _PetFormModalState extends State<PetFormModal> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _breedController;
  late final TextEditingController _ageController;
  late final TextEditingController _pesoController;
  late final TextEditingController _proximaCitaController;
  late final TextEditingController _contactoDuenoController;

  bool get isEditing => widget.pet != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.pet?.name ?? '');
    _breedController = TextEditingController(text: widget.pet?.breed ?? '');
    _ageController = TextEditingController(
      text: widget.pet?.age != null ? widget.pet!.age.toString() : '',
    );
    _pesoController = TextEditingController(
      text: widget.pet?.peso != null ? widget.pet!.peso.toString() : '',
    );
    _proximaCitaController = TextEditingController(text: widget.pet?.proximaCita ?? '');
    _contactoDuenoController = TextEditingController(text: widget.pet?.contactoDueno ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _breedController.dispose();
    _ageController.dispose();
    _pesoController.dispose();
    _proximaCitaController.dispose();
    _contactoDuenoController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final name = _nameController.text.trim();
    final breed = _breedController.text.trim();
    final age = int.tryParse(_ageController.text.trim()) ?? 0;
    final peso = double.tryParse(_pesoController.text.trim()) ?? 0;
    final proximaCita = _proximaCitaController.text.trim();
    final contactoDueno = _contactoDuenoController.text.trim();

    Navigator.of(context).pop({
      'name': name,
      'breed': breed,
      'age': age,
      'peso': peso,
      'proximaCita': proximaCita,
      'contactoDueno': contactoDueno,
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 24,
        right: 24,
        top: 24,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              isEditing ? 'Editar mascota' : 'Nueva mascota',
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                prefixIcon: Icon(Icons.pets),
              ),
              textCapitalization: TextCapitalization.words,
              validator: (v) => v == null || v.trim().isEmpty ? 'El nombre es obligatorio' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _breedController,
              decoration: const InputDecoration(
                labelText: 'Raza',
                prefixIcon: Icon(Icons.merge_type),
              ),
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _ageController,
              decoration: const InputDecoration(
                labelText: 'Edad',
                prefixIcon: Icon(Icons.calendar_today),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _pesoController,
              decoration: const InputDecoration(
                labelText: 'Peso (kg)',
                prefixIcon: Icon(Icons.monitor_weight),
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _proximaCitaController,
              decoration: const InputDecoration(
                labelText: 'Próxima cita',
                prefixIcon: Icon(Icons.event),
                hintText: 'AAAA-MM-DD',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _contactoDuenoController,
              decoration: const InputDecoration(
                labelText: 'Contacto del dueño',
                prefixIcon: Icon(Icons.phone),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: FilledButton(
                onPressed: _submit,
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: Text(isEditing ? 'Guardar cambios' : 'Agregar mascota'),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}