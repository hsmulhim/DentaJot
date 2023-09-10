import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dental_proj/components/custom_textfield.dart';
import 'package:dental_proj/constants/spacings.dart';
import 'package:dental_proj/extensions/navigation.dart';
import 'package:dental_proj/screens/signin_screen.dart';
import 'package:dental_proj/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class OtpScreen extends StatefulWidget {
  final String email;

  OtpScreen({required this.email});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void showNewPasswordSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Enter your new password for ${widget.email}'),
              CoustomTextField(
                hinttext: 'Password',
                icon: const Icon(Icons.remove_red_eye_outlined),
                text: 'Password',
                isObscure: true,
                controller: newPasswordController,
              ),
              kVSpace16,
              CoustomTextField(
                hinttext: 'Password',
                icon: const Icon(Icons.remove_red_eye_outlined),
                text: 'Confirm Password',
                isObscure: true,
                controller: confirmPasswordController,

              ),
              ElevatedButton(
                onPressed: () => resetPassword(context),
                child: const Text('Reset Password'),
              ),
            ],
          ),
        );
      },
    );
  }

  void resetPassword(BuildContext context) async {
    final String otp = otpController.text.trim();
    final String newPassword = newPasswordController.text.trim();

    final bool resetSuccess = await SupabaseService.resetPassword(
      email: widget.email,
      otp: otp,
      newPassword: newPassword,
    );

    if (resetSuccess) {
      // ignore: use_build_context_synchronously
      await AwesomeDialog(
        context: context,
        animType: AnimType.scale,
        dialogType: DialogType.success,
        body: const Center(
          child: Text(
            'Password reset successfully.',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        btnOkOnPress: () {},
      ).show();
      /*  ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password reset successfully.'),
        ),
      );*/
      const SignInScreen().push(context);
    } else {
      await AwesomeDialog(
        context: context,
        animType: AnimType.scale,
        dialogType: DialogType.error,
        body: const Center(
          child: Text(
            'Please enter a valid OTP code',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        btnOkOnPress: () {},
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter OTP sent to ${widget.email}',
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            kVSpace32,
            PinCodeTextField(
              autoDisposeControllers: false,
              appContext: context,
              length: 6,
              blinkWhenObscuring: true,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(15),
                fieldHeight: 50,
                fieldWidth: 40,
                activeColor: const Color(0xff2D4CB9),
                inactiveColor: const Color.fromARGB(255, 130, 157, 255),
                selectedColor: Colors.green,
                activeFillColor: Colors.white,
                inactiveFillColor: Colors.white,
                selectedFillColor: Colors.white,
              ),
              cursorColor: Colors.green,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              controller: otpController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onCompleted: (v) {
                debugPrint("Completed");
                showNewPasswordSheet(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
