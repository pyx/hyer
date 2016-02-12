;;; -*- coding: utf-8 -*-
;;; Copyright (c) 2014-2016, Philip Xu <pyx@xrefactor.com>
;;; License: BSD New, see LICENSE for details.
"hyer.macros.flask_sqlalchemy - macros for extension flask-sqlalchemy"

;;; NOTE: for performance's sake, these macros assume certain functions being
;;; imported before calling site

;;; helper macro for import
(defmacro import-flask-sqlalchemy []
  `(do
     (import [flask [flash]])))

(defmacro update-and-flash [user message]
  `(do
     (db.session.add ~user)
     (db.session.commit)
     (flash ~message)))
