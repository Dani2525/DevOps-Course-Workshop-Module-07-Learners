FROM mcr.microsoft.com/dotnet/sdk:6.0
RUN apt-get -y update
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y node.js


COPY . /source  
WORKDIR /source
RUN dotnet build 
WORKDIR /source/DotnetTemplate.Web
RUN npm install
RUN npm run build
ENTRYPOINT ["dotnet", "run"]