#!/bin/sh

echo "Now listening on"
dotnet Panel.dll --urls=https://${EXTERNAL_IP}:5001/
