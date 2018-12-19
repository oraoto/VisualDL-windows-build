REM Setup MSVC
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars64.bat"

REM Clone VisualDL
git clone https://github.com/oraoto/VisualDL.git
cd VisualDL
git checkout d2452a3f056dccadf16593532f0873da96f86734

REM Setup environment variables
set "PATH=%PYTHON%;%PYTHON%\\Scripts;%PATH%"
set "LIB=%PYTHON%\\libs;%LIB%"

REM Install python dependencies
python -m pip install --upgrade pip
pip install wheel
pip install -r requirements.txt

Rem Python 3.6.6 in AppVeyor has issue with numpy 1.14
pip install numpy==1.15 -U

Rem Build
python setup.py bdist_wheel
