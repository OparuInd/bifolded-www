@echo off
rem Publish www.bifolded.com — replaces the old base44 iframe with the rebuilt home page.
cd /d "%~dp0"
for %%f in (.git\index.lock .git\HEAD.lock .git\objects\maintenance.lock) do if exist "%%f" del /f "%%f"
del /f /s /q .git\objects\*\tmp_obj_* >nul 2>&1
git add -A
git -c user.name="Squizz" -c user.email="ryan@oparuindustrial.com" commit -m "www.bifolded.com update" >nul 2>&1
git push --force origin main
if errorlevel 1 (echo. & echo PUSH FAILED - see above & pause & exit /b 1)
echo.
echo Pushed. GitHub Pages rebuilds in ~1 min: https://www.bifolded.com
pause
