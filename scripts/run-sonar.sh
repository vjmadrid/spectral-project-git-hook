#!/bin/bash

sonar-scanner -Dsonar.projectKey=my-project -Dsonar.sources=.

SONAR_URL="https://sonarqube.mycompany.com"
SONAR_API="/api/measures/component"
SONAR_PROJECT_KEY="my-project"
SONAR_METRIC="ncloc,complexity,bugs,vulnerabilities"
SONAR_QG_STATUS="OK"

ANALYSIS_ID=$(curl -s -u $SONAR_TOKEN: ${SONAR_URL}${SONAR_API}?component=${SONAR_PROJECT_KEY}&metricKeys=${SONAR_METRIC} | jq '.component.measures[].periods[0].value' | tr '\n' ',' | sed 's/,$//')
QUALITY_GATE=$(curl -s -u $SONAR_TOKEN: ${SONAR_URL}/api/qualitygates/project_status?analysisId=${ANALYSIS_ID} | jq '.projectStatus.status')

if [ "$QUALITY_GATE" != "\"$SONAR_QG_STATUS\"" ]; then
  echo "Quality gate failed - please fix code complexity and static analysis issues before committing"
  exit 1
fi