import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify_desktop_1/data/data.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 280.0,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Image.network(
                  'https://logodownload.org/wp-content/uploads/2016/09/Spotify-logo-4.png',
                  height: 60,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
          SideMenuIconTab(
            iconData: Icons.home,
            title: 'Home',
            onTap: () {},
          ),
          SideMenuIconTab(
            iconData: Icons.search,
            title: 'Search',
            onTap: () {},
          ),
          SideMenuIconTab(
            iconData: Icons.audiotrack,
            title: 'Radio',
            onTap: () {},
          ),
          const SizedBox(
            height: 12,
          ),
          _LibraryPlaylists()
        ],
      ),
    );
  }
}

class SideMenuIconTab extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;

  const SideMenuIconTab(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Theme.of(context).iconTheme.color,
        size: 28,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}

class _LibraryPlaylists extends StatefulWidget {
  const _LibraryPlaylists({Key? key}) : super(key: key);

  @override
  __LibraryPlaylistsState createState() => __LibraryPlaylistsState();
}

class __LibraryPlaylistsState extends State<_LibraryPlaylists> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(vertical: 12),
          physics: const ClampingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'YOUR LIBRARY',
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...yourLibrary
                    .map((e) => ListTile(
                          dense: true,
                          title: Text(
                            e,
                            style: Theme.of(context).textTheme.bodyText2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () {},
                        ))
                    .toList()
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'PLAYLISTS',
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...playlists
                    .map((e) => ListTile(
                          dense: true,
                          title: Text(
                            e,
                            style: Theme.of(context).textTheme.bodyText2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () {},
                        ))
                    .toList()
              ],
            )
          ],
        ),
      ),
    );
  }
}
