import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars & Dialogs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'Ex deserunt ullamco magna quis labore irure nisi esse aliquip. Lorem nulla enim incididunt cillum ipsum dolore anim nisi occaecat esse commodo. Dolor ipsum minim ut in non ad consectetur quis.')
                ]);
              },
              child: const Text('Used licenses'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Show dialog'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text('Show snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text(
        'Hello human',
      ),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {},
      ),
      duration: const Duration(
        seconds: 2,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text(
            'Non eu ipsum id voluptate amet ipsum laborum incididunt exercitation elit. Pariatur nisi dolore et aute id ullamco pariatur pariatur. Reprehenderit aute tempor adipisicing duis ex mollit nulla cillum ullamco velit.'),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => context.pop(),
            child: const Text('Accept'),
          ),
        ],
      ),
    );
  }
}
