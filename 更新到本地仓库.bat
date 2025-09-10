@echo off
cd /d %~dp0

echo base-java
powershell -c "(Get-Content 'base-java\Dockerfile') -replace 'FROM \${JITSI_REPO}/base:\${BASE_TAG}', 'FROM lianshufeng/meet-jitsi:base' | Set-Content 'base-java\Dockerfile'"


echo prosody
powershell -c "(Get-Content 'prosody\Dockerfile') -replace 'FROM \${JITSI_REPO}/base:\${BASE_TAG}', 'FROM lianshufeng/meet-jitsi:base' | Set-Content 'prosody\Dockerfile'"


echo web
powershell -c "(Get-Content 'web\Dockerfile') -replace 'FROM \${JITSI_REPO}/base:\${BASE_TAG}', 'FROM lianshufeng/meet-jitsi:base' | Set-Content 'web\Dockerfile'"

echo jicofo
powershell -c "(Get-Content 'jicofo\Dockerfile') -replace 'FROM \${JITSI_REPO}/base-java:\${BASE_TAG}', 'FROM lianshufeng/meet-jitsi:base-java' | Set-Content 'jicofo\Dockerfile'"

echo jvb
powershell -c "(Get-Content 'jvb\Dockerfile') -replace 'FROM \${JITSI_REPO}/base-java:\${BASE_TAG}', 'FROM lianshufeng/meet-jitsi:base-java' | Set-Content 'jvb\Dockerfile'"

echo jibri
powershell -c "(Get-Content 'jibri\Dockerfile') -replace 'FROM \${JITSI_REPO}/base-java:\${BASE_TAG}', 'FROM lianshufeng/meet-jitsi:base-java' | Set-Content 'jibri\Dockerfile'"



echo docker-compose.yml

powershell -c "(Get-Content 'docker-compose.yml') -replace 'image: jitsi/web:\${JITSI_IMAGE_VERSION:-unstable}', 'image: lianshufeng/meet-jitsi:web' | Set-Content 'docker-compose.yml'"

powershell -c "(Get-Content 'docker-compose.yml') -replace 'image: jitsi/prosody:\${JITSI_IMAGE_VERSION:-unstable}', 'image: lianshufeng/meet-jitsi:prosody' | Set-Content 'docker-compose.yml'"

powershell -c "(Get-Content 'docker-compose.yml') -replace 'image: jitsi/jicofo:\${JITSI_IMAGE_VERSION:-unstable}', 'image: lianshufeng/meet-jitsi:jicofo' | Set-Content 'docker-compose.yml'"

powershell -c "(Get-Content 'docker-compose.yml') -replace 'image: jitsi/jvb:\${JITSI_IMAGE_VERSION:-unstable}', 'image: lianshufeng/meet-jitsi:jvb' | Set-Content 'docker-compose.yml'"


echo jibri.yml
powershell -c "(Get-Content 'jibri.yml') -replace 'image: jitsi/jibri:\${JITSI_IMAGE_VERSION:-unstable}', 'image: lianshufeng/meet-jitsi:jibri' | Set-Content 'jibri.yml'"



:: 删掉工作流
:: rd /s /q .github

pause 