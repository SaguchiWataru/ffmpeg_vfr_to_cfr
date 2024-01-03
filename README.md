# ffmpegで動画の可変フレームレート(VFR)を固定フレームレート(CFR)に変換するbatファイル

## 作った理由

iPhone 8 で撮影できる映像は可変フレームレート(VFR)のmovファイルです。  
そのため、Adobe Premiere Pro やBlackmagic Design DaVinci Resolve などの動画編集ソフトで編集すると音ズレが発生します。  
この問題を解消するためには、可変フレームレート(VFR)から固定フレームレート(CFR)に変換する必要があります。  
動画変換ソフトで変換する事も可能ですが、頻繁に動画を変換する身としては、動画変換ソフトの設定を毎回確認する事が手間なためbatファイルを作成しました。  

## 特徴

* 動画ファイルを bat ファイルにドラッグ＆ドドロップするだけで自動で変換してくれます
* 複数の動画をまとめてドラッグ＆ドロップできます
* 画質や音質の設定も出力先の設定もする必要がありません
* 一般的に使われている動画変換ソフトのパラメータよりも画質と音質を優先しました

## 仕様

* 入力パス : カレントディレクトリ
* 出力パス : カレントディレクトリ
* ffmpeg.exeのディレクトリ : カレントディレクトリ
* 動画ファイルのディレクトリ : カレントディレクトリ
* crf値 (画質) : 16 (値が小さいほど高画質・容量増)
* r値 (フレームレート) : 60fps (テレビのバラエティー番組と同等)
* ab (音声のビットレート) : 1536kbps (CDは1411kbpsのため、CDより綺麗)

ちょっとやり過ぎなくらい画質と音質を優先しました。  

## ダウンロード
  
上記の仕様と同じファイルは以下です。  
[ffmpeg_H_264_CPUEnc_crf16_r60_ab1536k.bat](https://github.com/SaguchiWataru/ffmpeg_vfr_to_cfr/blob/master/source/ffmpeg_H_264_CPUEnc_crf16_r60_ab1536k.bat)  
  
映像のみ変換し、オーディオはソースをコピーするbatファイルも作成しました。より音質の劣化を防ぐことができます。  
[ffmpeg_H_264_CPUEnc_crf16_r60_audio_copy.bat](https://github.com/SaguchiWataru/ffmpeg_vfr_to_cfr/blob/master/source/ffmpeg_H_264_CPUEnc_crf16_r60_audio_copy.bat)  
  
ffmpeg.exeは別途公式サイトからダウンロードしてください。  
[FFmpeg公式サイト](https://ffmpeg.org/download.html)  
  
※細心の注意を払って作成しましたが、いかなる損害を保証いたしかねます。  

## ソースコード

```bat:ffmpeg_H_264_CPUEnc_crf16_r60_ab1536k.bat
ECHO OFF
 
:REPEAT
ffmpeg.exe -i %1 -crf 16 -r 60 -ab 1536k "%~n1_H_264_CPUEnc_crf16_r60_ab1536k.mp4"

if "%~2"=="" GOTO EXIT
shift
GOTO REPEAT
:EXIT
pause
```

## ソースコード(映像のみ変換し、オーディオはソースをコピー)

```bat:ffmpeg%20H_264_CPUEnc_crf16_r60_audio_copy.bat
ECHO OFF
 
:REPEAT
ffmpeg.exe -i %1 -crf 16 -r 60 -c:a copy "%~n1_H_264_CPUEnc_crf16_r60_audio_copy.mp4"

if "%~2"=="" GOTO EXIT
shift
GOTO REPEAT
:EXIT
pause
```
