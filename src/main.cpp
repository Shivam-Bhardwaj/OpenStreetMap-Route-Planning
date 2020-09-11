#include <optional>
#include <fstream>
#include <iostream>
#include <vector>
#include <string>
#include <io2d.h>
#include "route_model.h"
#include "render.h"
#include "route_planner.h"

using namespace std::experimental;
using std::cout;
using std::cin;
using std::endl;


// Function to read the OSM file and store the data in the desired vector
static std::optional <std::vector<std::byte>>
ReadFile(const std::string &path) {
  std::ifstream is{path, std::ios::binary | std::ios::ate};
  if (!is)
    return std::nullopt;

  auto size = is.tellg();
  std::vector <std::byte> contents(size);

  is.seekg(0);
  is.read((char *) contents.data(), size);

  if (contents.empty())
    return std::nullopt;
  return std::move(contents);
}

// Function to get the query points from the user
static float FromUserInput(const std::string name) {
  float value = -1;
  std::string input;
  while (value < 0 || value > 100) {
    std::cout << "Enter " << name << " in range of 0 to 100: ";
    std::cin >> input;
    try {
      value = std::stoi(input);
    } catch (...) {
      // ignore bad input, and repeat
    }
  }
  std::cout << name << " is " << value << std::endl;
  return value;
}

// The main function
int main(int argc, const char **argv) {
  std::string osm_data_file = "";
  if (argc > 1) {
    for (int i = 1; i < argc; ++i)
      if (std::string_view{argv[i]} == "-f" && ++i < argc)
        osm_data_file = argv[i];
  } else {
    std::cout << "To specify a map file use the following format: "
              << std::endl;
    std::cout << "Usage: [executable] [-f filename.osm]" << std::endl;
    osm_data_file = "../map.osm";
  }

  std::vector <std::byte> osm_data;

  if (osm_data.empty() && !osm_data_file.empty()) {
    std::cout << "Reading OpenStreetMap data from the following file: "
              << osm_data_file << std::endl;
    auto data = ReadFile(osm_data_file);
    if (!data)
      std::cout << "Failed to read." << std::endl;
    else
      osm_data = std::move(*data);
  }

  // Get the data from the user
  float start_x = FromUserInput("start x");
  float start_y = FromUserInput("start y");
  float end_x = FromUserInput("end x");
  float end_y = FromUserInput("end y");



  // Build Model.
  RouteModel model{osm_data};

  // Create RoutePlanner object and perform A* search.
  RoutePlanner route_planner{model, start_x, start_y, end_x, end_y};
  route_planner.AStarSearch();

  std::cout << "Distance: " << route_planner.GetDistance() << " meters. \n";

  // Render results of search.
  Render render{model};

  // Code for displaying the results in IO2D library
  auto display = io2d::output_surface{400, 400, io2d::format::argb32,
                                      io2d::scaling::none,
                                      io2d::refresh_style::fixed, 30};
  display.size_change_callback([](io2d::output_surface &surface) {
    surface.dimensions(surface.display_dimensions());
  });
  display.draw_callback([&](io2d::output_surface &surface) {
    render.Display(surface);
  });
  display.begin_show();
}
