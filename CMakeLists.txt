##==================================================================================================
##  PROJECT - Witty Description of the project
##  Copyright 2020 Joel FALCOU
##
##  Licensed under the MIT License <http://opensource.org/licenses/MIT>.
##  SPDX-License-Identifier: MIT
##==================================================================================================
cmake_minimum_required(VERSION 3.5)

##==================================================================================================
## Setup project
##==================================================================================================
project(PROJECT VERSION 0.1 LANGUAGES CXX)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

##==================================================================================================
## Prevent in-source build
##==================================================================================================
if(${PROJECT_SOURCE_DIR} STREQUAL ${PROJECT_BINARY_DIR})
  message( FATAL_ERROR "[project_name] Building in-source, not recommended! Build in a separate directory." )
endif()

##==================================================================================================
## Find required packages
##==================================================================================================
# find_package( ??? )

##==================================================================================================
## Add src CMake's
##==================================================================================================
add_subdirectory(${PROJECT_SOURCE_DIR}/src)

##==================================================================================================
## Options
##==================================================================================================
option( PROJECT_BUILD_TEST    "Build tests for project_name"     ON  )
option( PROJECT_BUILD_DOC     "Build doc for project_name"       ON  )
option( PROJECT_IS_DEPENDENT  "Dependent mode for project_name"  OFF )

##==================================================================================================
## Setup Documentation
##==================================================================================================
if( PROJECT_BUILD_DOC )
  add_subdirectory(doc)
endif()

##==================================================================================================
## Setup Install target only if not used as dependent
##==================================================================================================
# UNCOMMENT WHEN SOMETHING CAN BE INSTALLED
# if( NOT PROJECT_IS_DEPENDENT )
#   include(install)
# else()
#   message(STATUS "[project_name] PROJECT is used as a in-project dependency - No install targets available")
# endif()

##==================================================================================================
## Setup Testing
##==================================================================================================
if( PROJECT_BUILD_TEST )
  enable_testing()
  include(CTest)
  add_custom_target(tests)
  add_custom_target(unit)

  add_dependencies(tests unit)
  add_subdirectory(test)
endif()
