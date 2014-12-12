install(){
# switch priveleges
RUN 		adduser --disabled-login --gecos 'GitLab CI Runner' gitlab_ci_runner
USER		gitlab_ci_runner
ENV 		HOME /home/gitlab_ci_runner
}
