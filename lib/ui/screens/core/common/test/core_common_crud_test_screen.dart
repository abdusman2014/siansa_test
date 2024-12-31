import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:siansa_app/constants/datasets_constants.dart';
import 'package:siansa_app/main.dart';
import 'package:siansa_app/models/app/user_permission_model.dart';
import 'package:siansa_app/state/providers/crud_provider.dart';
import 'package:siansa_app/state/providers/crud_sub_provider.dart';
import 'package:siansa_app/state/providers/user_permission_provider/user_permission_provider.dart';
import 'package:siansa_app/state/providers/user_provider/subproviders/user_pagination_provider.dart';
import 'package:siansa_app/state/providers/user_provider/user_provider.dart';
import 'package:siansa_app/state/providers/user_role_provider/user_role_provider.dart';
import 'package:siansa_app/ui/ui_utils/responsive/responsive.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_animations/app_animated_page.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_animations/app_fade_in_out.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_company_logo.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_open_web_view.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_avatar_initials/app_avatar_initials.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_login_or_register.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_loading_animation.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_version_display.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_dialog_please_login_or_register.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_please_login.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_confirmation_dialog.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_divider.dart';

import 'package:siansa_app/ui/widgets/my_widgets/my_animation.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_app_bar.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/examples/my_custom_form_example_1.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_forms/my_custom_form/examples/my_custom_form_example_2.dart';
import 'package:siansa_app/ui/widgets/my_widgets/my_icon.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_privacy_policy_terms_and_conditions.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_small_pop_button.dart';
import 'package:siansa_app/ui/widgets/app_widgets/app_dialog_update_required.dart';
import 'package:unicons/unicons.dart';

class CoreCommonCRUDTestScreen extends StatefulWidget {
  const CoreCommonCRUDTestScreen({super.key});

  @override
  _CoreCommonCRUDTestScreenState createState() =>
      _CoreCommonCRUDTestScreenState();
}

