part of '../pages.dart';

class SignInForm extends StatelessWidget {
  SignInForm({Key? key}) : super(key: key);
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var succededLogin = false;
  bool _isLoggingIn = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Authentication Failure'),
              ),
            );
        }
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: backgroundColor),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'PELAYANAN ADMINISTRASI MASYARAKAT \n DESA KARANGTINGGIL',
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                const Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 120,
                ),
                const SizedBox(height: 24),
                _UsernameInput(),
                const SizedBox(height: 24),
                _PasswordInput(),
                const SizedBox(height: 20),
                _LoginButton(),
                Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign-up');
                    },
                    child: const Text(
                      'Daftar',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textForm(
      TextEditingController controller, String label, bool password) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: const [
          BoxShadow(
            blurRadius: 10.0,
            offset: Offset(-4, -4),
            color: Colors.white,
          ),
          BoxShadow(
            blurRadius: 10.0,
            offset: Offset(4, 4),
            color: Color(0xFFA7A9AF),
          ),
        ],
        // border: Border.all(color: Colors.black.withOpacity(opacity), width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        obscureText: password,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          label: Text(label),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            boxShadow: const [
              BoxShadow(
                blurRadius: 10.0,
                offset: Offset(-4, -4),
                color: Colors.white,
              ),
              BoxShadow(
                blurRadius: 10.0,
                offset: Offset(4, 4),
                color: Color(0xFFA7A9AF),
              ),
            ],
            // border: Border.all(color: Colors.black.withOpacity(opacity), width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            obscureText: false,
            decoration: const InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              label: Text('Username'),
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            onChanged: (username) =>
                context.read<LoginBloc>().add(LoginUsernameChanged(username)),
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            boxShadow: const [
              BoxShadow(
                blurRadius: 10.0,
                offset: Offset(-4, -4),
                color: Colors.white,
              ),
              BoxShadow(
                blurRadius: 10.0,
                offset: Offset(4, 4),
                color: Color(0xFFA7A9AF),
              ),
            ],
            // border: Border.all(color: Colors.black.withOpacity(opacity), width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            obscureText: true,
            decoration: const InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              label: Text('Password'),
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            onChanged: (password) =>
                context.read<LoginBloc>().add(LoginPasswordChanged(password)),
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var authState = context.select((AuthenticationBloc bloc) => bloc.state);
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ElevatedButton(
          key: const Key('loginForm_continue_raisedButton'),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            backgroundColor: (state.status.isValidated)
                ? MaterialStateProperty.all(secondaryColor)
                : MaterialStateProperty.all(Colors.grey[400]),
          ),
          onPressed: state.status.isValidated
              ? () {
                  context.read<LoginBloc>().add(const LoginSubmitted());
                }
              : null,
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            // decoration: BoxDecoration(border: RoundedRectangleBorder()),
            child: (state.status.isSubmissionInProgress)
                ? const SpinKitRing(color: Colors.white, lineWidth: 3, size: 20)
                : const Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 20),
                  ),
          ),
        );
      },
    );
  }
}
