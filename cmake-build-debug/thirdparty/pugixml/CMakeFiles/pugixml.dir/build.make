# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/shivam/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/193.5662.56/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/shivam/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/193.5662.56/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/shivam/workplace/OpenStreetMap-Route-Planning

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/shivam/workplace/OpenStreetMap-Route-Planning/cmake-build-debug

# Include any dependencies generated for this target.
include thirdparty/pugixml/CMakeFiles/pugixml.dir/depend.make

# Include the progress variables for this target.
include thirdparty/pugixml/CMakeFiles/pugixml.dir/progress.make

# Include the compile flags for this target's objects.
include thirdparty/pugixml/CMakeFiles/pugixml.dir/flags.make

thirdparty/pugixml/CMakeFiles/pugixml.dir/src/pugixml.cpp.o: thirdparty/pugixml/CMakeFiles/pugixml.dir/flags.make
thirdparty/pugixml/CMakeFiles/pugixml.dir/src/pugixml.cpp.o: ../thirdparty/pugixml/src/pugixml.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/shivam/workplace/OpenStreetMap-Route-Planning/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object thirdparty/pugixml/CMakeFiles/pugixml.dir/src/pugixml.cpp.o"
	cd /home/shivam/workplace/OpenStreetMap-Route-Planning/cmake-build-debug/thirdparty/pugixml && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pugixml.dir/src/pugixml.cpp.o -c /home/shivam/workplace/OpenStreetMap-Route-Planning/thirdparty/pugixml/src/pugixml.cpp

thirdparty/pugixml/CMakeFiles/pugixml.dir/src/pugixml.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pugixml.dir/src/pugixml.cpp.i"
	cd /home/shivam/workplace/OpenStreetMap-Route-Planning/cmake-build-debug/thirdparty/pugixml && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/shivam/workplace/OpenStreetMap-Route-Planning/thirdparty/pugixml/src/pugixml.cpp > CMakeFiles/pugixml.dir/src/pugixml.cpp.i

thirdparty/pugixml/CMakeFiles/pugixml.dir/src/pugixml.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pugixml.dir/src/pugixml.cpp.s"
	cd /home/shivam/workplace/OpenStreetMap-Route-Planning/cmake-build-debug/thirdparty/pugixml && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/shivam/workplace/OpenStreetMap-Route-Planning/thirdparty/pugixml/src/pugixml.cpp -o CMakeFiles/pugixml.dir/src/pugixml.cpp.s

# Object files for target pugixml
pugixml_OBJECTS = \
"CMakeFiles/pugixml.dir/src/pugixml.cpp.o"

# External object files for target pugixml
pugixml_EXTERNAL_OBJECTS =

../lib/libpugixml.a: thirdparty/pugixml/CMakeFiles/pugixml.dir/src/pugixml.cpp.o
../lib/libpugixml.a: thirdparty/pugixml/CMakeFiles/pugixml.dir/build.make
../lib/libpugixml.a: thirdparty/pugixml/CMakeFiles/pugixml.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/shivam/workplace/OpenStreetMap-Route-Planning/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library ../../../lib/libpugixml.a"
	cd /home/shivam/workplace/OpenStreetMap-Route-Planning/cmake-build-debug/thirdparty/pugixml && $(CMAKE_COMMAND) -P CMakeFiles/pugixml.dir/cmake_clean_target.cmake
	cd /home/shivam/workplace/OpenStreetMap-Route-Planning/cmake-build-debug/thirdparty/pugixml && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pugixml.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
thirdparty/pugixml/CMakeFiles/pugixml.dir/build: ../lib/libpugixml.a

.PHONY : thirdparty/pugixml/CMakeFiles/pugixml.dir/build

thirdparty/pugixml/CMakeFiles/pugixml.dir/clean:
	cd /home/shivam/workplace/OpenStreetMap-Route-Planning/cmake-build-debug/thirdparty/pugixml && $(CMAKE_COMMAND) -P CMakeFiles/pugixml.dir/cmake_clean.cmake
.PHONY : thirdparty/pugixml/CMakeFiles/pugixml.dir/clean

thirdparty/pugixml/CMakeFiles/pugixml.dir/depend:
	cd /home/shivam/workplace/OpenStreetMap-Route-Planning/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/shivam/workplace/OpenStreetMap-Route-Planning /home/shivam/workplace/OpenStreetMap-Route-Planning/thirdparty/pugixml /home/shivam/workplace/OpenStreetMap-Route-Planning/cmake-build-debug /home/shivam/workplace/OpenStreetMap-Route-Planning/cmake-build-debug/thirdparty/pugixml /home/shivam/workplace/OpenStreetMap-Route-Planning/cmake-build-debug/thirdparty/pugixml/CMakeFiles/pugixml.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : thirdparty/pugixml/CMakeFiles/pugixml.dir/depend

