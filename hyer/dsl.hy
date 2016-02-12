;;; -*- coding: utf-8 -*-
;;; Copyright (c) 2014-2016, Philip Xu <pyx@xrefactor.com>
;;; License: BSD New, see LICENSE for details.
"hyer.dsl - DSL"

;;; routing DSL
(require hyer.macros.route)

;;; application and blueprint factory
(require hyer.macros.factory)

;;; macros for flask framework
(require hyer.macros.flask)

;;; macros for flask-login
(require hyer.macros.flask_login)

;;; macros for flask-sqlalchemy
(require hyer.macros.flask_sqlalchemy)

;;; macros for flask-wtf
(require hyer.macros.flask_wtf)

;;; utility macros
(require hyer.macros.utils)

(defmacro import-for-hyer-dsl []
  `(do
     (import-flask)
     (import-flask-login)
     (import-flask-sqlalchemy)
     (import-flask-wtf)))

;;; helper functions to streamline factory macros

(defn register-blueprint [app bp &rest args &kwargs kwargs]
  (apply app.register-blueprint (cons bp args) kwargs))

(defn config-from-envvar [app config-envvar &rest args &kwargs kwargs]
  (apply app.config.from-envvar (cons config-filename args) kwargs))

(defn config-from-pyfile [app config-filename &rest args &kwargs kwargs]
  (apply app.config.from-pyfile (cons config-filename args) kwargs))

(defn config-from-object [app config-object &rest args &kwargs kwargs]
  (apply app.config.from-object (cons config-object args) kwargs))
