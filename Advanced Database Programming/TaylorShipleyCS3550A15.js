//Assignment 15

use ('local')

//Question 1
db.zipcodes.aggregate([
  {
    $match: {
      state: "UT",
    },
  },
  {
    $group: {
      _id: "$city",
      pop: {
        $sum: "$pop",
      },
    },
  },
  {
    $sort: {
      pop: -1,
    },
  },
])

//Question 2
db.zipcodes.aggregate([
  {
    $match: {
      state: "CA",
    },
  },
  {
    $group: {
      _id: "$city",
      totalPop: {
        $sum: "$pop",
      },
    },
  },
  {
    $match: {
      totalPop: {
        $gt: 400 * 1000,
      },
    },
  },
])

//Question 3
db.zipcodes.aggregate([
  {
    $group: {
      _id: "$state",
      totalPop: {
        $sum: "$pop",
      },
    },
  },
  {
    $match: {
      totalPop: {
        $gt: 5 * 1000 * 1000,
      },
    },
  },
])

//Question 4
db.zipcodes.aggregate([
  {
    $match: {
      state: "WI",
    },
  },
  {
    $count: "# Cities in Wisconsin",
  },
])

//Question 5
db.zipcodes.aggregate([
  {
    $group: {
      _id: {
        state: "$state",
        city: "$city",
      },
      pop: {
        $sum: "$pop",
      },
    },
  },
  {
    $group: {
      _id: "$_id.state",
      avgCityPop: {
        $avg: "$pop",
      },
    },
  },
  {
    $sort: {
      avgCityPop: -1,
    },
  },
])

//Question 6
db.zipcodes.aggregate([
  {
    $group: {
      _id: {
        state: "$state",
        city: "$city",
      },
      pop: {
        $sum: "$pop",
      },
    },
  },
  {
    $sort: {
      pop: -1,
    },
  },
  {
    $group: {
      _id: "$_id.state",
      biggestCity: {
        $first: "$_id.city",
      },
    },
  },
])

//Question 7
db.zipcodes.aggregate([
  {
    $group: {
      _id: "$state",
      TotalZipCodes: {
        $sum: 1,
      },
    },
  },
  {
    $sort: {
      TotalZipCodes: 1,
    },
  },
  {
    $limit: 1,
  },
])

//Question 8
db.zipcodes.aggregate([
  {
    $project: {
      _id: 1,
      city: 1,
      long: {
        $first: "$loc",
      },
      state: 1,
    },
  },
  {
    $sort: {
      long: -1,
    },
  },
  {
    $limit: 1,
  },
])

//Question 9
db.zipcodes.aggregate([
  {
    $project: {
      _id: 1,
      city: 1,
      lat: {
        $last: "$loc",
      },
      state: 1,
    },
  },
  {
    $sort: {
      lat: 1,
    },
  },
  {
    $limit: 1,
  },
])

//Question 10
db.zipcodes.aggregate([
  {
    $project: {
      _id: 1,
      city: 1,
      long: {
        $first: "$loc",
      },
      lat: {
        $last: "$loc",
      },
      state: 1,
    },
  },
  {
    $project: {
      _id: 1,
      city: 1,
      long: 1,
      lat: {
        $multiply: ["$lat", -1],
      },
      state: 1,
    },
  },
  {
    $project: {
      _id: 1,
      city: 1,
      long: 1,
      lat: 1,
      xy: {
        $add: ["$lat", "$long"],
      },
      state: 1,
    },
  },
  {
    $sort: {
      xy: -1,
    },
  },
  {
    $limit: 1,
  },
  {
    $project: {
      _id: 1,
      city: 1,
      state: 1,
    },
  },
])