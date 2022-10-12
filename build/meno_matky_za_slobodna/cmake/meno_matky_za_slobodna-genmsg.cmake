# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "meno_matky_za_slobodna: 0 messages, 2 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(meno_matky_za_slobodna_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/laptop/catkin_ws/src/meno_matky_za_slobodna/srv/Draw.srv" NAME_WE)
add_custom_target(_meno_matky_za_slobodna_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "meno_matky_za_slobodna" "/home/laptop/catkin_ws/src/meno_matky_za_slobodna/srv/Draw.srv" ""
)

get_filename_component(_filename "/home/laptop/catkin_ws/src/meno_matky_za_slobodna/srv/Stop.srv" NAME_WE)
add_custom_target(_meno_matky_za_slobodna_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "meno_matky_za_slobodna" "/home/laptop/catkin_ws/src/meno_matky_za_slobodna/srv/Stop.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(meno_matky_za_slobodna
  "/home/laptop/catkin_ws/src/meno_matky_za_slobodna/srv/Draw.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/meno_matky_za_slobodna
)
_generate_srv_cpp(meno_matky_za_slobodna
  "/home/laptop/catkin_ws/src/meno_matky_za_slobodna/srv/Stop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/meno_matky_za_slobodna
)

### Generating Module File
_generate_module_cpp(meno_matky_za_slobodna
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/meno_matky_za_slobodna
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(meno_matky_za_slobodna_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(meno_matky_za_slobodna_generate_messages meno_matky_za_slobodna_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/laptop/catkin_ws/src/meno_matky_za_slobodna/srv/Draw.srv" NAME_WE)
add_dependencies(meno_matky_za_slobodna_generate_messages_cpp _meno_matky_za_slobodna_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/laptop/catkin_ws/src/meno_matky_za_slobodna/srv/Stop.srv" NAME_WE)
add_dependencies(meno_matky_za_slobodna_generate_messages_cpp _meno_matky_za_slobodna_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(meno_matky_za_slobodna_gencpp)
add_dependencies(meno_matky_za_slobodna_gencpp meno_matky_za_slobodna_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS meno_matky_za_slobodna_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(meno_matky_za_slobodna
  "/home/laptop/catkin_ws/src/meno_matky_za_slobodna/srv/Draw.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/meno_matky_za_slobodna
)
_generate_srv_eus(meno_matky_za_slobodna
  "/home/laptop/catkin_ws/src/meno_matky_za_slobodna/srv/Stop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/meno_matky_za_slobodna
)

### Generating Module File
_generate_module_eus(meno_matky_za_slobodna
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/meno_matky_za_slobodna
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(meno_matky_za_slobodna_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(meno_matky_za_slobodna_generate_messages meno_matky_za_slobodna_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/laptop/catkin_ws/src/meno_matky_za_slobodna/srv/Draw.srv" NAME_WE)
add_dependencies(meno_matky_za_slobodna_generate_messages_eus _meno_matky_za_slobodna_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/laptop/catkin_ws/src/meno_matky_za_slobodna/srv/Stop.srv" NAME_WE)
add_dependencies(meno_matky_za_slobodna_generate_messages_eus _meno_matky_za_slobodna_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(meno_matky_za_slobodna_geneus)
add_dependencies(meno_matky_za_slobodna_geneus meno_matky_za_slobodna_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS meno_matky_za_slobodna_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(meno_matky_za_slobodna
  "/home/laptop/catkin_ws/src/meno_matky_za_slobodna/srv/Draw.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/meno_matky_za_slobodna
)
_generate_srv_lisp(meno_matky_za_slobodna
  "/home/laptop/catkin_ws/src/meno_matky_za_slobodna/srv/Stop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/meno_matky_za_slobodna
)

### Generating Module File
_generate_module_lisp(meno_matky_za_slobodna
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/meno_matky_za_slobodna
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(meno_matky_za_slobodna_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(meno_matky_za_slobodna_generate_messages meno_matky_za_slobodna_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/laptop/catkin_ws/src/meno_matky_za_slobodna/srv/Draw.srv" NAME_WE)
add_dependencies(meno_matky_za_slobodna_generate_messages_lisp _meno_matky_za_slobodna_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/laptop/catkin_ws/src/meno_matky_za_slobodna/srv/Stop.srv" NAME_WE)
add_dependencies(meno_matky_za_slobodna_generate_messages_lisp _meno_matky_za_slobodna_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(meno_matky_za_slobodna_genlisp)
add_dependencies(meno_matky_za_slobodna_genlisp meno_matky_za_slobodna_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS meno_matky_za_slobodna_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(meno_matky_za_slobodna
  "/home/laptop/catkin_ws/src/meno_matky_za_slobodna/srv/Draw.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/meno_matky_za_slobodna
)
_generate_srv_nodejs(meno_matky_za_slobodna
  "/home/laptop/catkin_ws/src/meno_matky_za_slobodna/srv/Stop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/meno_matky_za_slobodna
)

### Generating Module File
_generate_module_nodejs(meno_matky_za_slobodna
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/meno_matky_za_slobodna
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(meno_matky_za_slobodna_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(meno_matky_za_slobodna_generate_messages meno_matky_za_slobodna_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/laptop/catkin_ws/src/meno_matky_za_slobodna/srv/Draw.srv" NAME_WE)
add_dependencies(meno_matky_za_slobodna_generate_messages_nodejs _meno_matky_za_slobodna_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/laptop/catkin_ws/src/meno_matky_za_slobodna/srv/Stop.srv" NAME_WE)
add_dependencies(meno_matky_za_slobodna_generate_messages_nodejs _meno_matky_za_slobodna_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(meno_matky_za_slobodna_gennodejs)
add_dependencies(meno_matky_za_slobodna_gennodejs meno_matky_za_slobodna_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS meno_matky_za_slobodna_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(meno_matky_za_slobodna
  "/home/laptop/catkin_ws/src/meno_matky_za_slobodna/srv/Draw.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/meno_matky_za_slobodna
)
_generate_srv_py(meno_matky_za_slobodna
  "/home/laptop/catkin_ws/src/meno_matky_za_slobodna/srv/Stop.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/meno_matky_za_slobodna
)

### Generating Module File
_generate_module_py(meno_matky_za_slobodna
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/meno_matky_za_slobodna
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(meno_matky_za_slobodna_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(meno_matky_za_slobodna_generate_messages meno_matky_za_slobodna_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/laptop/catkin_ws/src/meno_matky_za_slobodna/srv/Draw.srv" NAME_WE)
add_dependencies(meno_matky_za_slobodna_generate_messages_py _meno_matky_za_slobodna_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/laptop/catkin_ws/src/meno_matky_za_slobodna/srv/Stop.srv" NAME_WE)
add_dependencies(meno_matky_za_slobodna_generate_messages_py _meno_matky_za_slobodna_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(meno_matky_za_slobodna_genpy)
add_dependencies(meno_matky_za_slobodna_genpy meno_matky_za_slobodna_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS meno_matky_za_slobodna_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/meno_matky_za_slobodna)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/meno_matky_za_slobodna
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(meno_matky_za_slobodna_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/meno_matky_za_slobodna)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/meno_matky_za_slobodna
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(meno_matky_za_slobodna_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/meno_matky_za_slobodna)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/meno_matky_za_slobodna
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(meno_matky_za_slobodna_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/meno_matky_za_slobodna)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/meno_matky_za_slobodna
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(meno_matky_za_slobodna_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/meno_matky_za_slobodna)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/meno_matky_za_slobodna\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/meno_matky_za_slobodna
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(meno_matky_za_slobodna_generate_messages_py std_msgs_generate_messages_py)
endif()
