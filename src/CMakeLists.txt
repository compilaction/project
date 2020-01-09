##==================================================================================================
##  PROJECT - Witty Description of the project
##  Copyright 2020 Joel FALCOU
##
##  Licensed under the MIT License <http://opensource.org/licenses/MIT>.
##  SPDX-License-Identifier: MIT
##==================================================================================================

## UNCOMMENT WHEN SOURCES ARE SETUP
# add_library ( project_name SHARED
#               # LIST OF SRC FILES TO BUILD THE LIBPROJECT
#             )

# add_library(project_name::project_name ALIAS project_name)

# if( MSVC )
#   set( options /std:c++latest /W3 /EHsc)
# else()
#   set( options -std=c++17 -Wall -Wno-missing-braces -fvisibility=hidden)
# endif()

# set_target_properties( project_name PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/unit" )

# target_compile_definitions(project_name PRIVATE PROJECT_API_EXPORTS=1)

# target_include_directories(project_name
#     PUBLIC
#         $<INSTALL_INTERFACE:include>
#         $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>
#     PRIVATE
#         ${PROJECT_SOURCE_DIR}/src
# )

# target_compile_options( project_name PRIVATE ${options} )
