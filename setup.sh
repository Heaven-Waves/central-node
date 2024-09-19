#!/bin/sh

docker build -t justivo/ansible . \
    && docker compose up -d