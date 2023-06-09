// home screen contents
import 'package:dynasty_gm_flutter/src/config/image_constants.dart';
import 'package:dynasty_gm_flutter/src/config/string_constants.dart'
    as string_constants;
import 'package:dynasty_gm_flutter/src/utils/app_state_notifier.dart';
import 'package:dynasty_gm_flutter/src/widgets/cache_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared/main.dart';

class HomeScreen extends StatelessWidget {
  // ignore: close_sinks
  final AuthenticationBloc authenticationBloc =
      AuthenticationBlocController().authenticationBloc;

  @override
  Widget build(BuildContext context) {
    authenticationBloc.add(GetUserData());
    return WillPopScope(
        onWillPop: () async => false,
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            bloc: authenticationBloc,
            builder: (BuildContext context, AuthenticationState state) {
              if (state is SetUserData) {
                return Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: Text(
                      string_constants.app_bar_title,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    actions: [
                      IconButton(
                          icon: Icon(Icons.logout),
                          onPressed: () {
                            authenticationBloc.add(UserLogOut());
                          }),
                    ],
                  ),
                  body: Center(
                    child: Text('/home'),
                  ),
                  drawer: Drawer(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        DrawerHeader(
                          decoration: BoxDecoration(
                            color: Theme.of(context).dividerColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white),
                                    child: CachedImage(
                                      imageUrl:
                                          state.currentUserData.data.avatar,
                                      fit: BoxFit.fitWidth,
                                      errorWidget: Image.network(
                                        AllImages().kDefaultImage,
                                      ),
                                      width: 80,
                                      height: 80,
                                      placeholder: CircularProgressIndicator(),
                                    ),
                                  ),
                                  Switch(
                                    value:
                                        Provider.of<AppStateNotifier>(context)
                                            .isDarkMode,
                                    onChanged: (value) {
                                      Provider.of<AppStateNotifier>(context,
                                              listen: false)
                                          .updateTheme(value);
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        ListTile(
                          title: Text(
                              '${state.currentUserData.data.firstName} ${state.currentUserData.data.lastName}',
                              style: Theme.of(context).textTheme.bodyText2),
                        ),
                        ListTile(
                          title: Text(state.currentUserData.data.email,
                              style: Theme.of(context).textTheme.bodyText2),
                        ),
                        ListTile(
                          title: Text(state.currentUserData.ad.company,
                              style: Theme.of(context).textTheme.bodyText2),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }));
  }
}
