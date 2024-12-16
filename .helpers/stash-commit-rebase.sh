#!/usr/bin/env bash

git stash && git checkout main && git stash pop && git commit -va && git checkout - && git rebase main
