// The current database to use.
use('local');

// Search for documents in the current collection.
db.getCollection('OfficiatingDatabase').find({});

  db.getCollection('OfficiatingDatabase')
    .find({},
      {
        _id:0,
        "gameDateTime":1,
        "homeTeamName":1,
        "visitingTeamName":1,
        "siteName":1,
        "Officials":1
      }
    );
