#!/usr/bin/env python

import os
import subprocess
from ranger.api.commands import Command


class show_git_tracked(Command):
    def execute(self):
        cwd = self.fm.thisdir.path
        stack = self.fm.thisdir.filter_stack

        if stack and getattr(stack[-1], '__name__', '') == 'git_tracked_filter':
            stack.pop()
            self.fm.thisdir.refilter()
            self.fm.notify("Git-tracked filter removed", duration=2)
            return

        try:
            repo_root = subprocess.check_output(
                ["git", "rev-parse", "--show-toplevel"],
                cwd=cwd,
                stderr=subprocess.DEVNULL,
            ).decode().strip()
        except subprocess.CalledProcessError:
            self.fm.notify("Not in a Git repository!", bad=True)
            return

        try:
            tracked_output = subprocess.check_output(
                [
                    "git", "ls-files",
                ],
                cwd=repo_root,
                stderr=subprocess.DEVNULL,
            ).decode(errors="replace")
        except Exception as e:
            self.fm.notify(f"git command failed: {e}", bad=True)
            return

        tracked_paths = {line.strip() for line in tracked_output.splitlines() if line.strip()}
        if not tracked_paths:
            self.fm.notify("No Git-tracked entries in this repository.", duration=3)
            return

        rel = os.path.relpath(cwd, repo_root)
        prefix = "" if rel == "." else rel + "/"

        tracked_basenames = set()
        for path in tracked_paths:
            if not path.startswith(prefix):
                continue
            remainder = path[len(prefix):]
            if not remainder:
                continue
            basename = remainder.split("/", 1)[0]
            tracked_basenames.add(basename)

        if not tracked_basenames:
            self.fm.notify("No tracked entries in current directory.", duration=3)
            return

        def git_tracked_filter(f):
            return f.basename in tracked_basenames

        git_tracked_filter.__name__ = "git_tracked_filter"

        stack.append(git_tracked_filter)
        self.fm.thisdir.refilter()

        self.fm.notify(
            f"Showing {len(tracked_basenames)} Git-tracked entr{'y' if len(tracked_basenames)==1 else 'ies'} — zG to toggle",
            duration=5,
        )
