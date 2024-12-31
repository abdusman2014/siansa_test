import 'package:flutter/material.dart';

class TestsScreen extends StatefulWidget {
  const TestsScreen({super.key});

  @override
  State<TestsScreen> createState() => _TestsScreenState();
}

class _TestsScreenState extends State<TestsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 60),
        Text('Hey'),
        // Text(Config().stripeWorkerPremium),
      ],
    );
    // return const CRUD();
  }
}

// USE TEMPLATE BELOW FOR A NEW TEST:
/*
import 'package:siansa_app/providers/app_versions_provider.dart';
import 'package:siansa_app/providers/chat_provider.dart';
import 'package:siansa_app/providers/user_provider.dart';
import 'package:siansa_app/utils/styles/index.dart';
import 'package:siansa_app/views/auth/common_widget/login_or_register.dart';
import 'package:siansa_app/views/common_views/components/app_version_display.dart';
import 'package:siansa_app/views/common_views/profile_dialog.dart';
import 'package:siansa_app/views/common_views/profile_section.dart';
import 'package:siansa_app/views/company/profile_components/edit_basic_profile.dart';
import 'package:siansa_app/views/company/profile_components/user_basic_profile_details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';
import 'package:siansa_app/views/common_views/page_template/page_template.dart';
class TestsScreenTemplate extends StatefulWidget {
  const TestsScreenTemplate({super.key});
  @override
  State<TestsScreenTemplate> createState() => _TestsScreenTemplateState();
}
class _TestsScreenTemplateState extends State<TestsScreenTemplate> {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      child: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
*/
