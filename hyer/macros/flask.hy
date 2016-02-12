;;; -*- coding: utf-8 -*-
;;; Copyright (c) 2014-2016, Philip Xu <pyx@xrefactor.com>
;;; License: BSD New, see LICENSE for details.
"hyer.macros.flask - macros for flask framework"

;;; NOTE: for performance's sake, these macros assume certain functions being
;;; imported before calling site

;;; helper macro for import
(defmacro import-flask []
  `(do
     (import [flask [redirect request url-for]])))

(defmacro redirect-to-next-or [url]
  `(redirect (or (request.args.get 'next) ~url)))

(defmacro redirect-to-next-or-view [view &rest args]
  `(redirect-to-next-or (url-for ~view ~@args)))

(defmacro redirect-to-view [view &rest args]
  `(redirect (url-for ~view ~@args)))
