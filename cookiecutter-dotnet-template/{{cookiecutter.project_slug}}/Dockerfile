FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 8080
ENV ASPNETCORE_URLS=http://+:8080

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["{{cookiecutter.project_slug}}.csproj", "./"]
RUN dotnet restore "./{{cookiecutter.project_slug}}.csproj"
COPY . .
RUN dotnet publish "./{{cookiecutter.project_slug}}.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "{{cookiecutter.project_slug}}.dll"]
