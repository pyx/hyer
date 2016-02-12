#!/usr/bin/env hy
# -*- coding: utf-8 -*-
# Copyright (c) 2014-2016, Philip Xu <pyx@xrefactor.com>
# License: BSD New, see LICENSE for details.
"Hello world example"

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
