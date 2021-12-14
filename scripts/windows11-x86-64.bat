@echo off

:: Windows 11 Build 22000.318 x86_64
:: Author: Bogachenko Vyacheslav <bogachenkove@gmail.com>

:: Diagnostic Policy Service
sc config "DiagTrack" start=disabled
sc stop DiagTrack
sc delete DiagTrack

:: Diagnostic Execution Service
sc config "diagsvc" start=disabled
sc stop diagsvc
sc delete diagsvc

:: WAP-push Service
sc config "dmwappushservice" start=disabled
sc stop dmwappushservice
sc delete dmwappushservice

:: Diagnostics Hub Standard Collector Service
sc config "diagnosticshub.standardcollector.service" start=disabled
sc stop diagnosticshub.standardcollector.service
sc delete diagnosticshub.standardcollector.service

:: Network Connection Broker Service
sc config "NcbService" start=disabled
sc stop NcbService
sc delete NcbService