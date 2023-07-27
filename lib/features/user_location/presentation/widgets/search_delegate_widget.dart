import 'package:cipher/features/google_maps/presentation/cubit/user_location_cubit.dart';
import 'package:cipher/features/user_location/presentation/choose_location_page.dart';
import 'package:cipher/features/user_location/presentation/google_maps_bloc/google_maps_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class SearchDelegateWidget extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        color: theme.scaffoldBackgroundColor,
        elevation: 0,
      ),
    );
  }

  @override
  String? get searchFieldLabel => "Enter to Search Location";
  @override
  TextStyle? get searchFieldStyle => TextStyle(
        color: Colors.grey.shade700,
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
        fontFamily: "Poppins",
      );

  @override
  InputDecorationTheme? get searchFieldDecorationTheme =>
      super.searchFieldDecorationTheme;
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
              }
            },
            icon: Icon(
              Icons.clear,
              color: Colors.grey.shade900,
            ))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, null),
        icon: Icon(
          Icons.arrow_back,
          color: Colors.grey.shade900,
        ),
      );

  @override
  Widget buildResults(BuildContext context) {
    return BlocBuilder<GoogleMapsBloc, GoogleMapsState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.autoCompleteQueries.length,
          itemBuilder: (context, index) {
            if (state.autoCompleteQueries.length < 1) {
              return Center(
                child: Text("No Results Found."),
              );
            }
            final _suggestion =
                state.autoCompleteQueries[index].description as String;
            return ListTile(
              leading: Icon(Icons.location_on),
              trailing: Icon(Icons.arrow_outward_rounded),
              title: Text(
                _suggestion,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () async {
                query = _suggestion;
                await context
                    .read<UserLocationCubit>()
                    .setTempLocation(address: _suggestion)
                    .whenComplete(
                      () => Future.delayed(
                        Duration(
                          milliseconds: 80,
                        ),
                        () => Navigator.pushNamed(
                          context,
                          ChooseLocationPage.routeName,
                        ),
                      ),
                    );

                // buildResults(context);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    }
    context.read<GoogleMapsBloc>().add(
          GoogleMapsSearchQueryInitiated(query: query),
        );
    return BlocBuilder<GoogleMapsBloc, GoogleMapsState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.autoCompleteQueries.length,
          itemBuilder: (context, index) {
            if (state.autoCompleteQueries.length < 1) {
              return Center(
                child: Text("No Results Found."),
              );
            }
            final _suggestion =
                state.autoCompleteQueries[index].description as String;
            return ListTile(
              leading: Icon(Icons.location_on),
              trailing: Icon(Icons.arrow_outward_rounded),
              title: Text(
                _suggestion,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () async {
                query = _suggestion;
                await context
                    .read<UserLocationCubit>()
                    .setTempLocation(address: _suggestion)
                    .whenComplete(
                      () => Future.delayed(
                        Duration(
                          milliseconds: 80,
                        ),
                        () => Navigator.pushNamed(
                          context,
                          ChooseLocationPage.routeName,
                        ),
                      ),
                    );

                // buildResults(context);
              },
            );
          },
        );
      },
    );
  }
}
