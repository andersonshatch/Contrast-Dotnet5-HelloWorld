#!/usr/bin/env bash

echo "---Building app---"
dotnet publish dotnet5.csproj -f net5.0 -c Release
echo "---Building image---"
docker build . --iidfile .image-id
echo "---Running image---"
docker run -p 8080:8080 --env-file=contrast.env $(<.image-id)
