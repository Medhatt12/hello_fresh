import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../providers/dummy_data.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BuildWelcomingWidget extends StatelessWidget {
  
  final BuildContext context;
  final double mediaQuery;

  const BuildWelcomingWidget({
    @required this.context,
    @required this.mediaQuery,
  });
  
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Data>(context);
    final userData = data.getUser;

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 17, right: 5, top: 10),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hello ' + userData.firstName + '!',
                style: Theme.of(context).textTheme.title,
              ),
              Text(
                'Today is ' +
                    DateFormat('EEEE, dd. MMMM').format(DateTime.now()),
                style: Theme.of(context).textTheme.subtitle,
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Box Settings',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CupertinoButton(
                    child: Text('Edit',
                        style: TextStyle(
                          color: Colors.green[800],
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}