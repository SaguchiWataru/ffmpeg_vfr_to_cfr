ECHO OFF
 
:REPEAT
ffmpeg.exe -i %1 -crf 16 -r 60 -c:a copy "%~n1_H_264_CPUEnc_crf16_r60_audio_copy.mp4"

if "%~2"=="" GOTO EXIT
shift
GOTO REPEAT
:EXIT
pause
