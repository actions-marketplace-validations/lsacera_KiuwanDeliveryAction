#!/bin/sh -l

time=$(date)
echo ::set-output name=time::$time

#checking if java is installed in the image
echo "Checking the JRE Version"
java -version

#checking some env variables passed to docker run
echo "Input parameters, github automatically sets a input before"
#echo $INPUT_PROJECT
#echo $INPUT_LABEL
#echo $INPUT_USERID
#echo $INPUT_PASSWORD
#echo "Other parameters:"
#echo $GITHUB_WORKFLOW
#echo $INPUT_REPOSITORY
#echo $HOME
#echo $GITHUB_REF
#echo $GITHUB_SHA
#echo $GITHUB_REPOSITORY
#echo $GITHUB_RUN_ID
#echo $GITHUB_RUN_NUMBER
#echo $GITHUB_ACTOR
#echo $GITHUB_WORKFLOW
#echo $GITHUB_HEAD_REF
#echo $GITHUB_BASE_REF
#echo $GITHUB_EVENT_NAME
#echo $GITHUB_WORKSPACE
#echo $GITHUB_ACTION
#echo $GITHUB_EVENT_PATH
#echo $RUNNER_OS
#echo $RUNNER_TOOL_CACHE
#echo $RUNNER_TEMP
#echo $RUNNER_WORKSPACE
#echo $ACTIONS_RUNTIME_URL
#echo $ACTIONS_RUNTIME_TOKEN

# Download Kiuwan local analyzer
wget https://www.kiuwan.com/pub/analyzer/KiuwanLocalAnalyzer.zip
# Unzip Kiuwan local analyzer
unzip KiuwanLocalAnalyzer.zip -d $HOME/.
# Execute Kiuwan Baseline
echo "Executing analyzer with"
echo "--user " $INPUT_USERID 
echo "--pass " $INPUT_PASSWORD
echo "--sourcePath" $GITHUB_WORKSPACE 
echo "--softwareName" $INPUT_PROJECT 
echo "--create"
echo "--label " $INPUT_LABEL
$HOME/KiuwanLocalAnalyzer/bin/agent.sh --user $INPUT_USERID --pass $INPUT_PASSWORD --sourcePath \"$GITHUB_WORKSPACE\" --softwareName \"$INPUT_PROJECT\" --create --label \"$INPUT_LABEL\"
