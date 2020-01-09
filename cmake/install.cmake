##==================================================================================================
##  PROJECT - Witty Description of the project
##  Copyright 2020 Joel FALCOU
##
##  Licensed under the MIT License <http://opensource.org/licenses/MIT>.
##  SPDX-License-Identifier: MIT
##==================================================================================================

##==================================================================================================
## Install process
##==================================================================================================
include(GNUInstallDirs)
set(INSTALL_CONFIGDIR ${CMAKE_INSTALL_LIBDIR}/cmake/project_name)

install(TARGETS project_name
    EXPORT project_name-targets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

##==================================================================================================
## This is required so that the exported target has the name PROJECT and not project_name
##==================================================================================================
set_target_properties(project_name PROPERTIES EXPORT_NAME project_name)

install ( DIRECTORY ${PROJECT_SOURCE_DIR}/include/project_name
          DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
        )

##==================================================================================================
## Export the targets to a script
##==================================================================================================
install(EXPORT project_name-targets
  FILE
    project_nameTargets.cmake
  NAMESPACE
    project_name::
  DESTINATION
    ${INSTALL_CONFIGDIR}
)

##==================================================================================================
## Create a ConfigVersion.cmake file
##==================================================================================================
include(CMakePackageConfigHelpers)
write_basic_package_version_file(
    ${CMAKE_CURRENT_BINARY_DIR}/project_nameConfigVersion.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY AnyNewerVersion
)

configure_package_config_file(${CMAKE_CURRENT_LIST_DIR}/project_nameConfig.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/project_nameConfig.cmake
    INSTALL_DESTINATION ${INSTALL_CONFIGDIR}
)

##==================================================================================================
##Install the config, configversion and custom find modules
##==================================================================================================
install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/project_nameConfig.cmake
    ${CMAKE_CURRENT_BINARY_DIR}/project_nameConfigVersion.cmake
    DESTINATION ${INSTALL_CONFIGDIR}
)

##==================================================================================================
## Exporting from the build tree
##==================================================================================================
export(EXPORT project_name-targets FILE ${CMAKE_CURRENT_BINARY_DIR}/project_nameTargets.cmake NAMESPACE project_name::)

##==================================================================================================
## Register package in user's package registry
##==================================================================================================
export(PACKAGE project_name)
