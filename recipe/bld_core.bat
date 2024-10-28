
"%PYTHON%" setup.py build --includes="%LIBRARY_PREFIX%\include" --libraries="%LIBRARY_PREFIX%\lib"  --app False --nav False
if errorlevel 1 exit 1

"%PYTHON%" setup.py install --prefix="%PREFIX%" --app False --nav False
if errorlevel 1 exit 1
