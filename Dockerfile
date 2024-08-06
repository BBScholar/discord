FROM fedora:40

RUN dnf update -y

RUN dnf install  -y curl wget git rpmdevtools rpmlint

RUN useradd -d /home/bot -ms /bin/bash bot
USER bot
WORKDIR /home/bot

COPY discord-logo-wordmark.png discord-logo-wordmark.png
COPY discord.desktop discord.desktop
COPY discord.spec discord.spec
COPY basic-checks.sh basic-checks.sh
COPY common-functions.sh common-functions.sh
COPY terminal-colors.sh terminal-colors.sh
COPY create-package.sh create-package.sh

CMD ["./create-package.sh", "stable"]
