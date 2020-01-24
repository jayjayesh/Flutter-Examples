import 'package:day_14_01_mvvm_star_wars_movie/viewmodels/home_page_view_model.dart';
import 'package:flutter/material.dart';

class CharacterListItemWidget extends StatelessWidget {
  final CharacterCellViewModel characterCellVm;
  const CharacterListItemWidget({@required this.characterCellVm});

  Widget _buildTitleWidget(BuildContext context) {
    return Text(
      characterCellVm.name,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubTitleWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
            child: Text(
          '${characterCellVm.gender}',
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
