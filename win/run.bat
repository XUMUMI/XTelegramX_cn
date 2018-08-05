@ECHO OFF 
".\jre1.8.0_171\bin\java.exe" -jar apktool.jar d base.apk
copy /Y .\values-zh-rCN\strings.xml .\base\res\values-zh-rCN\strings.xml
".\jre1.8.0_171\bin\java.exe" -jar apktool.jar b base
 move /Y .\base\dist\base.apk .\old.apk
".\jre1.8.0_171\bin\java.exe" -jar signapk.jar key.x509.pem key.pk8 old.apk new.apk
del .\old.apk
del /F /S /Q base
rd /S /Q base