# neighborhoods lat/long kata - in racket

### installing racket

First, follow instructions at http://racket-lang.org/

This project assumes `racket` is in your `$PATH`. You can check with:

```sh
which racket
```

If `~/usr/bin` is already in your path, you can add racket by running:

```sh
ln -s /Applications/Racket\ v6.6/bin/racket ~/bin/racket
```

### running code

With the project root as your working directory, call the library with

```sh
./bin/main test/points.txt
```

Run the tests with

```sh
./bin/test
```

### description

You are working on a project for the City of Grand Rapids. They have provided you with latitude and longitude coordinate information defining the shapes of the city's neighborhoods. They want an application that, given the latitude and longitude of an address, tells them what neighborhood the address is part of.

A snapshot of a map of the neighborhoods is included to help you consider the constraints and shapes you'll be dealing with (see attached neighborhood_map.png).

Your application should:

* Read in the neighborhood shape data from a file (see attached gr_neighborhoods.txt)
* Read in the points to classify from a file (example below)
* Print out the neighborhood for each point (example below)
* Keep performance and correct results in mind

Keep in mind the goal of this challenge: impress us with your ability to problem solve, learn to apply new tools to a tricky situation, and deliver something of value to the customer. Complete software is less important to us than understanding what you've learned, challenges you faced, and seeing your approach to the situation.

### test data

#### note this data is also availble in `test/points.txt` and `test/results.txt`

Test data points:

```text
Point 1: -85.646282,42.912051
Point 2: -85.646726,42.913097
Point 3: -85.658789,42.951338
Point 4: -85.686883,42.936334
Point 5: -85.684714,42.955808
Point 6: -85.664841,42.965190
Point 7: -85.659444,42.970373
Point 8: -85.661254,42.967824
Point 9: -85.629390,42.957158
Point 10: -85.657041,43.000296
Point 11: -85.655408,42.999395
Point 12: -85.655452,42.998219
```

Expected results:

```text
Point 1: ken-O-Sha Park
Point 2: Alger Heights
Point 3: Southeast Community
Point 4: <none>
Point 5: John Ball Park
Point 6: Oldtown-Heartside
Point 7: Bellknap Lookout
Point 8: Heritage Hill
Point 9: <none>
Point 10: Creston
Point 11: North End
Point 12: Creston
```
