// Copyright 2020 Joan Pablo Jiménez Milian. All rights reserved.
// Use of this source code is governed by the MIT license that can be
// found in the LICENSE file.

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// A [ReactiveDropdownSearch] that contains a [DropdownSearch].
///
/// This is a convenience widget that wraps a [DropdownSearch] widget in a
/// [ReactiveDropdownSearch].
///
/// A [ReactiveForm] ancestor is required.
///
class ReactiveDropdownSearch<T> extends ReactiveFormField<T> {
  /// Creates a [ReactiveDropdownSearch] that contains a [DropdownSearch].
  ///
  /// Can optionally provide a [formControl] to bind this widget to a control.
  ///
  /// Can optionally provide a [formControlName] to bind this ReactiveFormField
  /// to a [FormControl].
  ///
  /// Must provide one of the arguments [formControl] or a [formControlName],
  /// but not both at the same time.
  ///
  /// Can optionally provide a [validationMessages] argument to customize a
  /// message for different kinds of validation errors.
  ///
  /// Can optionally provide a [valueAccessor] to set a custom value accessors.
  /// See [ControlValueAccessor].
  ///
  /// Can optionally provide a [showErrors] function to customize when to show
  /// validation messages. Reactive Widgets make validation messages visible
  /// when the control is INVALID and TOUCHED, this behavior can be customized
  /// in the [showErrors] function.
  ///
  /// ### Example:
  /// Binds a text field.
  /// ```
  /// final form = fb.group({'email': Validators.required});
  ///
  /// ReactiveDropdownSearch(
  ///   formControlName: 'email',
  /// ),
  ///
  /// ```
  ///
  /// Binds a text field directly with a *FormControl*.
  /// ```
  /// final form = fb.group({'email': Validators.required});
  ///
  /// ReactiveDropdownSearch(
  ///   formControl: form.control('email'),
  /// ),
  ///
  /// ```
  ///
  /// Customize validation messages
  /// ```dart
  /// ReactiveDropdownSearch(
  ///   formControlName: 'email',
  ///   validationMessages: {
  ///     ValidationMessage.required: 'The email must not be empty',
  ///     ValidationMessage.email: 'The email must be a valid email',
  ///   }
  /// ),
  /// ```
  ///
  /// Customize when to show up validation messages.
  /// ```dart
  /// ReactiveDropdownSearch(
  ///   formControlName: 'email',
  ///   showErrors: (control) => control.invalid && control.touched && control.dirty,
  /// ),
  /// ```
  ///
  /// For documentation about the various parameters, see the [DropdownSearch] class
  /// and [new DropdownSearch], the constructor.
  ReactiveDropdownSearch({
    Key key,
    String formControlName,
    FormControl formControl,
    ValidationMessagesFunction validationMessages,
    ControlValueAccessor valueAccessor,
    ShowErrorsFunction showErrors,
    Mode mode = Mode.DIALOG,
    String label,
    String hint,
    bool isFilteredOnline = false,
    Widget popupTitle,
    List<T> items,
    DropdownSearchOnFind<T> onFind,
    DropdownSearchBuilder<T> dropdownBuilder,
    DropdownSearchPopupItemBuilder<T> popupItemBuilder,
    bool showSearchBox = false,
    bool showClearButton = false,
    InputDecoration searchBoxDecoration,
    Color popupBackgroundColor,
    bool enabled = true,
    double maxHeight,
    DropdownSearchFilterFn<T> filterFn,
    DropdownSearchItemAsString<T> itemAsString,
    bool showSelectedItem = false,
    DropdownSearchCompareFn<T> compareFn,
    InputDecoration dropdownSearchDecoration,
    EmptyBuilder emptyBuilder,
    LoadingBuilder loadingBuilder,
    ErrorBuilder errorBuilder,
    bool autoFocusSearchBox = false,
    double dialogMaxWidth,
    Widget clearButton,
    Widget dropDownButton,
    bool dropdownBuilderSupportsNullItem = false,
    ShapeBorder popupShape,
    DropdownSearchPopupItemEnabled<T> popupItemDisabled,
    Color popupBarrierColor,
    TextEditingController searchBoxController,
  }) : super(
          key: key,
          formControl: formControl,
          formControlName: formControlName,
          valueAccessor: valueAccessor,
          validationMessages: validationMessages,
          showErrors: showErrors,
          builder: (ReactiveFormFieldState field) {
            final InputDecoration effectiveDropdownSearchDecoration =
                (dropdownSearchDecoration ??
                        const InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                          border: OutlineInputBorder(),
                        ))
                    .applyDefaults(
                        Theme.of(field.context).inputDecorationTheme);

            return DropdownSearch<T>(
              onChanged: field.didChange,
              mode: mode,
              label: label,
              hint: hint,
              isFilteredOnline: isFilteredOnline,
              popupTitle: popupTitle,
              items: items,
              selectedItem: field.value,
              onFind: onFind,
              dropdownBuilder: dropdownBuilder,
              popupItemBuilder: popupItemBuilder,
              showSearchBox: showSearchBox,
              showClearButton: showClearButton,
              searchBoxDecoration: searchBoxDecoration,
              popupBackgroundColor: popupBackgroundColor,
              enabled: enabled,
              maxHeight: maxHeight,
              filterFn: filterFn,
              itemAsString: itemAsString,
              showSelectedItem: showSelectedItem,
              compareFn: compareFn,
              dropdownSearchDecoration: effectiveDropdownSearchDecoration,
              emptyBuilder: emptyBuilder,
              loadingBuilder: loadingBuilder,
              errorBuilder: errorBuilder,
              autoFocusSearchBox: autoFocusSearchBox,
              dialogMaxWidth: dialogMaxWidth,
              clearButton: clearButton,
              dropDownButton: dropDownButton,
              dropdownBuilderSupportsNullItem: dropdownBuilderSupportsNullItem,
              popupShape: popupShape,
              popupItemDisabled: popupItemDisabled,
              popupBarrierColor: popupBarrierColor,
              searchBoxController: searchBoxController,
            );
          },
        );
}
