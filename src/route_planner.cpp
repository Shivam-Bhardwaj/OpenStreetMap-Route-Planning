/*
 * The following code is the actual implementation of the A* algorithm for path planning
 */

#include "route_planner.h"
#include <algorithm>

using std::sort;

RoutePlanner::RoutePlanner(RouteModel &model, float start_x, float start_y, float end_x, float end_y) : m_Model(model) {
    // Convert inputs to percentage:
    start_x *= 0.01;
    start_y *= 0.01;
    end_x *= 0.01;
    end_y *= 0.01;

    // Using the m_Model.FindClosestNode method to find the closest nodes to the starting and ending coordinates.
    // Stores the nodes you find in the RoutePlanner's start_node and end_node attributes.
    start_node = &m_Model.FindClosestNode(start_x, start_y);
    end_node = &m_Model.FindClosestNode(end_x, end_y);
}


// Calculating the Heuristic value for a particular node
// Using the distance to the end_node for the h value.
// Node objects have a distance function to determine the distance to another node.
float RoutePlanner::CalculateHValue(RouteModel::Node const *node) {
    return node->distance(*end_node);
}


// AddNeighbors function is used to expand the current node by adding all unvisited neighbors to the open list.
void RoutePlanner::AddNeighbors(RouteModel::Node *current_node) {
// Use the FindNeighbors() method of the current_node to populate current_node.neighbors vector with all the neighbors.
    current_node->FindNeighbors();

// For each node in current_node.neighbors, set the parent, the h_value, the g_value.
    for (auto i : current_node->neighbors) {
        i->parent = current_node;
        i->g_value = current_node->g_value + current_node->distance(*i);
        i->h_value = CalculateHValue(i);
// For each node in current_node.neighbors, add the neighbor to open_list and set the node's visited attribute to true.

        open_list.push_back(i);
        i->visited = true;
    }
}


// NextNode function:  to sort the open list and return the next node.
RouteModel::Node *RoutePlanner::NextNode() {
    // - Sort the open_list according to the sum of the h value and g value.
    sort(open_list.begin(), open_list.end(),
            // Lambda comparator function
         [](auto const &a, auto const &b) {
             return (a->g_value + a->h_value) > (b->g_value + b->h_value);
         });

    // Create a pointer to the node in the list with the lowest sum.
    auto node = open_list.back();

    // Remove that node from the open_list.
    open_list.pop_back();

    // Return the pointer.
    return node;
}


/*
 * ConstructFinalPath function: to return the final path found from your A* search.
 * This method should take the current (final) node as an argument and iteratively follow the
 * chain of parents of nodes until the starting node is found.
 * For each node in the chain, add the distance from the node to its parent to the distance variable.
 */
std::vector<RouteModel::Node> RoutePlanner::ConstructFinalPath(RouteModel::Node *current_node) {

    // Create path_found vector
    distance = 0.0f;
    std::vector<RouteModel::Node> path_found;

    // TO DO: Implement your solution here.
    while (current_node->parent != nullptr) {
        path_found.push_back(*current_node);
        distance += current_node->distance(*current_node->parent);
        current_node = current_node->parent;
    }
    path_found.push_back(*current_node);

    // The returned vector should be in the correct order: the start node should be the first element
    // of the vector, the end node should be the last element. Hence have to sort the vector.
    std::reverse(path_found.begin(), path_found.end());

    distance *= m_Model.MetricScale(); // Multiply the distance by the scale of the map to get meters.
    return path_found;

}

// The A* Search algorithm
void RoutePlanner::AStarSearch() {
    RouteModel::Node *current_node = nullptr;
    start_node->visited = true;
    open_list.push_back(start_node);
    while (open_list.size() > 0) {
        // NextNode() method to sort the open_list and return the next node.
        current_node = NextNode();
        if (current_node->distance(*end_node) == 0) {
            // Store the final path in the m_Model.path attribute before the method exits.
            // This path will then be displayed on the map tile.
            m_Model.path = ConstructFinalPath(current_node);
            // When the search has reached the end_node, use the ConstructFinalPath method
            // to return the final path that was found.
            return;
        } else {
            // Use the AddNeighbors method to add all of the neighbors of the current node to the open_list.
            AddNeighbors(current_node);
        }
    }
}