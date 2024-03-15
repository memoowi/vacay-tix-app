import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vacay_tix/bloc/auth_bloc.dart';
import 'package:vacay_tix/utils/custom_colors.dart';
import 'package:vacay_tix/widgets/custom_filled_button.dart';
import 'package:vacay_tix/widgets/custom_outline_button.dart';

class CustomAlertLogout extends StatelessWidget {
  const CustomAlertLogout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is! AuthenticatedState) {
          Navigator.pop(context);
        }
      },
      child: AlertDialog(
        icon: Icon(Icons.logout),
        iconColor: CustomColors.mulberry,
        title: Text('Logout'),
        content: Text('Are you sure you want to log out?'),
        backgroundColor: CustomColors.eggshell,
        actionsOverflowDirection: VerticalDirection.up,
        actionsOverflowButtonSpacing: 10,
        actions: [
          CustomOutlineButton(
            label: 'Cancel',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CustomFilledButton(
            label: 'Logout',
            onPressed: () {
              context.read<AuthBloc>().add(
                    LogoutEvent(
                      context: context,
                    ),
                  );
            },
          ),
        ],
      ),
    );
  }
}
