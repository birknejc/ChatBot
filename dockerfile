# Use the official .NET image as a parent image
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80

# Use the SDK image for building
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["BlazorServerCorr/BlazorServerCorr.csproj", "BlazorServerCorr/"]
RUN dotnet restore "BlazorServerCorr/BlazorServerCorr.csproj"
COPY . .
WORKDIR "/src/BlazorServerCorr"
RUN dotnet build "BlazorServerCorr.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "BlazorServerCorr.csproj" -c Release -o /app/publish

# Copy the build artifacts into the base image
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "BlazorServerCorr.dll"]
