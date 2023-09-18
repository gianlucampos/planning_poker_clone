import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planning_poker_clone/controllers/player_controller.dart';
import 'package:planning_poker_clone/core/app_text_styles.dart';
import 'package:planning_poker_clone/main.dart';
import 'package:planning_poker_clone/models/player_model.dart';

class AddPlayerModal extends StatefulWidget {
  const AddPlayerModal({Key? key}) : super(key: key);

  @override
  State<AddPlayerModal> createState() => _AddPlayerModalState();
}

class _AddPlayerModalState extends State<AddPlayerModal> {
  final _textController = TextEditingController();
  final PlayerController _playerController = getIt<PlayerController>();
  bool _isSpectador = false;
  bool _isNotValid = false;

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
                Text(
                  'Choose your display name',
                  style: AppTextStyles.title,
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: _textController,
                  onTap: () {
                    setState(() {
                      _isNotValid = false;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Your display name',
                    border: const OutlineInputBorder(),
                    errorText: _getErrorMessage(),
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
                    Text('Join as spectator', style: AppTextStyles.body),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      super.setState(() {
                        _isNotValid = _textController.text.trim().isEmpty;
                        if (_isNotValid) {
                          return;
                        }
                      });
                      await _playerController.setLoggedPlayer(
                          PlayerModel(name: _textController.text));
                      if (context.mounted) Navigator.of(context).pop();
                    },
                    child: Text('Continue to game',
                        style: AppTextStyles.buttonWhite),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('Login', style: AppTextStyles.button),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text('Sign Up', style: AppTextStyles.button)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _getErrorMessage() {
    if (_isNotValid & _textController.text.isEmpty) {
      return "Please enter a display name!";
    }
    return null;
  }
}
