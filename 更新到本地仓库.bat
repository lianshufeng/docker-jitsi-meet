@echo off
cd /d %~dp0

echo base-java
powershell -c "(Get-Content 'base-java\Dockerfile') -replace 'FROM \${JITSI_REPO}/base:\${BASE_TAG}', 'FROM lianshufeng/meet-jits:base' | Set-Content 'base-java\Dockerfile'"


echo prosody
powershell -c "(Get-Content 'prosody\Dockerfile') -replace 'FROM \${JITSI_REPO}/base:\${BASE_TAG}', 'FROM lianshufeng/meet-jits:base' | Set-Content 'prosody\Dockerfile'"


echo web
powershell -c "(Get-Content 'web\Dockerfile') -replace 'FROM \${JITSI_REPO}/base:\${BASE_TAG}', 'FROM lianshufeng/meet-jits:base' | Set-Content 'web\Dockerfile'"

echo jicofo
powershell -c "(Get-Content 'jicofo\Dockerfile') -replace 'FROM \${JITSI_REPO}/base-java:\${BASE_TAG}', 'FROM lianshufeng/meet-jits:base-java' | Set-Content 'jicofo\Dockerfile'"

echo jvb
powershell -c "(Get-Content 'jvb\Dockerfile') -replace 'FROM \${JITSI_REPO}/base-java:\${BASE_TAG}', 'FROM lianshufeng/meet-jits:base-java' | Set-Content 'jvb\Dockerfile'"

pause 