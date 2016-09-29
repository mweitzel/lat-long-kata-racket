# neighborhoods lat/long kata - in racket

# installing racket

First, follow instructions at http://racket-lang.org/

This project assumes `racket` is in your `$PATH`. You can check with:

```sh
which racket
```

If `~/usr/bin` is already in your path, you can add racket by running:

```sh
ln -s /Applications/Racket\ v6.6/bin/racket ~/bin/racket
```

# running code

With the project root as your working directory, call the library with

```sh
./bin/main test/points.txt
```

Run the tests with

```sh
./bin/test
```

# description

You are working on a project for the City of Grand Rapids. They have provided you with latitude and longitude coordinate information defining the shapes of the city's neighborhoods. They want an application that, given the latitude and longitude of an address, tells them what neighborhood the address is part of.

A snapshot of a map of the neighborhoods is included to help you consider the constraints and shapes you'll be dealing with (see attached neighborhood_map.png).

Your application should:

* Read in the neighborhood shape data from a file (see attached gr_neighborhoods.txt)
* Read in the points to classify from a file (example below)
* Print out the neighborhood for each point (example below)
* Keep performance and correct results in mind

Keep in mind the goal of this challenge: impress us with your ability to problem solve, learn to apply new tools to a tricky situation, and deliver something of value to the customer. Complete software is less important to us than understanding what you've learned, challenges you faced, and seeing your approach to the situation.
