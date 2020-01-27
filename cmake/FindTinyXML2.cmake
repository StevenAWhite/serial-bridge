##################################################################################################
#
# CMake script for finding TinyXML2.
#
# Input variables:
#
# - TinyXML2_ROOT_DIR (optional): When specified, header files and libraries will be searched for in
#     ${TinyXML2_ROOT_DIR}/include
#     ${TinyXML2_ROOT_DIR}/libs
#   respectively, and the default CMake search order will be ignored. When unspecified, the default
#   CMake search order is used.
#   This variable can be specified either as a CMake or environment variable. If both are set,
#   preference is given to the CMake variable.
#   Use this variable for finding packages installed in a nonstandard location, or for enforcing
#   that one of multiple package installations is picked up.
#
#
# Cache variables (not intended to be used in CMakeLists.txt files)
#
# - TinyXML2_INCLUDE_DIR: Absolute path to package headers.
# - TinyXML2_LIBRARY: Absolute path to library.
#
#
# Output variables:
#
# - TinyXML2_FOUND: Boolean that indicates if the package was found
# - TinyXML2_INCLUDE_DIRS: Paths to the necessary header files
# - TinyXML2_LIBRARIES: Package libraries
#
#
# Example usage:
#
#  find_package(TinyXML2)
#  if(NOT TinyXML2_FOUND)
#    # Error handling
#  endif()
#  ...
#  include_directories(${TinyXML2_INCLUDE_DIRS} ...)
#  ...
#  target_link_libraries(my_target ${TinyXML2_LIBRARIES})
#
##################################################################################################

# Get package location hint from environment variable (if any)
if (NOT TinyXML2_ROOT_DIR AND DEFINED ENV{TinyXML2_ROOT_DIR})
    set(TinyXML2_ROOT_DIR "$ENV{TinyXML2_ROOT_DIR}" CACHE PATH
            "TinyXML2 base directory location (optional, used for nonstandard installation paths)")
endif ()

# Search path for nonstandard package locations
if (TinyXML2_ROOT_DIR)
    set(TinyXML2_INCLUDE_PATH PATHS "${TinyXML2_ROOT_DIR}/include" NO_DEFAULT_PATH)
endif ()

# Find headers and libraries
find_path(TinyXML2_INCLUDE_DIR NAMES tinyxml2.h PATH_SUFFIXES "tinyxml2" ${TinyXML2_INCLUDE_PATH})

mark_as_advanced(TinyXML2_INCLUDE_DIR)

# Output variables generation
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(TinyXML2 DEFAULT_MSG TinyXML2_INCLUDE_DIR)

set(TinyXML2_FOUND ${TINYXML2_FOUND})
unset(TINYXML2_FOUND)

if (TinyXML2_FOUND)
    set(TinyXML2_INCLUDE_DIRS ${TinyXML2_INCLUDE_DIR})
endif ()