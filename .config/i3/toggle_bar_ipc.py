#!/usr/bin/env python3
import i3ipc

i3 = i3ipc.Connection()
bars = i3.get_bar_config_list()

for bar_id in bars:
    bar_config = i3.get_bar_config(bar_id)
    current_mode = bar_config.mode

    # Toggle between 'hide' and 'dock'
    new_mode = 'dock' if current_mode == 'hide' else 'hide'
    i3.command(f'bar mode {new_mode}')

