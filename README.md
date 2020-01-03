# Route Planning Project

[![Udacity - Self-Driving Car NanoDegree](https://s3.amazonaws.com/udacity-sdc/github/shield-carnd.svg)](http://www.udacity.com/drive) <img src="https://engineering.nyu.edu/sites/default/files/2019-01/tandon_long_color.png" alt="NYU Logo" width="130" height="whatever">

The following project is a part of Udacity’s C++ NanoDegree program. The aim of project is to successfully find the shortest path between two points on the map.

- Map data from OSM XML file is parsed and the optimal path is plotted using IO2D Library in C++; 
- Used GoogleTest Framework for unit testing.

<img src="map.png" width="600" height="450" />

The Project
---

The steps of this project are the following:

* Parsing the data from OpenStreetMap file (.OSM xml file)
* The user inputs two points on the map and initial and final points
* Route planner is executed
  * Based on the points input by the user, the closest initial and final nodes are found.
  * A list of feasible open nodes is updated.
  * Based on a heuristic value and the distance from the start node, next node is popped.
  * From the popped node, the open list is again updated.
* The process is repeated till either the next node is the goal, or the open list is exhausted.
* The path is returned and plotted used IO2D library.



## Cloning

When cloning this project, be sure to use the `--recurse-submodules` flag. 
```
git clone https://github.com/Shivam-Bhardwaj/OpenStreetMap-Route-Planning --recurse-submodules
```
## Dependencies for Running
* cmake >= 3.11.3
  * All OSes: [click here for installation instructions](https://cmake.org/install/)
* make >= 4.1 (Linux, Mac), 3.81 (Windows)
  * Linux: make is installed by default on most Linux distros
  * Mac: [install Xcode command line tools to get make](https://developer.apple.com/xcode/features/)
  * Windows: [Click here for installation instructions](http://gnuwin32.sourceforge.net/packages/make.htm)
* gcc/g++ >= 7.4.0
  * Linux: gcc / g++ is installed by default on most Linux distros
  * Mac: same instructions as make - [install Xcode command line tools](https://developer.apple.com/xcode/features/)
  * Windows: recommend using [MinGW](http://www.mingw.org/)
* IO2D
  * Installation instructions for all operating systems can be found [here](https://github.com/cpp-io2d/P0267_RefImpl/blob/master/BUILDING.md)
  * This library must be built in a place where CMake `find_package` will be able to find it

## Compiling and Running

### Compiling
To compile the project, first, create a `build` directory and change to that directory:
```
mkdir build && cd build
```
From within the `build` directory, then run `cmake` and `make` as follows:
```
cmake ..
make
```
### Running
The executable will be placed in the `build` directory. From within `build`, you can run the project as follows:
```
./OSM_A_star_search
```
Or to specify a map file:
```
./OSM_A_star_search -f ../<your_osm_file.osm>
```

## Testing

The testing executable is also placed in the `build` directory. From within `build`, you can run the unit tests as follows:
```
./test
```

The code was tested on the following specifications

- **CPU:** `Intel(R) Core(TM) i9-8950HK CPU @ 4.8 Ghz`
- **GPU:** `Nvidia GeForce GTX 1050 Ti Mobile`
- **OS:** `Ubuntu 16.04.6 LTS (Xenial Xerus)` 
- **Kernal:** `4.15.0-48-generic`