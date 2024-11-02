@echo on

mkdir corebuilddir

:: -wnx flags mean: --wheel --no-isolation --skip-dependency-check
%PYTHON% -m build -w -n -x ^
    -Cbuilddir=corebuilddir ^
    -Csetup-args=-Dapp=false ^
    -Csetup-args=-Dnav=false ^
    -Csetup-args=-Duse-vtk=false
if %ERRORLEVEL% neq 0 exit 1

:: `pip install dist\pycgns*.whl` does not work on windows,
:: so use a loop; there's only one wheel in dist/ anyway
for /f %%f in ('dir /b /S .\dist') do (
    pip install %%f
    if %ERRORLEVEL% neq 0 exit 1
)
