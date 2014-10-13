# DOCKER-VERSION 1.2.0

#
# BWP Dockerfile
#
# https://github.com/trunkclub/brunch-with-panache
# TODO: http://bitjudo.com/blog/2014/03/13/building-efficient-dockerfiles-node-dot-js/
#

# Pull base image
FROM dockerfile/nodejs

# Set environment variables
ENV NODE_ENV production
ENV BWP_VERSION 0.9.0

# Install BWP
RUN \
  cd /tmp && \
  wget https://github.com/trunkclub/brunch-with-panache/archive/$BWP_VERSION.tar.gz && \
  mkdir -p /brunch-with-panache && \
  tar --strip-components=1 -xzf $BWP_VERSION.tar.gz -C /brunch-with-panache && \
  rm -f $BWP_VERSION.tar.gz && \
  cd /brunch-with-panache && \
  npm install --$NODE_ENV

# Set working directory
WORKDIR /brunch-with-panache

# Define default command
CMD ["npm", "start"]

# Expose ports
EXPOSE 8080 9485
