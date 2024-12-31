
# My Form

## Required Packages

- [Flutter Form Builder](https://pub.dev/packages/flutter_form_builder)
```
flutter pub add flutter_form_builder
```

- [Form Builder Validators](https://pub.dev/packages/form_builder_validators)
```
flutter pub add form_builder_validators
```

- [Form Builder File Picker](https://pub.dev/packages/form_builder_file_picker)
```
flutter pub add form_builder_file_picker
```

- [Form Builder Extra Fields](https://pub.dev/packages/form_builder_extra_fields)
```
flutter pub add form_builder_extra_fields
```

## Example
  
  ```
  MyForm(
    padding: const EdgeInsets.all(50),
    titleText: 'title text',
    subtitleText: 'subtitle text',
    descriptionText: 'description text',
    footerText: 'footer text',
    submitButtonText: 'LOGIN',
    inputElements: [
      MyFormInputModel(
        type: 'email',
        name: 'email',
        label: 'Enter your email',
        placeholder: 'user@example.com',
        // initialValue: 'name@company.com',
      ),
      MyFormInputModel(
        type: 'password',
        name: 'password',
        label: 'Enter your password',
        placeholder: '12345678',
        // initialValue: 'hello2024',
      ),
    ],
    onSubmit: (formValues) {
      print('Test: Form Key/Values');
      print(formValues);
    },
  );
  ```

  #### ***** OUTPUT *****
  ```
  {email: user@@mail.com, password: 1234456}
  ```
 