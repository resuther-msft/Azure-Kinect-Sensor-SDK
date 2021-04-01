
SET cv_version=4.5.0
SET retdir=%CD%

echo Cloning OpenCV and OpenCV Contrib and checking out version 4.5.0

cd C:\

git clone https://github.com/opencv/opencv
git -C opencv checkout %cv_version%

git clone https://github.com/opencv/opencv_contrib
git -C opencv_contrib checkout %cv_version%

echo Building OpenCV Release Version

cd opencv
mkdir build
cd build

cmake .. -GNinja -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules -DBUILD_opencv_world=ON -DCMAKE_BUILD_TYPE=Release -DBUILD_PERF_TESTS:BOOL=OFF -DBUILD_TESTS:BOOL=OFF -DCMAKE_INSTALL_PREFIX=c:/opencv/build

echo Installing OpenCV Release Version

cd ..

cmake --build c:/opencv/build --target install

echo DONE: Installing OpenCV Release Version

cd %retdir%