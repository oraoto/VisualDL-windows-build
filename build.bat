call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars64.bat"

git clone https://github.com/PaddlePaddle/VisualDL.git
cd VisualDL
git checkout develop

set "PATH=%PYTHON%;%PYTHON%\\Scripts;%PATH%"
set "LIB=%PYTHON%\\libs;%LIB%"

python -m pip install --upgrade pip
pip install -r requirements.txt
pip install numpy==1.13 -U
python setup.py bdist_wheel
