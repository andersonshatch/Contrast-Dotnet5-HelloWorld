FROM registry.access.redhat.com/ubi8/dotnet-50-runtime:latest as final
ADD bin/Release/net5.0/publish/ .

RUN uname -a
EXPOSE 80

#Copy the yaml configuration - optional, can set everything in env
#ADD /contrast_security.yaml ./contrast_security.yaml

#Set the environment vars to enable the agent
ENV CORECLR_PROFILER_PATH_64 ./contrast/runtimes/linux-x64/native/ContrastProfiler.so
ENV CORECLR_PROFILER {8B2CE134-0948-48CA-A4B2-80DDAD9F5791}
ENV CORECLR_ENABLE_PROFILING 1
ENV CONTRAST_CONFIG_PATH ./contrast_security.yaml
ENV CONTRAST__APPLICATION__NAME dotnet5
ENV CONTRAST__SERVER__NAME rh-ubi8
ENV ASPNETCORE_ENVIRONMENT Development
ENV CONTRAST_CORECLR_LOGS_DIRECTORY /opt/contrast/

ENTRYPOINT ["dotnet", "dotnet5.dll"]
