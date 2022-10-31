import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:velocity_x/velocity_x.dart';

///   created               : Aditya Pratama
///   originalFilename      : ex_ui_load_more
///   date                  : 24 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   <img width="122" alt="image" src="https://user-images.githubusercontent.com/36602270/169626834-20f578e8-4067-49d7-b8e4-0c708d9e1efd.png">

class ExLoadMore extends StatelessWidget {
  const ExLoadMore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      builder: (BuildContext context, LoadStatus? mode) {
        Widget body;
        if (mode == LoadStatus.idle) {
          body = const Text('-- Tidak ada lagi data --').pOnly(top: 24);
        } else if (mode == LoadStatus.loading) {
          body = const CupertinoActivityIndicator();
        } else if (mode == LoadStatus.failed) {
          body = const Text('Load Failed! Click retry!');
        } else if (mode == LoadStatus.canLoading) {
          body = const Text('release to load more');
        } else {
          body = const Text('Tidak ada lagi data.');
        }
        return SizedBox(
          height: 55.0,
          child: Center(child: body),
        );
      },
    );
  }
}
