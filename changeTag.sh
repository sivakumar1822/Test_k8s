#!/bin/bash
sed "s/tagVersion/$1/g" deployment.yaml > tom-app-pod.yml
