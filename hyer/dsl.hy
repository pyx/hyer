;; -*- coding: utf-8 -*-
;; Copyright (c) 2014-2015, Philip Xu <pyx@xrefactor.com>
;; License: BSD New, see LICENSE for details.
"hyer.dsl - DSL"

;; routing DSL
(require hyer.macros.route)

;; application and blueprint factory
(require hyer.macros.factory)

;; utility macros
(require hyer.macros.utils)

;; helper functions to streamline factory macros

(defn register-blueprint [app bp &rest args &kwargs kwargs]
  (apply app.register-blueprint (cons bp args) kwargs))

(defn config-from-envvar [app config-envvar &rest args &kwargs kwargs]
  (apply app.config.from-envvar (cons config-filename args) kwargs))

(defn config-from-pyfile [app config-filename &rest args &kwargs kwargs]
  (apply app.config.from-pyfile (cons config-filename args) kwargs))

(defn config-from-object [app config-object &rest args &kwargs kwargs]
  (apply app.config.from-object (cons config-object args) kwargs))
