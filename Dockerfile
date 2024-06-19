FROM ubuntu:20.04
LABEL authors="gokul"
# Install curl, tar, and xz
#RUN apk add --no-cache curl tar xz bash
#RUN apk add git
#RUN apk add openssh-client
#RUN apk add sshpass
#RUN apk add unzip 
#RUN apk add libglu1-mesa
#RUN apk add zip

# Set the environment variable for the Flutter version
ENV FLUTTER_VERSION=3.22.0

# Create the /flutter directory
RUN mkdir /flutter

# Download and extract the Flutter SDK
RUN curl -o flutter.tar.xz https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz && \
    tar -xf flutter.tar.xz -C /flutter --strip-components=1 && \
    rm flutter.tar.xz 

# Set environment variables
ENV PATH="/flutter/bin:$PATH"    

# Print Flutter version to verify installation
# RUN flutter --version

# inflate flutter
RUN flutter doctor