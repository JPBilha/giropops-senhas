#!/bin/bash

service redis-server start

flask run --host=0.0.0.0
