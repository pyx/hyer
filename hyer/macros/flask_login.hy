;;; -*- coding: utf-8 -*-
;;; Copyright (c) 2014-2016, Philip Xu <pyx@xrefactor.com>
;;; License: BSD New, see LICENSE for details.
"hyer.macros.flask_login - macros for extension flask-login"

;;; NOTE: for performance's sake, these macros assume certain functions being
;;; imported before calling site

;;; helper macro for import
(defmacro import-flask-login []
  `(do
     (import [flask [current-app]])
     (import [flask-login [current-user]])))

;;; use this macro instead of flask_login.login_required decorator to work
;;; with GET, GET/POST routing macros
(defmacro login-required [&rest actions]
  `(if-not current-user.authenticated?
     (current-app.login-manager.unauthorized)
     (do ~@actions)))
