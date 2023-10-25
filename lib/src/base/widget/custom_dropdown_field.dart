import 'package:flutter/material.dart';
import 'package:flutter_challenge/i18n/translations.dart';
import 'package:flutter_challenge/resources/res.dart';
import 'package:flutter_challenge/src/base/widget/select_dialog.dart';

///CustomDropDownFormField is a general purpose drop down that uses SelectDialog instead of the material dropdown, created just for beautifying things and having more customizations
///
/// [enableCancel] is a optional value that display a clear button if [enableCancel] is true and a value is selected
class CustomDropDownFormField<T> extends FormField<T> {
  CustomDropDownFormField({
    super.key,
    required List<DropdownMenuItem<T>> items,
    required ValueChanged<T?> onChanged,
    super.validator,
    String? hintText,
    bool enableCancel = false,
    super.initialValue,
  }) : super(
          builder: (state) {
            var selectedItem =
                items.where((element) => element.value == state.value).toList();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () async {
                    //Show select dialog
                    var result = await showDialog(
                        context: state.context,
                        builder: (context) => SelectDialog(
                              title: hintText ?? translation.forms.selectValue,
                              selectedItem: state.value,
                              items: items,
                            ));
                    //Result handling
                    if (result != null) {
                      onChanged(result);
                      state.didChange(result);
                    }
                  },
                  child: AnimatedContainer(
                    duration: Durations.smallDuration,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: state.hasError
                              ? Theme.of(state.context).colorScheme.error
                              : Theme.of(state.context).colorScheme.secondary,
                          width: state.hasError ? 2 : 1),
                      borderRadius: BorderRadius.circular(
                        Sizes.borderRadiusS,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    height: kToolbarHeight,
                    child: Row(
                      children: [
                        Expanded(
                            child: selectedItem.isNotEmpty
                                ? selectedItem[0]
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(hintText ??
                                        translation.forms.selectValue),
                                  )),
                        if (enableCancel && state.value!=null)
                          IconButton(
                            icon: const Icon(Icons.cancel_rounded),
                            onPressed: () {
                              onChanged(null);
                              state.didChange(null);
                            },
                          ),
                        const Icon(Icons.chevron_right_rounded)
                      ],
                    ),
                  ),
                ),
                if (state.hasError)
                  Text(
                    state.errorText ?? "",
                    style: const TextStyle(color: Colors.red),
                  )
              ],
            );
          },
        );
}
