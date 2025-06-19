#!/usr/bin/env bash
if curl --silent --fail http://localhost:8080/health; then
  echo "Service is up"
  exit 0
else
  echo "Service is down"
  exit 1
fi