import 'package:flutter/cupertino.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

export 'package:amplify_flutter/amplify_flutter.dart';

class AmplifyQuery<TModel extends Model> extends StatefulWidget {
  final ModelType<TModel> type;
  final QueryPredicate? where;
  final AsyncWidgetBuilder<QuerySnapshot<TModel>> builder;

  const AmplifyQuery({
    super.key,
    this.where,
    required this.type,
    required this.builder
  });

  @override
  State<AmplifyQuery> createState() => _AmplifyQueryState<TModel>();
}

class _AmplifyQueryState<TModel extends Model> extends State<AmplifyQuery> {
  late Stream<QuerySnapshot<TModel>> _stream;

  @override
  void initState() {
    super.initState();
    _stream = Amplify.DataStore.observeQuery<TModel>(
      widget.type as ModelType<TModel>,
      where: widget.where,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _stream,
      builder: widget.builder,
    );
  }
}