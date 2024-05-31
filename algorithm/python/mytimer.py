#!/usr/bin/env python3
# # -*- coding: UTF-8 -*-"
# ------------------------------------------------
#   Creation Date:    27-02-2017
#     Last Change: ter 29 nov 2016 09:21:52 BRT
# this script aim:  decorator to count function execution
#          author:  sergio luiz araujo silva
#            site:  http://vivaotux.blogspot.com
#         twitter:  @voyeg3r
# ------------------------------------------------

import time


def my_timer(orig_fun):
    import time

    def wrapper(*args, **kwargs):
        t1 = time.time()
        result = orig_fun(*args, **kwargs)
        t2 = time.time() - t1
        print(f'{orig_fun} ran in: {t2} sec')
        return result

    return wrapper
