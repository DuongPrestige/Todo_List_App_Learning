//Clas cha: Quản lý các page co. di chuyển qua lại giữa các page con.

import "package:flutter/material.dart";
import "package:todo_list_app/ui/welcome/welcome_page.dart";
import "package:todo_list_app/ultils/enums/onboarding_page_position.dart";

import "onboarding_child_page.dart";

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          //Truyen vao cac widget con ma muon pageview hien thi
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page1,
            nextOnPressed: () {
              _pageController.jumpToPage(1); //di den page 2
            },
            backOnPressed: () {
              // do nothing
            },
            skipOnPressed: () {
              _goToWelcomePage();
            },
          ),
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page2,
            nextOnPressed: () {
              _pageController.jumpToPage(2); // di den page 3
            },
            backOnPressed: () {
              _pageController.jumpToPage(0);
            },
            skipOnPressed: () {
              _goToWelcomePage();
            },
          ),
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page3,
            nextOnPressed: () {
              _goToWelcomePage();
            },
            backOnPressed: () {
              _pageController.jumpToPage(1);
            },
            skipOnPressed: () {
              _goToWelcomePage();
            },
          ),
        ],
      ),
    );
  }

  void _goToWelcomePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const WelcomePage(),
      ),
    );
  }
}
