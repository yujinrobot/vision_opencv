#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/opt/groot/new_libs/vision_opencv/vision_opencv-kinetic/cv_bridge"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/usr/local/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/usr/local/lib/python2.7/dist-packages:/opt/groot/new_libs/vision_opencv/vision_opencv-kinetic/cv_bridge/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/opt/groot/new_libs/vision_opencv/vision_opencv-kinetic/cv_bridge" \
    "/usr/bin/python" \
    "/opt/groot/new_libs/vision_opencv/vision_opencv-kinetic/cv_bridge/setup.py" \
    build --build-base "/opt/groot/new_libs/vision_opencv/vision_opencv-kinetic/cv_bridge" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/usr/local" --install-scripts="/usr/local/bin"
