import 'package:day_14_01_mvvm_star_wars_movie/viewmodels/home_page_view_model.dart';
import 'package:flutter/material.dart';

class FilmListItemWidget extends StatelessWidget {
  final FilmCellViewModel filmCellVm;
  const FilmListItemWidget({@required this.filmCellVm});

  Widget _buildTitleWidget(BuildContext context) {
    return Text(
      filmCellVm.title,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubTitleWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(
          Icons.movie,
        ),
        SizedBox(width: 10),
        Expanded(
            child: Text(
          '${filmCellVm.directer}',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: _buildTitleWidget(context),
      subtitle: _buildSubTitleWidget(context),
    );
  }
}
