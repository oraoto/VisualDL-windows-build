REM Setup MSVC
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars64.bat"

REM Clone VisualDL
git clone https://github.com/PaddlePaddle/VisualDL.git
cd VisualDL
git checkout 2004503342f1c5fafb26307513ef2d90f17b4fd0

REM Setup environment variables
set "PATH=%PYTHON%;%PYTHON%\\Scripts;%PATH%"
set "LIB=%PYTHON%\\libs;%LIB%"

REM Install python dependencies
python -m pip install --upgrade pip
pip install wheel
pip install -r requirements.txt

Rem Python 3.6.6 in AppVeyor has issue with numpy 1.14
pip install numpy==1.13 -U

Rem Build
python setup.py bdist_wheel
