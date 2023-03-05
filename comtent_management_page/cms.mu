#!/usr/bin/python3
#!c=0
# ^^^^ <--> Nomadnet specific to prevent page caching, may change if you like.

import os
import yaml
from datetime import datetime

###################################################
#        Path to config.yaml below:
config_path = '/path/to/config.yaml'
###################################################


config_file = open(config_path, 'r')
config = yaml.safe_load(config_file)


##for e in os.environ:
##    print(os.environ[e])
##    print(e)

time_now = datetime.now().strftime('%H:%M %B %d, %Y')

title = '```B' + str(config['site']['title_bar_rgb']) + '`=`!`c' + config['site']['title'] + '`! \n`=' + config['site']['title_sub_line'] + '\n`=``'

header = '''
-~
`c
''' + title + '''
`a
-~'''

menu_items = ''

for p in config['pages']:
##    print(p)
    menu_items = menu_items + '`!`[<' + p + '>`:/page/index.mu`page=' + p + ']`! | '
    
menu = '''`c` ''' + menu_items + ' `*Time: ' + time_now + '''`*
-~
`a
'''

footer = '''
-~
`c`B''' + config['site']['footer_bar_rgb'] + config['site']['footer']


print(header)
print(menu)

try:
    if not os.environ['var_page'] or os.environ['var_page'] == 'Home':

        with open(config['pages']['Home']['file']) as page_file: p = page_file.read()
        print(p)
    else:
        with open(config['pages'][os.environ['var_page']]['file']) as page_file: p = page_file.read()
        print(p)
except:
    with open(config['pages']['Home']['file']) as page_file: p = page_file.read()
    print(p)
    
print(footer)




