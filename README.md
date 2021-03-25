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

## Output

If successful, you should see output similar to:

```
0x7f0573d095e6The Contrast .NET agent collects usage data in order to help us improve compatibility and security coverage. The data is anonymous and does not contain application data. It is collected by Contrast and is never shared. You can opt-out of telemetry by setting the CONTRAST_DOTNET_TELEMETRY_OPTOUT environment variable to '1' or 'true'. Read more about Contrast .NET agent telemetry: https://docs.contrastsecurity.com/en/-net-telemetry.html
           ___                             
       _.-|   |          |\__/,|   (`\     Contrast .NET Core Agent 1.8.1.0
      [   |   |          |o o  |__ _) )    
       `-.|___|        _.( T   )  `  /     Contrast UI: http://host.docker.internal:6080
        .--'-`-.     _((_ `^--' /_<  \     Mode:        Assess
      .+|______|__.-||__)`-'(((/  (((/     
```


If you see this instead, check your `contrast.env` for errors

```
---Running image---
0x7fdbb06675e6
  Zzzz.....     |\__/,|   (`\   Contrast .NET Core Agent 1.8.1.0
                |_ _  |.--.) )  
                ( T   )     /   Failed to initialize.
               (((^_(((/(((_>   
                                Please check the logs for errors.
```