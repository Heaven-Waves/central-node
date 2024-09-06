#!/bin/sh

docker build -t justivo/ansible ./config

docker compose up -d