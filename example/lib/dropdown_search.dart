import 'package:dropdown_search/dropdown_search.dart';
import 'package:example/sample_screen.dart';
import 'package:flutter/material.dart' hide ProgressIndicator;
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms_fields/reactive_dropdown_search/reactive_dropdown_search.dart';

class LoginSample extends StatelessWidget {
  FormGroup buildForm() => fb.group({
        'menu': FormControl<String>(value: 'Tunisia'),
        'bottomSheet': FormControl<String>(value: 'Brazil'),
      });

  @override
  Widget build(BuildContext context) {
    return SampleScreen(
      title: Text('Dropdown sample'),
      body: ReactiveFormBuilder(
        form: buildForm,
        builder: (context, form, child) {
          return Column(
            children: [
              ReactiveDropdownSearch(
                formControlName: 'menu',
                dropdownSearchDecoration: InputDecoration(
                  helperText: '',
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                  border: OutlineInputBorder(),
                ),
                mode: Mode.MENU,
                hint: "Select a country",
                showSelectedItem: true,
                items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                label: "Menu mode *",
                showClearButton: true,
                popupItemDisabled: (String s) => s.startsWith('I'),
              ),
              SizedBox(height: 8),
              ReactiveDropdownSearch<String>(
                formControlName: 'bottomSheet',
                mode: Mode.BOTTOM_SHEET,
                maxHeight: 300,
                items: ["Brazil", "Italia", "Tunisia", 'Canada'],
                label: "Custom BottomShet mode",
                showSearchBox: true,
                searchBoxDecoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                  labelText: "Search a country",
                ),
                popupTitle: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Country',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                popupShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
              ),
              SizedBox(height: 16),
              RaisedButton(
                child: Text('Sign Up'),
                onPressed: () {
                  if (form.valid) {
                    print(form.value);
                  } else {
                    form.markAllAsTouched();
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
