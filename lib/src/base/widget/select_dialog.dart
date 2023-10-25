import 'package:flutter/material.dart';
import 'package:flutter_challenge/i18n/translations.dart';

import '../../../resources/res.dart';

class SelectDialog<T> extends StatefulWidget {
  final String title;
  final T selectedItem;
  final List<DropdownMenuItem<T>> items;

  const SelectDialog({
    super.key,
    required this.title,
    required this.selectedItem,
    required this.items,
  });

  @override
  State<SelectDialog> createState() => _SelectDialogState();
}

class _SelectDialogState<T> extends State<SelectDialog> {
  final ScrollController _controller = ScrollController();
  final TextEditingController _textEditingController = TextEditingController();
  final double _itemExtent = 35 + Sizes.paddingXS;

  List<DropdownMenuItem> filteredItems = [];

  @override
  void didChangeDependencies() {
    filterItems(notify: false);
    super.didChangeDependencies();
  }

  void filterItems({notify = true}) {
    setState(() {
      filteredItems = widget.items
          .where((element) => ((element.value as String?)??"")
              .toLowerCase()
              .trim()
              .contains(_textEditingController.text.trim().toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = filteredItems
        .indexWhere((element) => element.value == widget.selectedItem);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (selectedIndex > -1) {
        double jump = _itemExtent * selectedIndex;
        if (jump > _controller.position.maxScrollExtent) {
          jump = _controller.position.maxScrollExtent;
        }
        _controller.jumpTo(
          jump,
        );
      }
    });
    return Center(
      child: Dialog(
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: _controller,
                    padding:
                        const EdgeInsets.symmetric(horizontal: Sizes.padding),
                    itemExtent: _itemExtent,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: Sizes.paddingXS),
                      child: TextButton(
                        style: Theme.of(context)
                            .elevatedButtonTheme
                            .style!
                            .copyWith(
                              backgroundColor: MaterialStatePropertyAll(
                                index == selectedIndex
                                    ? Theme.of(context).colorScheme.surfaceTint
                                    : Theme.of(context).colorScheme.onPrimary,
                              ),
                              foregroundColor: MaterialStatePropertyAll(
                                index == selectedIndex
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : Theme.of(context).colorScheme.surfaceTint,
                              ),
                            ),
                        onPressed: () => Navigator.of(context).pop(
                          filteredItems[index].value,
                        ),
                        child: filteredItems[index].child,
                      ),
                    ),
                    itemCount: filteredItems.length,
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: DialogTheme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(25)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: Sizes.padding,
                  ),
                  Text(widget.title,
                      textAlign: TextAlign.center,
                      style: DialogTheme.of(context).titleTextStyle),
                  const SizedBox(
                    height: Sizes.paddingXS,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.padding,
                    ),
                    child: TextField(
                      decoration: InputDecoration(hintText: translation.forms.search),
                      onChanged: (val) => filterItems(),
                      controller: _textEditingController,
                    ),
                  ),
                  const SizedBox(
                    height: Sizes.paddingS,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
