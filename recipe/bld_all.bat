@echo on

mkdir builddir

:: -wnx flags mean: --wheel --no-isolation --skip-dependency-check
%PYTHON% -m build -w -n -x ^
    -Cbuilddir=builddir ^
    -Csetup-args=-Dapp=true ^
    -Csetup-args=-Dnav=true ^
    -Csetup-args=-Duse-vtk=true
if %ERRORLEVEL% neq 0 exit 1

:: `pip install dist\pycgns*.whl` does not work on windows,
:: so use a loop; there's only one wheel in dist/ anyway
for /f %%f in ('dir /b /S .\dist') do (
    pip install %%f
    if %ERRORLEVEL% neq 0 exit 1
)