class _CoreCommonCRUDTestScreenState extends State<CoreCommonCRUDTestScreen> {
  @override
  void initState() {
    super.initState();

    // Call the provider function once when the widget is first created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // This ensures the provider function is called after the build method is complete
      // Provider.of<CRUDProvider>(
      //   context,
      //   listen: false,
      // ).pagination.getFirstPage(context: context);

      Provider.of<CRUDProvider>(context, listen: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    // // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    // Platform + UserRole + Feature Name + Screen

    // // If screen is responsive, then:
    // return const SharedCommonTestScreen();

    // // If the screen requires child screens for different platforms, then:
    // if (Responsive.isMobile(context)) {
    //   return const MobileCommonTestScreen();
    // } else if (Responsive.isTablet(context)) {
    //   return const TabletCommonTestScreen();
    // } else {
    //   if (kIsWeb) {
    //     return const WebCommonTestScreen();
    //   } else {
    //     return const DesktopCommonTestScreen();
    //   }
    // }
    // // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    // UserProvider userProvider = Provider.of<UserProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    // final userProvider = Provider.of<UserProvider>(context, listen: false);

    // UserPermissionProvider userPermissionProvider =
    //     Provider.of<UserPermissionProvider>(context);
    final userPermissionProvider = Provider.of<UserPermissionProvider>(context);

    // CRUDProvider crudProvider = Provider.of<CRUDProvider>(context);
    // final crudProvider = Provider.of<CRUDProvider>(context, listen: false);
    final crudProvider = Provider.of<CRUDProvider>(context);

    // final _crudProvider = CRUDSubProvider<UserPermissionModel>(
    //   dataset: DatasetsConstants.USER_PERMISSIONS_DATASET,
    //   fromMap: (map) => UserPermissionModel.fromMap(map),
    //   toMap: (model) => model.toMap(),
    // );

    String title = "User List";

    createOne() async {
      debugPrint('\n --------------------------------->>>>> \n');

      await userPermissionProvider.crud
          .createOne(context, {'name': 'New Test OO1', 'id': 'new_id_1'});

      debugPrint('1.0 >> crudProvider.createOneResult <<');
      debugPrint('${crudProvider.createOneResult}');

      debugPrint('1.1 >> userPermissionProvider.crud.createOneResult <<');
      debugPrint(userPermissionProvider.crud.createOneResult.toString());
    }

    createMany() async {
      debugPrint('\n --------------------------------->>>>> \n');

      await userPermissionProvider.crud.createMany(context, [
        // {'name': 'Crear Usuarios', 'id': 'users_create', 'isSystem': true},
        // {'name': 'Leer Usuarios', 'id': 'users_read', 'isSystem': true},
        // {'name': 'Editar Usuarios', 'id': 'users_update', 'isSystem': true},
        // {'name': 'Eliminar Usuarios', 'id': 'users_delete', 'isSystem': true},
        {'name': 'New Test 001', 'id': 'many_01'},
        {'name': 'New Test 002', 'id': 'many_02'},
        {'name': 'New Test 003', 'id': 'many_03'},
        {'name': 'New Test 004', 'id': 'users_read'},
      ]);

      debugPrint('1.0 >> crudProvider.createManyResult <<');
      debugPrint('${crudProvider.createManyResult}');

      debugPrint('1.1 >> userPermissionProvider.crud.createManyResult <<');
      debugPrint(userPermissionProvider.crud.createManyResult.toString());
    }

    readOneById() async {
      debugPrint('\n --------------------------------->>>>> \n');

      await userPermissionProvider.crud.readOneById(context, 'users_read');

      debugPrint('1.0 >> crudProvider.readOneByIdResult <<');
      debugPrint('${crudProvider.readOneByIdResult}');
      debugPrint('${crudProvider.readOneByIdResult.runtimeType}');

      debugPrint('1.1 >> userPermissionProvider.crud.readOneByIdResult <<');
      debugPrint(userPermissionProvider.crud.readOneByIdResult.toString());
      debugPrint(
          '${userPermissionProvider.crud.readOneByIdResult.runtimeType}');
    }

    readManyById() async {
      debugPrint('\n --------------------------------->>>>> \n');

      await userPermissionProvider.crud.readManyById(
        context: context,
        orderBy: 'name',
        ids: ['many_01', 'users_read'],
      );

      debugPrint('1.0 >> crudProvider.readManyByIdResult <<');
      debugPrint('${crudProvider.readManyByIdResult}');
      debugPrint('${crudProvider.readManyByIdResult.runtimeType}');

      debugPrint('1.1 >> userPermissionProvider.crud.readManyByIdResult <<');
      debugPrint(userPermissionProvider.crud.readManyByIdResult.toString());
      debugPrint(
          '${userPermissionProvider.crud.readManyByIdResult.runtimeType}');
    }

    readAll() async {
      debugPrint('\n --------------------------------->>>>> \n');

      await userPermissionProvider.crud.readAll(
        context: context,
        orderBy: 'name',
      );

      debugPrint('1.0 >> crudProvider.readAllResult <<');
      debugPrint('${crudProvider.readAllResult}');
      debugPrint('${crudProvider.readAllResult.runtimeType}');

      debugPrint('1.1 >> userPermissionProvider.crud.readAllResult <<');
      debugPrint(userPermissionProvider.crud.readAllResult.toString());
      debugPrint('${userPermissionProvider.crud.readAllResult.runtimeType}');
    }

    readAllByFilters() async {
      debugPrint('\n --------------------------------->>>>> \n');

      await userPermissionProvider.crud.readAllByFilters(context, {
        'isSystem': false,
        // 'name': 'New Test 003',
      });

      debugPrint('1.0 >> crudProvider.readAllByFiltersResult <<');
      debugPrint('${crudProvider.readAllByFiltersResult}');
      debugPrint('${crudProvider.readAllByFiltersResult.runtimeType}');

      debugPrint(
          '1.1 >> userPermissionProvider.crud.readAllByFiltersResult <<');
      debugPrint(userPermissionProvider.crud.readAllByFiltersResult.toString());
      debugPrint(
          '${userPermissionProvider.crud.readAllByFiltersResult.runtimeType}');
    }

    updateOneById() async {
      debugPrint('\n --------------------------------->>>>> \n');

      await userPermissionProvider.crud.updateOneById(context, 'many_01', {
        'name': 'xxx',
        'newField': 'newValue',
      });

      debugPrint('1.0 >> crudProvider.updateOneByIdResult <<');
      debugPrint('${crudProvider.updateOneByIdResult}');

      debugPrint('1.1 >> userPermissionProvider.crud.updateOneByIdResult <<');
      debugPrint(userPermissionProvider.crud.updateOneByIdResult.toString());
    }

    updateOneByIdExistingFieldsOnly() async {
      debugPrint('\n --------------------------------->>>>> \n');

      await userPermissionProvider.crud
          .updateOneByIdExistingFieldsOnly(context, 'many_01', {
        'name': 'yyy',
        'newField2': 'newValue2',
      });

      debugPrint(
          '1.0 >> crudProvider.updateOneByIdExistingFieldsOnlyResult <<');
      debugPrint('${crudProvider.updateOneByIdExistingFieldsOnlyResult}');

      debugPrint(
          '1.1 >> userPermissionProvider.crud.updateOneByIdExistingFieldsOnlyResult <<');
      debugPrint(userPermissionProvider
          .crud.updateOneByIdExistingFieldsOnlyResult
          .toString());
    }

    updateManyById() async {
      debugPrint('\n --------------------------------->>>>> \n');

      await userPermissionProvider.crud.updateManyById(
        context,
        ['many_01', 'many_02', 'many_03'],
        {
          'isSystem': true,
          'otherNewField': 123,
        },
      );

      debugPrint('1.0 >> crudProvider.updateManyByIdResult <<');
      debugPrint('${crudProvider.updateManyByIdResult}');

      debugPrint('1.1 >> userPermissionProvider.crud.updateManyByIdResult <<');
      debugPrint(userPermissionProvider.crud.updateManyByIdResult.toString());
    }

    updateManyByIdExistingFieldsOnly() async {
      debugPrint('\n --------------------------------->>>>> \n');

      await userPermissionProvider.crud.updateManyByIdExistingFieldsOnly(
        context,
        ['many_01', 'many_02', 'many_03'],
        {
          'isSystem': false,
          'otherNewField2': 956,
        },
      );

      debugPrint(
          '1.0 >> crudProvider.updateManyByIdExistingFieldsOnlyResult <<');
      debugPrint('${crudProvider.updateManyByIdExistingFieldsOnlyResult}');

      debugPrint(
          '1.1 >> userPermissionProvider.crud.updateManyByIdExistingFieldsOnlyResult <<');
      debugPrint(userPermissionProvider
          .crud.updateManyByIdExistingFieldsOnlyResult
          .toString());
    }

    deleteOneById() async {
      debugPrint('\n --------------------------------->>>>> \n');

      await userPermissionProvider.crud.deleteOneById(context, 'new_id_1');

      debugPrint('1.0 >> crudProvider.deleteOneByIdResult <<');
      debugPrint('${crudProvider.deleteOneByIdResult}');

      debugPrint('1.1 >> userPermissionProvider.crud.deleteOneByIdResult <<');
      debugPrint(userPermissionProvider.crud.deleteOneByIdResult.toString());
    }

    deleteManyById() async {
      debugPrint('\n --------------------------------->>>>> \n');

      await userPermissionProvider.crud.deleteManyById(
        context,
        [
          'many_01',
          'many_02',
          'many_03',
        ],
      );

      debugPrint('1.0 >> crudProvider.deleteManyByIdResult <<');
      debugPrint('${crudProvider.deleteManyByIdResult}');

      debugPrint('1.1 >> userPermissionProvider.crud.deleteManyByIdResult <<');
      debugPrint(userPermissionProvider.crud.deleteManyByIdResult.toString());
    }

    updateAll() async {
      debugPrint('\n --------------------------------->>>>> \n');

      await userPermissionProvider.crud.updateAll(context, {
        'name': 'hehe',
        'newFieldForAll': {},
      });

      debugPrint('1.0 >> crudProvider.updateAllResult <<');
      debugPrint('${crudProvider.updateAllResult}');

      debugPrint('1.1 >> userPermissionProvider.crud.updateAllResult <<');
      debugPrint(userPermissionProvider.crud.updateAllResult.toString());
    }

    updateAllExistingFieldsOnly() async {
      debugPrint('\n --------------------------------->>>>> \n');

      await userPermissionProvider.crud.updateAllExistingFieldsOnly(context, {
        'name': 'hoho',
        'newFieldForAll2': {},
      });

      debugPrint('1.0 >> crudProvider.updateAllExistingFieldsOnlyResult <<');
      debugPrint('${crudProvider.updateAllExistingFieldsOnlyResult}');

      debugPrint(
          '1.1 >> userPermissionProvider.crud.updateAllExistingFieldsOnlyResult <<');
      debugPrint(userPermissionProvider.crud.updateAllExistingFieldsOnlyResult
          .toString());
    }

    updateAllByFilters() async {
      debugPrint('\n --------------------------------->>>>> \n');

      await userPermissionProvider.crud.updateAllByFilters(
        context,
        {
          'isSystem': true,
        },
        {
          'isSystem': false,
          'newName': '-',
        },
      );

      debugPrint('1.0 >> crudProvider.updateAllByFiltersResult <<');
      debugPrint('${crudProvider.updateAllByFiltersResult}');

      debugPrint(
          '1.1 >> userPermissionProvider.crud.updateAllByFiltersResult <<');
      debugPrint(
          userPermissionProvider.crud.updateAllByFiltersResult.toString());
    }

    deleteAll() async {
      debugPrint('\n --------------------------------->>>>> \n');

      await userPermissionProvider.crud.deleteAll(context);

      debugPrint('1.0 >> crudProvider.deleteAllResult <<');
      debugPrint('${crudProvider.deleteAllResult}');

      debugPrint('1.1 >> userPermissionProvider.crud.deleteAllResult <<');
      debugPrint(userPermissionProvider.crud.deleteAllResult.toString());
    }

    deleteAllByFilters() async {
      debugPrint('\n --------------------------------->>>>> \n');

      await userPermissionProvider.crud.deleteAllByFilters(
        context,
        {
          'newName': 'Changed value of isSystem 2',
          'isSystem': true,
        },
      );

      debugPrint('1.0 >> crudProvider.deleteAllByFiltersResult <<');
      debugPrint('${crudProvider.deleteAllByFiltersResult}');

      debugPrint(
          '1.1 >> userPermissionProvider.crud.deleteAllByFiltersResult <<');
      debugPrint(
          userPermissionProvider.crud.deleteAllByFiltersResult.toString());
    }

    return Scaffold(
      appBar: AppBar(title: Text('title')),
      // appBar: MyAppBar(title: 'title'),
      // body: Center(child: Text(bodyText)),
      body: Center(
        child: Column(
          children: [
            Text(crudProvider.readOneByIdResult.toString()),
            // ---------------------------------------------
            Row(
              children: [
                buildSimpleButton(
                  text: 'createOne()',
                  onTap: () async => createOne(),
                ),
                buildSimpleButton(
                  text: 'createMany()',
                  onTap: () async => createMany(),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                buildSimpleButton(
                  text: 'readOneById()',
                  onTap: () async => readOneById(),
                ),
                buildSimpleButton(
                  text: 'readManyById()',
                  onTap: () async => readManyById(),
                ),
                buildSimpleButton(
                  text: 'readAll()',
                  onTap: () async => readAll(),
                ),
                buildSimpleButton(
                  text: 'readAllByFilters()',
                  onTap: () async => readAllByFilters(),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                buildSimpleButton(
                  text: 'updateOneById()',
                  onTap: () async => updateOneById(),
                ),
                buildSimpleButton(
                  text: 'updateOneByIdExistingFieldsOnly()',
                  onTap: () async => updateOneByIdExistingFieldsOnly(),
                ),
                buildSimpleButton(
                  text: 'updateManyById()',
                  onTap: () async => updateManyById(),
                ),
                buildSimpleButton(
                  text: 'updateManyByIdExistingFieldsOnly()',
                  onTap: () async => updateManyByIdExistingFieldsOnly(),
                ),
              ],
            ),
            Row(
              children: [
                buildSimpleButton(
                  text: 'updateAll()',
                  onTap: () async => updateAll(),
                ),
                buildSimpleButton(
                  text: 'updateAllExistingFieldsOnly()',
                  onTap: () async => updateAllExistingFieldsOnly(),
                ),
                buildSimpleButton(
                  text: 'updateAllByFilters()',
                  onTap: () async => updateAllByFilters(),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                buildSimpleButton(
                  text: 'deleteOneById()',
                  onTap: () async => deleteOneById(),
                ),
                buildSimpleButton(
                  text: 'deleteManyById()',
                  onTap: () async => deleteManyById(),
                ),
                buildSimpleButton(
                  text: 'deleteAll()',
                  onTap: () async => deleteAll(),
                ),
                buildSimpleButton(
                  text: 'deleteAllByFilters()',
                  onTap: () async => deleteAllByFilters(),
                ),
              ],
            ),
            // ---------------------------------------------
            // ---------------------------------------------
            const SizedBox(height: 10),
            // MyCustomFormExampleLoginForm(
            //     onSubmit: (email, password) => print('$email - $password'))
            // ---------------------------------------------
          ],
        ),
      ),
      // body: Center(
      //   child: RoundButton(),
      // ),
    );

    // return buildSimpleScaffold();
  }

  Widget buildSimpleButton({
    String text = 'Title',
    Color backgroundColor = Colors.blue,
    dynamic onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ElevatedButton(
        onPressed: () => onTap(),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Button color
          padding: const EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  // Function that returns a Scaffold widget
  Widget buildSimpleScaffold({
    String title = "Title",
    String bodyText = "Lorem ipsum...",
  }) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      // body: Center(child: Text(bodyText)),
      body: Center(
        child: InkWell(
          onTap: () {
            //
          },
        ),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Mensaje'),
              content: const Text('Saludos!!!'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(), backgroundColor: Colors.blue,
        padding: EdgeInsets.all(20), // Color de fondo
        shadowColor: Colors.black, // Color de sombra
        elevation: 5,
      ),
      child: Icon(Icons.access_alarm),
    );
  }
}
