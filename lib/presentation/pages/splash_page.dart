import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otaqu/common/utils/app_constants.dart';
import 'package:otaqu/presentation/bloc/destination/destination_bloc.dart';
import 'package:otaqu/presentation/bloc/onboarding/onboarding_bloc.dart';
import 'package:otaqu/presentation/bloc/token/token_bloc.dart';
import 'package:otaqu/presentation/pages/home_page.dart';
import 'package:otaqu/presentation/pages/onboarding_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MultiBlocListener(
        listeners: [
          BlocListener<TokenBloc, TokenState>(
            listener: (context, state) {
              if (state is ErrorGetTokenState) {
                BlocProvider.of<TokenBloc>(context).add(
                    SetTokenEvent(username: kUsername, password: kPassword));
              }

              if (state is LoadedGetTokenState) {
                BlocProvider.of<DestinationBloc>(context)
                    .add(GetDestinationEvent(token: state.token));
              }
            },
          ),
          BlocListener<DestinationBloc, DestinationState>(
            listener: (context, state) {
              if (state is ErrorGetDestinationState) {
                BlocProvider.of<DestinationBloc>(context)
                    .add(SetDestinationEvent(token: state.token));
              }
            },
          ),
          BlocListener<OnboardingBloc, OnboardingState>(
            listener: (context, state) {
              if (state is LoadedGetOnboardingState) {
                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HomePage(),
                    ),
                  );
                });
              }

              if (state is ErrorGetOnboardingState) {
                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const OnBoardingPage(),
                    ),
                  );
                });
              }
            },
          )
        ],
        child: Container(
          margin: const EdgeInsets.all(50),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 200,
              ),
              const SizedBox(height: 20),
              const Text("Powered by : Otaqu.id")
            ],
          ),
        ),
      ),
    );
  }
}
