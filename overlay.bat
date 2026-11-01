@echo off
rem Mo chua thanh mot cua so doc rieng de LIVE Studio "Quay man hinh cua so".
rem - Uu tien Chrome (LIVE Studio liet ke duoc cua so Chrome), khong co thi dung Edge.
rem - Ho so trinh duyet rieng: cac tuy chon duoi day moi co tac dung du trinh duyet dang mo.
rem - Khong cho Windows lam "ngu" cua so khi bi che (hinh khong bi dung).
rem - Tu phat tieng, khong can bam "Cham de nghe chuong mo".
rem - Cong go loi 9333 (chi may nay truy cap) de kiem tra am thanh, hinh ben trong cua so khi can.
rem Chay run.bat truoc de server dang chay.

set "BROWSER=msedge"
if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" set "BROWSER=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if exist "%LocalAppData%\Google\Chrome\Application\chrome.exe" set "BROWSER=%LocalAppData%\Google\Chrome\Application\chrome.exe"

start "" "%BROWSER%" --app=http://localhost:3939/overlay --window-size=608,1080 --user-data-dir="%TEMP%\chua-overlay-chrome" --disable-backgrounding-occluded-windows --disable-renderer-backgrounding --disable-background-timer-throttling --autoplay-policy=no-user-gesture-required --remote-debugging-port=9333
