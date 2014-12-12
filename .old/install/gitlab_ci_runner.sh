https://github.com/pgolm/docker-gitlab-ci-runner/edit/master/Dockerfile
# install gitlab-ci-runner

WORKDIR 	/home/gitlab_ci_runner
RUN         git clone https://github.com/gitlabhq/gitlab-ci-runner.git runner
# Jan 02, 2014
ENV 		RUNNER_REVISION 08f2260ae87e101f72194a27229b249d126e35fe
RUN         cd runner && git checkout $RUNNER_REVISION && . $HOME/.profile && bundle install 

# prepare SSH
RUN         mkdir -p $HOME/.ssh

CMD 	cd $HOME/runner
CMD 		. ../.profile && ssh-keyscan -H $GITLAB_SERVER_FQDN >> $HOME/.ssh/known_hosts && bundle exec ./bin/setup_and_run
