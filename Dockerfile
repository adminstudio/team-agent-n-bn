FROM jetbrains/teamcity-agent
LABEL maintainer="Asdrubal Gonzalez" \
    description="This image for testing frontend"
RUN apt update \
    && apt upgrade -y \
    && apt install apt-utils -y \
    && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends build-essential \
    && DEBIAN_FRONTEND=noninteractive apt install -y gconf-service \
    libasound2 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libc6 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libgcc1 \
    libgconf-2-4 \
    libgdk-pixbuf2.0-0 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libstdc++6 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    ca-certificates \
    fonts-liberation \
    libappindicator1 \
    libnss3 \
    lsb-release \
    xdg-utils \
    wget
RUN curl -sL https://deb.nodesource.com/setup_10.x -o /root/nodesource_setup.sh \
    && bash /root/nodesource_setup.sh \
    && DEBIAN_FRONTEND=noninteractive apt install nodejs -y \
    && npm install typescript -g \
    && DEBIAN_FRONTEND=noninteractive apt autoremove \
    && rm -rf /var/lib/apt/lists/*
