==========================
Hyer - Hy enhanced routing
==========================


Introduction
============

Hyer is a collection of `Hy <http://hylang.org/>`_ macros
for `flask <http://flask.pocoo.org/>`_

*Okay, show me some code*

From :code:`examples/hello/app.hy`

.. code:: hy

  (import [flask [Flask]])

  (require hyer.dsl)

  (defn create-app []
    "application factory"
    (defapplication app
      (GET "/" index
        "Hello world")
      (GET "/<username>/" greeting
        (.format "Hello, {}!" username))
      (GET "/<int:a>+<int:b>/" addition
        (.format "{} + {} = {}" a b (+ a b)))))

  (defmain [&rest args]
    (-> create-app apply .run))

This is the same code in pure python:

.. code:: python

  from flask import Flask

  def create_app():
      """application factory"""
      app = Flask(__name__)

      @app.route('/')
      def index():
          return 'Hello world'

      @app.route('/<username>/')
      def greeting(username):
          return 'Hello, {}!'.format(username)

      @app.route('/<int:a>+<int:b>/')
      def addition(a, b):
          return '{} + {} = {}'.format(a, b, a + b)

      return app


  if __name__ == '__main__':
      create_app().run()


Requirements
============

- CPython >= 2.7
- flask
- hy >= 0.10.1


Installation
============

Install from PyPI::

  pip install hyer

In source directory, run::

  make install


License
=======

BSD New, see LICENSE for details.


Links
=====

Documentation:
  http://hyer.readthedocs.org/

Issue Tracker:
  https://bitbucket.org/pyx/hyer/issues/

Source Package @ PyPI:
  https://pypi.python.org/pypi/hyer/

Mercurial Repository @ bitbucket:
  https://bitbucket.org/pyx/hyer/

Git Repository @ Github:
  https://github.com/pyx/hyer/
