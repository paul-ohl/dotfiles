#!/usr/bin/env python3
"""Edit a file in the host nvim instance."""
from __future__ import print_function
import os
import sys

from neovim import attach

args = [sys.argv[1]]
if args:
    args = [os.path.abspath(f) for f in args]

addr = os.environ.get('NVIM_LISTEN_ADDRESS', None)
if not addr:
    os.execvp('nvim', ['nvim'] + args if args else ['nvim'])

nvim = attach('socket', path=addr)


def _setup():
    nvim.input('<c-\\><c-n>')  # exit terminal mode
    chid = nvim.channel_id
    nvim.command('augroup EDIT')
    nvim.command('au BufEnter <buffer> call rpcnotify({0}, "n")'.format(chid))
    nvim.command('au BufEnter <buffer> startinsert'.format(chid))
    nvim.command('augroup END')
    nvim.vars['files_to_edit'] = args
    for x in args:
        nvim.command('exe "drop ".remove(g:files_to_edit, 0)')


def _exit(*args):
    nvim.vars['files_to_edit'] = None
    nvim.command('augroup EDIT')
    nvim.command('au!')
    nvim.command('augroup END')
    nvim.stop_loop()


nvim.run_loop(_exit, _exit, _setup)
