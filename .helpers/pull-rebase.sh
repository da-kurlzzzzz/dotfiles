#!/usr/bin/env bash

git stash && git checkout main && git pull && git checkout - && git rebase main && git stash pop
