FROM gitpod/workspace-postgres

USER root
# Setup Heroku CLI
RUN curl https://cli-assets.heroku.com/install.sh | sh

# Setup Python linters
RUN pip3 install flake8 flake8-flask flake8-django

USER gitpod

# Upgrade Node

ENV NODE_VERSION=14.15.4
RUN bash -c ". .nvm/nvm.sh && \
        nvm install ${NODE_VERSION} && \
        nvm alias default ${NODE_VERSION} && \
        npm install -g yarn"
        
ENV PATH=/home/gitpod/.nvm/versions/node/v${NODE_VERSION}/bin:$PATH

# Local environment variables

ENV PORT="8080"
ENV IP="0.0.0.0"

USER root
# Switch back to root to allow IDE to load
