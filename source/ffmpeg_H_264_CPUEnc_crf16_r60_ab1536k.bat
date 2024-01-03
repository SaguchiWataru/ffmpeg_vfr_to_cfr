ECHO OFF
 
:REPEAT
ffmpeg.exe -i %1 -crf 16 -r 60 -ab 1536k "%~n1_H_264_CPUEnc_crf16_r60_ab1536k.mp4"

if "%~2"=="" GOTO EXIT
shift
GOTO REPEAT
:EXIT
pause
