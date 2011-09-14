##############################################################################
# @file  ConfigSettings.cmake
# @brief Sets variables used in CMake package configuration of build tree.
#
# It is suggested to use _CONFIG as suffix for variable names that are to be
# substituted in the Config.cmake.in template file in order to distinguish
# these variables from the build configuration.
#
# @note The default build tree configuration is included prior to this file.
#       Hence, the variables are valid even if a custom configuration is used
#       and default values can be overwritten in this file.
#
# Copyright (c) 2011 University of Pennsylvania. All rights reserved.
# See https://www.rad.upenn.edu/sbia/software/license.html or COPYING file.
#
# Contact: SBIA Group <sbia-software at uphs.upenn.edu>
##############################################################################

# ============================================================================
# build tree configuration settings
# ============================================================================

if (BUILD_CONFIG_SETTINGS)
    # CMake module path
    set (MODULE_PATH_CONFIG "${PROJECT_CODE_DIR}/cmake")

    # path to templates files
    set (CXX_TEMPLATES_DIR_CONFIG  "${PROJECT_CODE_DIR}/utilities/cxx")
    set (BASH_TEMPLATES_DIR_CONFIG "${PROJECT_CODE_DIR}/utilities/bash")

    # libraries
    basis_get_target_location (UTILS_LIBRARY_CONFIG     basis_utils)
    basis_get_target_location (TEST_LIBRARY_CONFIG      basis_test)
    basis_get_target_location (TEST_MAIN_LIBRARY_CONFIG basis_test_main)

    # URL of project template
    set (TEMPLATE_URL_CONFIG "${PROJECT_ETC_DIR}/template")

    return ()
endif ()

# ============================================================================
# installation configuration settings
# ============================================================================

# CMake module path
basis_set_config_path (MODULE_PATH_CONFIG "${INSTALL_MODULES_DIR}")

# path to templates files
basis_set_config_path (CXX_TEMPLATES_DIR_CONFIG  "${INSTALL_CXX_TEMPLATES_DIR}")
basis_set_config_path (BASH_TEMPLATES_DIR_CONFIG "${INSTALL_BASH_TEMPLATES_DIR}")

# libraries
file (
  RELATIVE_PATH LIB_DIR
    "${INSTALL_PREFIX}/${INSTALL_CONFIG_DIR}"
    "${INSTALL_PREFIX}/${INSTALL_ARCHIVE_DIR}"
)
string (REGEX REPLACE "/$" "" LIB_DIR "${LIB_DIR}")

basis_get_target_location (UTILS_LIBRARY_CONFIG basis_utils NAME)
set (UTILS_LIBRARY_CONFIG "\${CMAKE_CURRENT_LIST_DIR}/${LIB_DIR}/${UTILS_LIBRARY_CONFIG}")

basis_get_target_location (TEST_LIBRARY_CONFIG basis_test NAME)
set (TEST_LIBRARY_CONFIG "\${CMAKE_CURRENT_LIST_DIR}/${LIB_DIR}/${TEST_LIBRARY_CONFIG}")

basis_get_target_location (TEST_MAIN_LIBRARY_CONFIG basis_test_main NAME)
set (TEST_MAIN_LIBRARY_CONFIG "\${CMAKE_CURRENT_LIST_DIR}/${LIB_DIR}/${TEST_MAIN_LIBRARY_CONFIG}")

# URL of project template
basis_set_config_path (TEMPLATE_URL_CONFIG "${INSTALL_TEMPLATE_DIR}")
