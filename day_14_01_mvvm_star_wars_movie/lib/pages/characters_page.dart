import 'package:day_14_01_mvvm_star_wars_movie/viewmodels/home_page_view_model.dart';
import 'package:day_14_01_mvvm_star_wars_movie/widgets/character_list_Item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharacterListPage extends StatelessWidget {
  Widget _buildViewAccordingVmState(
      BuildContext context, HomePageViewModel vm) {
    switch (vm.loadingStatus) {
      case LoadingStatus.searching:
        return Align(child: Center(child: CircularProgressIndicator()));
        break;

      case LoadingStatus.empty:
        return Align(child: Text('No result found!'));
        break;

      case LoadingStatus.complete:
        return ListView.separated(
            itemCount: vm.characters == null ? 0 : vm.characters.length,
            separatorBuilder: (_, __) => Divider(),
            itemBuilder: (_, index) {
              CharacterCellViewModel characterCellVmTemp = vm.characters[index];
              return CharacterListItemWidget(
                  characterCellVm: characterCellVmTemp);
            });

      default:
        return Container(
            child: Text('Something bad happen, Please restart app'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomePageViewModel>(context);

    return Container(
      child: _buildViewAccordingVmState(context, vm),
    );
  }
}
