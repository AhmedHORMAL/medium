#!/bin/bash

# Config
KARATE_VERSION="1.1.0"
KARATE_JAR="karate-$KARATE_VERSION.jar"
KARATE_URL="https://github.com/karatelabs/karate/releases/download/v$KARATE_VERSION/$KARATE_JAR"
MOCK_FEATURE="articles.mock.feature"
PORT=8080

# Check if mock.feature file exists
if [ ! -f "$MOCK_FEATURE" ]; then
  echo "File '$MOCK_FEATURE' not found."
  exit 1
fi

# Download Karate if needed
if [ ! -f "$KARATE_JAR" ]; then
  echo "Downloading $KARATE_JAR ..."
  curl -L -o "$KARATE_JAR" "$KARATE_URL"
  if [ $? -ne 0 ]; then
    echo "Download failed."
    exit 1
  fi
fi

# Start the mock server
echo "Starting mock server on port $PORT ..."
java -jar "$KARATE_JAR" -m "$MOCK_FEATURE" -p "$PORT"
