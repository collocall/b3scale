######################################################################
# @author      : annika (annika@berlin.ccc.de)
# @file        : Makefile
# @created     : Sunday Aug 16, 2020 19:24:54 CEST
######################################################################

update_openapi_static:
	go run ./cmd/b3scalectl export-openapi-schema > ./pkg/http/static/assets/docs/b3scale-openapi-v1.json


