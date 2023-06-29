import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
//import 'package:providus_vps/dashboard_page.dart';


class PinKeyboard extends StatefulWidget {
  final double space;
  final int length;
  final void Function(String) onChange;
  final void Function(String) onConfirm;
  final VoidCallback onBiometric;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;

  const PinKeyboard({
    this.space = 63,
    this.length = 10,
    this.onChange,
    this.onConfirm,
    this.onBiometric,
    this.textColor = Colors.black,
    this.fontSize = 30,
    this.fontWeight = FontWeight.w400,
    String deviceId,
  });

  @override
  _PinKeyboardState createState() => _PinKeyboardState();
}

class _PinKeyboardState extends State<PinKeyboard> {
  String _pinCode = "";

  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  bool _canCheckBiometrics;
  List<BiometricType> _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  @override
  void initState() {
    super.initState();
    auth.isDeviceSupported().then(
          (isSupported) => setState(() => _supportState = isSupported
          ? _SupportState.supported
          : _SupportState.unsupported),
    );
    _getAvailableBiometrics();
  }

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
      print(availableBiometrics);
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  /*Future<void> _authenticate() async {
    bool authenticated = false;
    var _appData = Provider.of<AppData>(context,listen: false);
    print(_appData.my_device_id);
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
          localizedReason: 'Let OS determine authentication method',
          useErrorDialogs: true,
          stickyAuth: true);
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = "Error - ${e.message}";
      });
      return;
    }
    if (!mounted) return;

    setState(() => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
          localizedReason:
          'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = "Error - ${e.message}";
      });
      return;
    }
    if (!mounted) return;

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });

    if (_authorized == "Authorized") {
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardPage()));
    }
    _authorized = "";
  }*/

  void _cancelAuthentication() async {
    await auth.stopAuthentication();
    setState(() => _isAuthenticating = false);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _createNumber("1", _handleTabNumber),
              const Spacer(),
              _createNumber("2", _handleTabNumber),
              const Spacer(),
              _createNumber("3", _handleTabNumber),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _createNumber("4", _handleTabNumber),
              const Spacer(),
              _createNumber("5", _handleTabNumber),
              const Spacer(),
              _createNumber("6", _handleTabNumber),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _createNumber("7", _handleTabNumber),
              const Spacer(),
              _createNumber("8", _handleTabNumber),
              const Spacer(),
              _createNumber("9", _handleTabNumber),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _createBiometricIcon(),
              const Spacer(),
              _createNumber("0", _handleTabNumber),
              const Spacer(),
              _createBackspaceIcon(),
            ],
          ),
        ],
      ),
    );
  }

  _createNumber(String number, void Function(String) onPress) => InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.space),
        ),
        child: SizedBox(
          height: widget.space,
          width: widget.space,
          //   margin: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 30.0,
                //color: widget.textColor,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        onTap: () {
          onPress(number);
        },
      );

  Widget _createImage(Widget icon, void Function() onPress) => InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.space),
        ),
        child: SizedBox(
          height: widget.space,
          width: widget.space,
          child: Center(child: icon),
        ),
        onTap: () {
          onPress();
        },
      );

  void _handleTabNumber(String number) {
    if (_pinCode.length == 7) {
      return;
    }
    if (_pinCode.length < widget.length) {
      _pinCode += number;
      widget.onChange(_pinCode);
      if (_pinCode.length == widget.length) {
        widget.onConfirm(_pinCode);
        _pinCode = "";
      }
    }
  }

  void _handleTabBiometric() {
    //_authenticateWithBiometrics();
    //widget.onBiometric();
    //_authenticate();
  }

  void _handleTabBackspace() {
    if (_pinCode.isNotEmpty) {
      _pinCode = _pinCode.substring(0, _pinCode.length - 1);
      widget.onChange(_pinCode);
    }
  }

  Widget _createBiometricIcon() {
    return _createImage(
      const Icon(Icons.fingerprint, size: 25, color: Colors.black,),
      _handleTabBiometric,
    );
  }

  Widget _createBackspaceIcon() => _createImage(
    const Icon(Icons.arrow_back_ios, size: 25, color: Colors.black,),
        _handleTabBackspace,
      );
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
