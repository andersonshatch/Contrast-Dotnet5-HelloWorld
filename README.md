# Hello World Dotnet 5 App with Contrast in RedHat UBI Container

## Requirements
- Docker
- Dotnet 5 local install

## Configuration
Enter values for your Contrast agent in contrast.env

## Steps to build & run in container

1. Clone repository
1. Build application: `dotnet publish dotnet5.csproj -f net5.0 -c Release`
1. Build container: `docker build . --iidfile .image-id`
1. Run container: `docker run -p 8080:8080 --env-file=contrast.env $(<.image-id)`

There is a script `run.sh` included to run all these steps.
