# -*- coding: utf-8 -*-
import sys
from os import path
from distutils.core import setup

if sys.version_info < (2, 7):
    sys.exit('hyer requires Python 2.7 or higher')

ROOT_DIR = path.abspath(path.dirname(__file__))
sys.path.insert(0, ROOT_DIR)

from hyer import VERSION
from hyer import __doc__ as DESCRIPTION
LONG_DESCRIPTION = open(path.join(ROOT_DIR, 'README.rst')).read()

HYSRC = ['**.hy']

setup(
    name='hyer',
    version=VERSION,
    description=DESCRIPTION,
    long_description=LONG_DESCRIPTION,
    author='Philip Xu',
    author_email='pyx@xrefactor.com',
    url='https://bitbucket.org/pyx/hyer/',
    download_url=(
        'https://bitbucket.org/pyx/hyer/get/%s.tar.bz2' % VERSION),
    classifiers=[
        'Development Status :: 4 - Beta',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: BSD License',
        'Operating System :: OS Independent',
        'Programming Language :: Python :: 2',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.3',
        'Programming Language :: Python :: 3.4',
        'Topic :: Software Development :: Libraries :: Python Modules',
    ],
    install_requires=[
        'hy>=0.10.1',
    ],
    extras_require={
        'dev': [
            'twine',
        ],
        'doc': [
            'Sphinx>=1.2.3',
        ],
        'test': [
            'pytest>=2.6.4',
            'pytest-cov>=1.8.1',
        ],
    },
    packages=['hyer', 'hyer.macros'],
    package_data={'hyer': HYSRC, 'hyer.macros': HYSRC},
    license='BSD-New',
)
