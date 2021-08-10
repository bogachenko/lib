@echo off

sc config "DiagTrack" start=disabled
sc stop DiagTrack
sc delete DiagTrack

sc config "dmwappushservice" start=disabled
sc stop dmwappushservice
sc delete dmwappushservice