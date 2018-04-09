execute_process(COMMAND "/opt/groot/new_libs/vision_opencv/vision_opencv-kinetic/image_geometry/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/opt/groot/new_libs/vision_opencv/vision_opencv-kinetic/image_geometry/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
