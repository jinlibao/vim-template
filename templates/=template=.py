#! /usr/bin/env python3
# -*- coding: utf-8 -*-
#
# %FFILE% - %FDATE%
#
# Copyright © %YEAR% %USER% <%MAIL%>
# Distributed under terms of the %LICENSE% license.
#
'''
%CLASS%
'''

import numpy as np
import scipy as sp
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.backends.backend_pdf import PdfPages


class %CLASS%(object):

    def __init__(self):
        plt.style.use('ggplot')
        plt.rc('text', usetex=True)
        plt.rc('font', family='serif')

    def plot(self, x, y, filename):
        with PdfPages(filename) as pdf:
            fig = plt.figure()
            plt.plot(x, y)
            plt.show(block=False)
            pdf.savefig(fig)

    def test(self):
        %HERE%


if __name__ == '__main__':
    c = %CLASS%()
    c.test()
'''
End of file
'''
