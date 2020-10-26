FROM stevenk11/ibus

RUN apt-get update && apt-get install -y --no-install-recommends \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg \
	fonts-liberation \
	hicolor-icon-theme \
	libcanberra-gtk* \
	libexif-dev \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libpangox-1.0-0 \
	libv4l-0 \
	fonts-symbola \
	&& curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
	&& echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
	&& apt-get update && apt-get install -y --no-install-recommends \
	google-chrome-stable \
	&& apt-get purge --auto-remove -y curl \
	&& rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /usr/bin/startchromium

ENTRYPOINT ["/usr/bin/startchromium"]
