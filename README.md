# pd-observer

Python module that updates a Slack chat room topic with the current on-call for a pagerduty schedule.

This module is based on [pd-oncall-chat-topic](https://github.com/PagerDuty/pd-oncall-chat-topic) by the nice folks at Pagerduty. If you have access to run lambda I'd advice you to use their project.

Small changes apply to this particular code:

* We use the [/oncalls](https://v2.developer.pagerduty.com/page/api-reference#!/On-Calls/get_oncalls) endpoint of the pagerduty v2 API
* We assume that each user will update their names in pagerduty match their slack handle

# Requirements

1. Obtain a Slack API token from a Bot [Directions Here](https://my.slack.com/services/new/bot)
2. Obtain a PagerDuty API Key (v2) [Directions Here](https://support.pagerduty.com/docs/using-the-api#section-generating-an-api-key)
3. Get the unique ID of the Slack channel which you want to manage the topic (Not the name)
4. Get the unique ID of the Pagerduty schedule that you want to monitor (Not the name)

# USAGE

### Running pd_observer as a standalone script in Cron

```shell
pd_observer -t <SLACK_TOKEN_ID> -A <PAGERDUTY_API_KEY> -S <PD_SCHEDULE_ID> -C <SLACK_CHANNEL_ID>
```

### Running pd_observer in Cron with a HTTP_PROXY

```shell
HTTPS_PROXY=http://proxy:3128 pd_observer -t <SLACK_TOKEN_ID> -A <PAGERDUTY_API_KEY> -S <PD_SCHEDULE_ID> -C <SLACK_CHANNEL_ID>
```

### Running pd_observer as a docker container (Dockerfile provided)

```shell
docker run -it docker -t <SLACK_TOKEN_ID> -A <PAGERDUTY_API_KEY> -S <PD_SCHEDULE_ID> -C <SLACK_CHANNEL_ID>
```
