
"%python%" setup.py build --includes="%LIBRARY_PREFIX%\include" --libraries="%LIBRARY_PREFIX%\lib"
if errorlevel 1 exit 1

"%python%" setup.py install --prefix="%PREFIX%"
if errorlevel 1 exit 1
