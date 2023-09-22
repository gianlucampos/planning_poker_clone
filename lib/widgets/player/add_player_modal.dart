import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planning_poker_clone/controllers/player_controller.dart';
import 'package:planning_poker_clone/core/app_text_styles.dart';
import 'package:planning_poker_clone/exceptions/errors.dart';
import 'package:planning_poker_clone/main.dart';
import 'package:planning_poker_clone/models/player_model.dart';

class AddPlayerModal extends StatefulWidget {
  const AddPlayerModal({Key? key}) : super(key: key);

  @override
  State<AddPlayerModal> createState() => _AddPlayerModalState();
}

class _AddPlayerModalState extends State<AddPlayerModal> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  final PlayerController _playerController = getIt<PlayerController>();
  bool _isSpectador = false;
  bool _isBackendValidationFailed = false;
  String? _backendErrorMessage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final logged = await _playerController.getLoggedPlayer();
      if (logged != null && context.mounted) Navigator.of(context).pop();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: SingleChildScrollView(
          child: SizedBox(
            width: 500,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Choose your display name',
                  style: AppTextStyles.title,
                ),
                const SizedBox(height: 50),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      labelText: 'Your display name',
                      border: OutlineInputBorder(),
                      // errorText: _getErrorMessage(),
                    ),
                    validator: _textValidator,
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoSwitch(
                        value: _isSpectador,
                        onChanged: (value) {
                          super.setState(() {
                            _isSpectador = value;
                          });
                        }),
                    const Text('Join as spectator', style: AppTextStyles.body),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) return;
                      await _createPlayer();
                      if (!_formKey.currentState!.validate()) return;
                      if (context.mounted) Navigator.of(context).pop();
                    },
                    child: const Text('Continue to game',
                        style: AppTextStyles.buttonWhite),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Login', style: AppTextStyles.button),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Sign Up', style: AppTextStyles.button)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _textValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a display name!';
    }
    if (_isBackendValidationFailed) {
      _isBackendValidationFailed = false;
      return _backendErrorMessage;
    }
    return null;
  }

  Future<void> _createPlayer() async {
    try {
      await _playerController
          .setLoggedPlayer(PlayerModel(name: _textController.text));
      _isBackendValidationFailed = false;
    } on PlayerAlreadyAdded catch (ex) {
      super.setState(() {
        _isBackendValidationFailed = true;
        _backendErrorMessage = ex.message;
      });
    }
  }
}
