FROM python:2.7-jessie

ADD . pd_observer

RUN cd pd_observer \
    && pip install -e .

ENTRYPOINT [ "pd_observer" ]
