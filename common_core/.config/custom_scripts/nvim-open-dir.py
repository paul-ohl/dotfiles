#!/usr/bin/env python3
"""Open a folder in the current vim instance"""
from __future__ import print_function
import os
import sys

from neovim import attach

chosen_directory = sys.argv[1]
if chosen_directory:
    chosen_directory = os.path.abspath(chosen_directory)
else:
    chosen_directory = os.path.abspath('.')

addr = os.environ.get('NVIM_LISTEN_ADDRESS', None)
if not addr:
    os.execvp('nvim', ['nvim'] + [chosen_directory])

nvim = attach('socket', path=addr)

nvim.input('<c-\\><c-n>')  # exit terminal mode
nvim.command('call OpenDirectoryInTab(\'' + chosen_directory + '\')')

# def _setup():
#     nvim.input('<c-\\><c-n>')  # exit terminal mode
#     chid = nvim.channel_id
#     # nvim.command('augroup EDIT')
#     # nvim.command('au BufEnter <buffer> call rpcnotify({0}, "n")'.format(chid))
#     # nvim.command('au BufEnter <buffer> startinsert'.format(chid))
#     # nvim.command('augroup END')
#     # nvim.vars['files_to_edit'] = chosen_directory
#     # for x in chosen_directory:
#     #     nvim.command('exe "drop ".remove(g:files_to_edit, 0)')


# def _exit(*chosen_directory):
#     # nvim.vars['files_to_edit'] = None
#     # nvim.command('augroup EDIT')
#     # nvim.command('au!')
#     # nvim.command('augroup END')
#     nvim.stop_loop()


# nvim.run_loop(_exit, _exit, _setup)
