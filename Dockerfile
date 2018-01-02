#
# Dockerfile for devise_password_policy_extension
#
# prompt> docker run -it dppe-dev
# prompt> pushd . && cd spec/rails-app
# prompt> gem install bundler && bundle install --jobs 20 --retry 5
# prompt> popd
# prompt> gem install bundler && bundle install --jobs 20 --retry 5
# prompt> rake spec
#
# NOTE: The order in which you run 'bundle install' in spec/rails and then in
# the top directory is important.
#
FROM circleci/ruby:2.4.2
LABEL maintainer="Mark Eissler <mark.eissler@valimail.com>"

ENV BUILD_HOME='/dppe-gem'

# Configure the main working directory. This is the base directory used in any
# further RUN, COPY, and ENTRYPOINT commands.
RUN sudo mkdir -p ${BUILD_HOME}
WORKDIR ${BUILD_HOME}

# Copy main application
COPY . ./

# Fix permissions on /gem directory
RUN set -x \
    && sudo chown -R circleci:circleci ${BUILD_HOME}

CMD ["/bin/bash"]