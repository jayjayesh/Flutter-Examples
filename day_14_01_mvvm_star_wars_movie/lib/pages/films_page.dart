import 'package:day_14_01_mvvm_star_wars_movie/viewmodels/home_page_view_model.dart';
import 'package:day_14_01_mvvm_star_wars_movie/widgets/films_list_Item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilmListPage extends StatelessWidget {
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
            itemCount: vm.films == null ? 0 : vm.films.length,
            separatorBuilder: (_, __) => Divider(),
            itemBuilder: (_, index) {
              FilmCellViewModel filmCellVmTemp = vm.films[index];
              return FilmListItemWidget(filmCellVm: filmCellVmTemp);
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
