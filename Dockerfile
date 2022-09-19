FROM maven

ADD pom.xml .
RUN mvn compile

FROM nginx:stable-alpine

WORKDIR /usr/share/nginx/html
COPY --from=0 /root/.m2/repository repository
RUN wget https://gerrit-ci.gerritforge.com/job/plugin-metrics-reporter-prometheus-bazel-master-stable-3.6/lastSuccessfulBuild/artifact/bazel-bin/plugins/metrics-reporter-prometheus/metrics-reporter-prometheus.jar \
 && wget https://gerrit-ci.gerritforge.com/job/plugin-metrics-reporter-prometheus-bazel-master-stable-3.6/lastSuccessfulBuild/artifact/bazel-bin/plugins/metrics-reporter-prometheus/metrics-reporter-prometheus.jar-version \
 && wget https://gerrit-ci.gerritforge.com/job/plugin-high-availability-bazel-master-stable-3.6/lastSuccessfulBuild/artifact/bazel-bin/plugins/high-availability/high-availability.jar \
 && wget https://gerrit-ci.gerritforge.com/job/plugin-high-availability-bazel-master-stable-3.6/lastSuccessfulBuild/artifact/bazel-bin/plugins/high-availability/high-availability.jar-version \
 && wget https://gerrit-ci.gerritforge.com/job/plugin-its-base-bazel-master-stable-3.5/lastSuccessfulBuild/artifact/bazel-bin/plugins/its-base/its-base.jar \
 && wget https://gerrit-ci.gerritforge.com/job/plugin-its-base-bazel-master-stable-3.5/lastSuccessfulBuild/artifact/bazel-bin/plugins/its-base/its-base.jar-version \
 && wget https://gerrit-ci.gerritforge.com/job/plugin-its-jira-bazel-stable-3.5/lastSuccessfulBuild/artifact/bazel-bin/plugins/its-jira/its-jira.jar \
 && wget https://gerrit-ci.gerritforge.com/job/plugin-its-jira-bazel-stable-3.5/lastSuccessfulBuild/artifact/bazel-bin/plugins/its-jira/its-jira.jar-version
